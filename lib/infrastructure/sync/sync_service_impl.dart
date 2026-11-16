import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:drift/drift.dart';
import 'package:http/http.dart' as http;
import 'package:network_info_plus/network_info_plus.dart';
import 'package:uuid/uuid.dart';

import '../../domain/sync/pairing_payload.dart';
import '../../domain/sync/sync_peer.dart';
import '../../domain/sync/sync_service.dart';
import '../database/app_database.dart' hide SyncPeer;

class SyncServiceImpl implements SyncService {
  SyncServiceImpl(
    this._db, {
    required this.localDeviceId,
    required this.localDisplayName,
  });

  final AppDatabase _db;
  final String localDeviceId;
  final String localDisplayName;
  final _uuid = const Uuid();
  final _networkInfo = NetworkInfo();

  HttpServer? _server;
  String? _activeToken;

  @override
  Future<PairingPayload> generatePairingPayload(String displayName) async {
    final ip = await _getLocalIp();
    if (ip == null) {
      throw Exception(
        'Tidak terhubung ke jaringan Wi-Fi/LAN. Sambungkan perangkat ke jaringan yang sama.',
      );
    }

    final token = _uuid.v4();
    _activeToken = token;

    // Cari port bebas di rentang 51000-59000
    final port = await _findFreePort();
    await _startServer(port);

    return PairingPayload(
      deviceId: localDeviceId,
      displayName: displayName,
      ipAddress: ip,
      port: port,
      oneTimeToken: token,
    );
  }

  Future<String?> _getLocalIp() async {
    try {
      final wifiIp = await _networkInfo.getWifiIP();
      if (wifiIp != null && wifiIp.isNotEmpty) return wifiIp;
    } catch (_) {
      // Lanjut ke fallback
    }

    try {
      final interfaces = await NetworkInterface.list(
        type: InternetAddressType.IPv4,
        includeLoopback: false,
      );
      for (final iface in interfaces) {
        for (final addr in iface.addresses) {
          if (!addr.address.startsWith('169.254')) {
            return addr.address;
          }
        }
      }
    } catch (_) {
      // Fallback juga gagal
    }
    return null;
  }

  Future<int> _findFreePort() async {
    for (var port = 51000; port < 59000; port++) {
      try {
        final server = await HttpServer.bind(
          InternetAddress.anyIPv4,
          port,
          shared: false,
        );
        await server.close(force: true);
        return port;
      } catch (_) {
        continue;
      }
    }
    throw Exception('Tidak ada port bebas tersedia.');
  }

  Future<void> _startServer(int port) async {
    await _server?.close(force: true);
    _server = await HttpServer.bind(InternetAddress.anyIPv4, port);

    _server!.listen((request) async {
      try {
        if (request.method == 'POST' && request.uri.path == '/pair') {
          final body = await utf8.decoder.bind(request).join();
          final payload = jsonDecode(body) as Map<String, dynamic>;
          final token = payload['oneTimeToken'] as String?;
          final peerDeviceId = payload['deviceId'] as String?;
          final peerDisplayName = payload['displayName'] as String?;

          if (token != _activeToken) {
            request.response
              ..statusCode = HttpStatus.forbidden
              ..write('Invalid or expired token');
            await request.response.close();
            return;
          }

          if (peerDeviceId == null ||
              peerDeviceId.isEmpty ||
              peerDisplayName == null ||
              peerDisplayName.isEmpty) {
            request.response
              ..statusCode = HttpStatus.badRequest
              ..write('Missing deviceId or displayName');
            await request.response.close();
            return;
          }

          await _upsertDevice(peerDeviceId, peerDisplayName);

          request.response
            ..statusCode = HttpStatus.ok
            ..headers.contentType = ContentType.json
            ..write(
              jsonEncode({
                'deviceId': localDeviceId,
                'displayName': localDisplayName,
              }),
            );
          await request.response.close();
        } else {
          request.response
            ..statusCode = HttpStatus.notFound
            ..write('Not found');
          await request.response.close();
        }
      } catch (e) {
        try {
          request.response
            ..statusCode = HttpStatus.internalServerError
            ..write('Error: $e');
          await request.response.close();
        } catch (_) {
          // Response mungkin sudah ditutup
        }
      }
    });
  }

  @override
  Future<void> startPairingServer() async {
    // No-op: server dimulai oleh generatePairingPayload
  }

  @override
  Future<SyncPeer> completePairing(PairingPayload remotePayload) async {
    final response = await http
        .post(
          Uri.parse(
            'http://${remotePayload.ipAddress}:${remotePayload.port}/pair',
          ),
          headers: {'Content-Type': 'application/json'},
          body: jsonEncode({
            'deviceId': localDeviceId,
            'displayName': localDisplayName,
            'oneTimeToken': remotePayload.oneTimeToken,
          }),
        )
        .timeout(const Duration(seconds: 10));

    if (response.statusCode != 200) {
      throw Exception('Pairing ditolak: ${response.body}');
    }

    final body = jsonDecode(response.body) as Map<String, dynamic>;
    final remoteDeviceId = body['deviceId'] as String;
    final remoteDisplayName = body['displayName'] as String;

    await _upsertDevice(remoteDeviceId, remoteDisplayName);

    return SyncPeer(
      deviceId: remoteDeviceId,
      displayName: remoteDisplayName,
      ipAddress: remotePayload.ipAddress,
      port: remotePayload.port,
      isTrusted: true,
    );
  }

  Future<void> _upsertDevice(String id, String displayName) async {
    final existing = await (_db.select(
      _db.devices,
    )..where((t) => t.id.equals(id))).getSingleOrNull();

    if (existing == null) {
      await _db
          .into(_db.devices)
          .insert(
            DevicesCompanion.insert(
              id: id,
              displayName: displayName,
              isTrusted: const Value(true),
            ),
          );
      await _db
          .into(_db.syncPeers)
          .insert(SyncPeersCompanion.insert(id: _uuid.v4(), peerDeviceId: id));
    } else {
      await (_db.update(_db.devices)..where((t) => t.id.equals(id))).write(
        DevicesCompanion(
          isTrusted: const Value(true),
          lastSeenAt: Value(DateTime.now()),
        ),
      );
    }
  }

  @override
  Future<List<SyncPeer>> listPeers() async {
    final devices = await (_db.select(
      _db.devices,
    )..where((t) => t.isTrusted.equals(true))).get();

    return devices
        .map(
          (d) => SyncPeer(
            deviceId: d.id,
            displayName: d.displayName,
            ipAddress: '',
            port: 0,
            isTrusted: true,
          ),
        )
        .toList();
  }

  @override
  Future<int> syncWithPeer(SyncPeer peer) async {
    throw UnimplementedError('Sync transfer akan diimplementasikan di Sesi 3');
  }

  Future<void> dispose() async {
    await _server?.close(force: true);
    _server = null;
  }
}
