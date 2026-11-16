import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/widgets/app_snackbar.dart';
import '../../../core/widgets/empty_state.dart';
import 'sync_providers.dart';

class PeerListScreen extends ConsumerStatefulWidget {
  const PeerListScreen({super.key});

  @override
  ConsumerState<PeerListScreen> createState() => _PeerListScreenState();
}

class _PeerListScreenState extends ConsumerState<PeerListScreen> {
  Future<void> _syncWithPeer(String deviceId, String displayName) async {
    try {
      final peers = await ref.read(syncServiceProvider).listPeers();
      final peer = peers.firstWhere((p) => p.deviceId == deviceId);

      if (peer.ipAddress.isEmpty) {
        if (mounted) {
          AppSnackbar.error(
            context,
            'Alamat peer tidak diketahui. Pairing ulang diperlukan.',
          );
        }
        return;
      }

      final applied = await ref.read(syncServiceProvider).syncWithPeer(peer);

      if (mounted) {
        AppSnackbar.success(
          context,
          'Sync dengan $displayName selesai. $applied event diterima.',
        );
      }
    } catch (e) {
      if (mounted) {
        AppSnackbar.error(context, 'Sync gagal: $e');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Peer Tersinkronisasi'),
        backgroundColor: Colors.teal,
        foregroundColor: Colors.white,
      ),
      body: FutureBuilder(
        future: ref.read(syncServiceProvider).listPeers(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          }

          final peers = snapshot.data ?? [];
          if (peers.isEmpty) {
            return const EmptyState(
              icon: Icons.devices_other,
              title: 'Belum Ada Peer',
              description: 'Lakukan pairing dengan perangkat lain melalui menu Sinkronisasi.',
            );
          }

          return ListView.builder(
            padding: const EdgeInsets.all(12),
            itemCount: peers.length,
            itemBuilder: (context, index) {
              final peer = peers[index];
              return Card(
                margin: const EdgeInsets.only(bottom: 12),
                child: ListTile(
                  leading: const CircleAvatar(
                    backgroundColor: Colors.teal,
                    child: Icon(Icons.devices, color: Colors.white),
                  ),
                  title: Text(peer.displayName),
                  subtitle: Text('ID: ${peer.deviceId}'),
                  trailing: IconButton(
                    icon: const Icon(Icons.sync, color: Colors.teal),
                    onPressed: () =>
                        _syncWithPeer(peer.deviceId, peer.displayName),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
