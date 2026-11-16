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
  int? _currentPort;

  // ==========================================
  // PAIRING
  // ==========================================

  @override
  Future<PairingPayload> generatePairingPayload(String displayName) async {
    final ip = await _getLocalIp();
    if (ip == null) {
      throw Exception(
        'Tidak terhubung ke jaringan Wi-Fi/LAN. '
        'Sambungkan perangkat ke jaringan yang sama.',
      );
    }

    final token = _uuid.v4();
    _activeToken = token;

    final port = await _findFreePort();
    _currentPort = port;
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
    } catch (_) {}
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
    } catch (_) {}
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
        switch (request.uri.path) {
          case '/pair':
            if (request.method == 'POST') {
              await _handlePairRequest(request);
            } else {
              await _sendResponse(
                request,
                HttpStatus.methodNotAllowed,
                'Method not allowed',
              );
            }
            break;
          case '/sync/events':
            if (request.method == 'GET') {
              await _handleGetEvents(request);
            } else if (request.method == 'POST') {
              await _handlePostEvents(request);
            } else {
              await _sendResponse(
                request,
                HttpStatus.methodNotAllowed,
                'Method not allowed',
              );
            }
            break;
          default:
            await _sendResponse(request, HttpStatus.notFound, 'Not found');
        }
      } catch (e) {
        try {
          await _sendResponse(
            request,
            HttpStatus.internalServerError,
            'Error: $e',
          );
        } catch (_) {}
      }
    });
  }

  // ==========================================
  // SERVER: PAIRING
  // ==========================================

  Future<void> _handlePairRequest(HttpRequest request) async {
    final body = await utf8.decoder.bind(request).join();
    final payload = jsonDecode(body) as Map<String, dynamic>;
    final token = payload['oneTimeToken'] as String?;
    final peerDeviceId = payload['deviceId'] as String?;
    final peerDisplayName = payload['displayName'] as String?;
    final peerPort = payload['myPort'] as int?;

    if (token != _activeToken) {
      return _sendResponse(
        request,
        HttpStatus.forbidden,
        'Invalid or expired token',
      );
    }
    if (peerDeviceId == null || peerDisplayName == null) {
      return _sendResponse(request, HttpStatus.badRequest, 'Missing fields');
    }

    final clientIp = request.connectionInfo?.remoteAddress.address;

    await _upsertDevice(
      peerDeviceId,
      peerDisplayName,
      ipAddress: clientIp,
      port: peerPort,
    );

    await _sendResponse(
      request,
      HttpStatus.ok,
      jsonEncode({
        'deviceId': localDeviceId,
        'displayName': localDisplayName,
        'myPort': _currentPort,
      }),
    );
  }

  Future<void> _sendResponse(
    HttpRequest request,
    int statusCode,
    String body,
  ) async {
    request.response
      ..statusCode = statusCode
      ..headers.contentType = ContentType.json
      ..write(body);
    await request.response.close();
  }

  // ==========================================
  // SERVER: SYNC EVENTS
  // ==========================================

  Future<void> _handleGetEvents(HttpRequest request) async {
    final sinceEventId = request.uri.queryParameters['sinceEventId'];

    var query = _db.select(_db.syncEvents)
      ..orderBy([(t) => OrderingTerm.asc(t.createdAt)]);

    if (sinceEventId != null && sinceEventId.isNotEmpty) {
      final cursor = await (_db.select(
        _db.syncEvents,
      )..where((t) => t.id.equals(sinceEventId))).getSingleOrNull();
      if (cursor != null) {
        query = query
          ..where((t) => t.createdAt.isBiggerThanValue(cursor.createdAt));
      }
    }

    final events = await query.get();
    final response = events.map(_eventToJson).toList();
    await _sendResponse(request, HttpStatus.ok, jsonEncode(response));
  }

  Future<void> _handlePostEvents(HttpRequest request) async {
    final body = await utf8.decoder.bind(request).join();
    final events = (jsonDecode(body) as List).cast<Map<String, dynamic>>();

    var applied = 0;
    var skipped = 0;

    for (final eventJson in events) {
      final appliedEvent = await _applyIncomingEvent(eventJson);
      if (appliedEvent) {
        applied++;
      } else {
        skipped++;
      }
    }

    await _sendResponse(
      request,
      HttpStatus.ok,
      jsonEncode({'applied': applied, 'skipped': skipped}),
    );
  }

  Map<String, dynamic> _eventToJson(SyncEvent e) => {
    'id': e.id,
    'entityType': e.entityType,
    'entityId': e.entityId,
    'operation': e.operation,
    'baseRevision': e.baseRevision,
    'newRevision': e.newRevision,
    'payloadJson': e.payloadJson,
    'deviceId': e.deviceId,
    'createdAt': e.createdAt.toIso8601String(),
    'idempotencyKey': e.idempotencyKey,
  };

  Future<bool> _applyIncomingEvent(Map<String, dynamic> json) async {
    final idempotencyKey = json['idempotencyKey'] as String;

    final existing = await (_db.select(
      _db.syncEvents,
    )..where((t) => t.idempotencyKey.equals(idempotencyKey))).getSingleOrNull();
    if (existing != null) return false;

    final entityType = json['entityType'] as String;
    final operation = json['operation'] as String;
    final entityId = json['entityId'] as String;
    final newRevision = json['newRevision'] as int;
    final payload =
        jsonDecode(json['payloadJson'] as String) as Map<String, dynamic>;

    if (entityType == 'student') {
      final localStudent = await (_db.select(
        _db.students,
      )..where((t) => t.id.equals(entityId))).getSingleOrNull();

      if (localStudent != null && localStudent.revision >= newRevision) {
        return false;
      }

      if (operation == 'delete') {
        if (localStudent != null) {
          await (_db.update(
            _db.students,
          )..where((t) => t.id.equals(entityId))).write(
            StudentsCompanion(
              deletedAt: Value(DateTime.parse(payload['deletedAt'] as String)),
              revision: Value(newRevision),
              updatedAt: Value(DateTime.parse(payload['updatedAt'] as String)),
            ),
          );
        }
      } else {
        await _db
            .into(_db.students)
            .insertOnConflictUpdate(
              StudentsCompanion.insert(
                id: entityId,
                displayName: payload['displayName'] as String,
                notes: Value(payload['notes'] as String?),
                createdByDeviceId: Value(
                  payload['createdByDeviceId'] as String,
                ),
                revision: Value(newRevision),
              ),
            );
      }
    }

    await _db
        .into(_db.syncEvents)
        .insert(
          SyncEventsCompanion.insert(
            id: json['id'] as String,
            entityType: entityType,
            entityId: entityId,
            operation: operation,
            baseRevision: json['baseRevision'] as int,
            newRevision: newRevision,
            payloadJson: json['payloadJson'] as String,
            deviceId: json['deviceId'] as String,
            idempotencyKey: idempotencyKey,
          ),
        );

    return true;
  }

  // ==========================================
  // CLIENT: PAIRING & PEERS
  // ==========================================

  @override
  Future<void> startPairingServer() async {}

  @override
  Future<SyncPeer> completePairing(PairingPayload remotePayload) async {
    final myPort = await _findFreePort();
    _currentPort = myPort;
    await _startServer(myPort);

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
            'myPort': myPort,
          }),
        )
        .timeout(const Duration(seconds: 10));

    if (response.statusCode != 200) {
      throw Exception('Pairing ditolak: ${response.body}');
    }

    final body = jsonDecode(response.body) as Map<String, dynamic>;
    final remoteDeviceId = body['deviceId'] as String;
    final remoteDisplayName = body['displayName'] as String;

    await _upsertDevice(
      remoteDeviceId,
      remoteDisplayName,
      ipAddress: remotePayload.ipAddress,
      port: remotePayload.port,
    );

    return SyncPeer(
      deviceId: remoteDeviceId,
      displayName: remoteDisplayName,
      ipAddress: remotePayload.ipAddress,
      port: remotePayload.port,
      isTrusted: true,
    );
  }

  Future<void> _upsertDevice(
    String id,
    String displayName, {
    String? ipAddress,
    int? port,
  }) async {
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
          .insert(
            SyncPeersCompanion.insert(
              id: _uuid.v4(),
              peerDeviceId: id,
              ipAddress: Value(ipAddress),
              port: Value(port),
            ),
          );
    } else {
      await (_db.update(_db.devices)..where((t) => t.id.equals(id))).write(
        DevicesCompanion(
          isTrusted: const Value(true),
          lastSeenAt: Value(DateTime.now()),
        ),
      );
      if (ipAddress != null && port != null) {
        await (_db.update(
          _db.syncPeers,
        )..where((t) => t.peerDeviceId.equals(id))).write(
          SyncPeersCompanion(ipAddress: Value(ipAddress), port: Value(port)),
        );
      }
    }
  }

  @override
  Future<List<SyncPeer>> listPeers() async {
    final query = _db.select(_db.syncPeers).join([
      innerJoin(
        _db.devices,
        _db.devices.id.equalsExp(_db.syncPeers.peerDeviceId),
      ),
    ])..where(_db.devices.isTrusted.equals(true));

    final rows = await query.get();

    return rows.map((row) {
      final peer = row.readTable(_db.syncPeers);
      final device = row.readTable(_db.devices);
      return SyncPeer(
        deviceId: device.id,
        displayName: device.displayName,
        ipAddress: peer.ipAddress ?? '',
        port: peer.port ?? 0,
        isTrusted: device.isTrusted,
      );
    }).toList();
  }

  // ==========================================
  // CLIENT: SYNC
  // ==========================================

  @override
  Future<int> syncWithPeer(SyncPeer peer) async {
    if (peer.ipAddress.isEmpty || peer.port == 0) {
      throw Exception('Alamat peer tidak diketahui. Pairing ulang diperlukan.');
    }

    final baseUrl = 'http://${peer.ipAddress}:${peer.port}';

    final peerRecord = await (_db.select(
      _db.syncPeers,
    )..where((t) => t.peerDeviceId.equals(peer.deviceId))).getSingleOrNull();
    final lastSyncedEventId = peerRecord?.lastSyncedEventId;

    var outboundQuery = _db.select(_db.syncEvents)
      ..where((t) => t.deviceId.equals(localDeviceId))
      ..orderBy([(t) => OrderingTerm.asc(t.createdAt)]);

    if (lastSyncedEventId != null) {
      final cursor = await (_db.select(
        _db.syncEvents,
      )..where((t) => t.id.equals(lastSyncedEventId))).getSingleOrNull();
      if (cursor != null) {
        outboundQuery = outboundQuery
          ..where((t) => t.createdAt.isBiggerThanValue(cursor.createdAt));
      }
    }

    final outboundEvents = await outboundQuery.get();

    if (outboundEvents.isNotEmpty) {
      final pushResponse = await http
          .post(
            Uri.parse('$baseUrl/sync/events'),
            headers: {'Content-Type': 'application/json'},
            body: jsonEncode(outboundEvents.map(_eventToJson).toList()),
          )
          .timeout(const Duration(seconds: 15));

      if (pushResponse.statusCode != 200) {
        throw Exception('Push gagal: ${pushResponse.body}');
      }

      if (peerRecord != null) {
        await (_db.update(
          _db.syncPeers,
        )..where((t) => t.id.equals(peerRecord.id))).write(
          SyncPeersCompanion(
            lastSyncedEventId: Value(outboundEvents.last.id),
            lastSyncAt: Value(DateTime.now()),
          ),
        );
      }
    }

    final sinceParam = lastSyncedEventId != null
        ? '?sinceEventId=$lastSyncedEventId'
        : '';
    final pullResponse = await http
        .get(Uri.parse('$baseUrl/sync/events$sinceParam'))
        .timeout(const Duration(seconds: 15));

    if (pullResponse.statusCode != 200) {
      throw Exception('Pull gagal: ${pullResponse.body}');
    }

    final incoming = (jsonDecode(pullResponse.body) as List)
        .cast<Map<String, dynamic>>();
    var applied = 0;
    for (final event in incoming) {
      final ok = await _applyIncomingEvent(event);
      if (ok) applied++;
    }

    await (_db.update(
      _db.devices,
    )..where((t) => t.id.equals(peer.deviceId))).write(
      DevicesCompanion(
        lastSeenAt: Value(DateTime.now()),
        lastSyncAt: Value(DateTime.now()),
      ),
    );

    return applied;
  }

  Future<void> dispose() async {
    await _server?.close(force: true);
    _server = null;
  }
}
