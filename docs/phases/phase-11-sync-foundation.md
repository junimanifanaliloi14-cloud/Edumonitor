# Phase 11 — Sync Foundation (v0.2.0)

**Status:** SELESAI (kode + test)
**Tanggal:** 16 November 2026
**Acuan:** Blueprint hal. 16, ED-07, DEC-005, DEC-017

## Ringkasan
Fondasi sinkronisasi peer-to-peer via Wi-Fi/LAN. Guru memindai QR antar
dua perangkat untuk pairing, lalu menyinkronkan data siswa secara dua
arah melalui HTTP lokal. Device ID dipersistenkan di tabel AppSettings
sehingga pairing bertahan setelah aplikasi di-restart.

## Yang Selesai

### Schema (v6 → v9)
- v6: `devices`, `sync_peers`, `sync_cursors`
- v7: kolom `last_synced_event_id` di `sync_peers`
- v8: kolom `ip_address`, `port` di `sync_peers`
- v9: tabel `app_settings` (key-value) untuk Device ID persisten

### Kode
- `lib/domain/sync/` — PairingPayload, SyncPeer, SyncService
- `lib/infrastructure/sync/sync_service_impl.dart` — HTTP server, pairing,
  sync events, applyIncomingEvent, bidirectional pairing
- `lib/core/providers/device_id_provider.dart` — `getOrCreateDeviceId(db)`
- `lib/features/sync/presentation/` — SyncScreen, PeerListScreen
- `lib/infrastructure/database/repositories/student_repository_impl.dart` —
  mencatat `SyncEvent` pada create/update/delete student
- `lib/main.dart` — baca/generate Device ID di startup

### Dependency baru
`network_info_plus`, `qr_flutter`, `mobile_scanner`, `http`.

## Gate Kelulusan

| Gate | Status |
|---|---|
| Schema v9 tervalidasi test | PASS |
| Pairing payload + HTTP server | PASS |
| SyncEvent recording (Students) | PASS |
| Idempotency (dedup by key) | PASS |
| Device ID persisten | PASS |
| 15/15 test lulus | PASS |
| CI hijau | PASS |
| E2E di 2 perangkat fisik | **BELUM** |

## Tech Debt
1. E2E belum diuji di 2 perangkat fisik (hanya test otomatis).
2. Sync hanya entity Students.
3. Konflik = last-write-wins by revision (belum ada conflict UI).
4. Transport HTTP plaintext di LAN.
5. Tidak ada UI hapus peer.
6. Device ID berubah jika DB dihapus (uninstall/reinstall).
