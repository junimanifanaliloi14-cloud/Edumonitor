import 'pairing_payload.dart';
import 'sync_peer.dart';

abstract interface class SyncService {
  /// Menyiapkan payload pairing (berisi IP lokal, port, token sekali pakai).
  Future<PairingPayload> generatePairingPayload(String displayName);

  /// Memulai server HTTP lokal untuk menerima pairing.
  Future<void> startPairingServer();

  /// Mengirim permintaan pairing ke peer lain dari payload hasil scan QR.
  Future<SyncPeer> completePairing(PairingPayload remotePayload);

  /// Daftar peer yang sudah paired.
  Future<List<SyncPeer>> listPeers();

  /// Melakukan sync (kirim & terima event) dengan peer tertentu.
  Future<int> syncWithPeer(SyncPeer peer);
}
