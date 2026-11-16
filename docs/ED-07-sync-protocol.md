# ED-07 — Sync Protocol Design (v0.1)

Status: Draft untuk implementasi Phase 11-13
Acuan: Blueprint v1.2 (Bagian 13), DEC-005, DEC-017

## 1. Prinsip
- **Event-based**: setiap perubahan menghasilkan event dengan ID unik (UUID).
- **Idempotent**: pengulangan event tidak menggandakan data.
- **Peer-to-peer**: tidak ada server pusat; perangkat saling bertukar event.
- **Offline-first**: sync hanya jalan saat Wi-Fi/LAN aktif; tidak wajib.
- **Data siswa tetap di perangkat asal**: sync hanya opsional.

## 2. Komponen
1. **Pairing**: pertukaran identitas perangkat (Device A ↔ Device B).
2. **Discovery**: menemukan peer di jaringan lokal via UDP broadcast.
3. **Handshake**: verifikasi identitas dan enkripsi transport.
4. **Event Exchange**: kirim event baru sejak cursor terakhir.
5. **Conflict Resolution**: per-entity policy (append-only, conflict-record, atau manual review).

## 3. Protokol Pairing
- Device A menampilkan QR berisi: `deviceId | ipAddress | port | oneTimeToken`.
- Device B memindai QR.
- Device B mengirim request `POST /pair` ke `http://ipAddress:port/pair` dengan `oneTimeToken`.
- Device A memverifikasi token (berumur 5 menit), membalas dengan `deviceId` miliknya.
- Kedua device menyimpan peer di tabel `devices` (baru) dengan status `paired`.

## 4. Protokol Sync
- Setelah pairing, kedua device dapat saling memanggil endpoint:
  - `GET /sync/cursor?sinceEventId=X` → daftar event baru.
  - `POST /sync/events` → kirim batch event.
- Setiap event memiliki `idempotency_key`. Server (peer penerima) menyimpan event yang sudah diterima dan tidak akan memproses ulang.

## 5. Kebijakan Konflik (per entity_type)
| Entity | Policy |
|---|---|
| student_attempt, student_answer | Append-only, dedup by id |
| knowledge_item, question, template | Conflict record, minta guru review |
| student (nama) | Conflict record |
| deleted | Tombstone; restore = event baru |

## 6. Tabel Baru (Skema v6)
- `devices`: `id`, `displayName`, `lastSeenAt`, `isTrusted`, `lastSyncAt`.
- `sync_peers`: relasi antar device yang sudah paired.
- `sync_cursors`: `peerId`, `lastReceivedEventId`.

## 7. Keamanan
- Token pairing sekali pakai, expired 5 menit.
- Transport: HTTP over LAN (untuk MVP) atau HTTPS self-signed (Phase lanjut).
- Tidak pernah kirim data siswa ke luar jaringan lokal.
- Sync bisa dimatikan di Pengaturan.
