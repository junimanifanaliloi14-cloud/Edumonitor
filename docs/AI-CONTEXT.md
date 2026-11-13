# AI-CONTEXT — Handoff untuk AI berikutnya

## Posisi saat ini
Phase 1A — Foundation di GitHub Codespaces.

## Keputusan aktif (tidak boleh diubah tanpa persetujuan)
- DEC-001: Teacher-only MVP. Siswa tidak login. Aplikasi siswa fase lanjutan.
- DEC-004: Share package ZIP + manifest JSON + checksum.
- DEC-007: Generic Engine penuh; Math/Physics/Bio/Chemistry stub + kontrak.
- DEC-014: AI tidak ada di MVP.
- DEC-015: Rule builder deklaratif, allowlist, sandbox.
- DEC-016: Historical assessment/answer immutable.

## Lingkungan
- Ubuntu 24.04, Codespaces, 2 CPU, 7.8 GB RAM, 19 GB free.
- Flutter stable, Android SDK, JDK 17 (override Java 25).
- Windows build TIDAK bisa di Codespaces — harus diuji di PC lokal.

## File kunci
- docs/ED-01-SRS.md, ED-03-decision-log.md, ED-04-architecture.md, ED-22-test-strategy.md
- lib/core/, lib/domain/, lib/engines/contract/, lib/infrastructure/database/

## Next step
Bootstrap proyek Flutter, skeleton arsitektur, database POC, CI baseline.

## Aturan
- Tidak ada langkah tanpa dicatat di PROGRESS.md.
- Tidak ada dependency baru tanpa verifikasi versi.
- Tidak ada klaim test berhasil tanpa output nyata.

## Versi terkunci
- Flutter 3.47.9 (stable)
- Dart 3.13.7
- Android SDK 36.0.0, build-tools 36.0.0
- JDK 17 (via JAVA_HOME override; Java 25 tetap ada tapi tidak dipakai Flutter)
- Org: com.edumonitor, project: edumonitor
- Platform: android, windows

## Status Phase 1A
Bootstrap selesai. APK debug terbangun. Berikutnya: skeleton arsitektur (core, engines, contract) lalu database POC Drift.

## DEC tambahan (melengkapi daftar di atas)
- DEC-002: Local teacher profile, single-user MVP.
- DEC-003: Setiap device mandiri; PC coordinator opsional.
- DEC-005: Sinkronisasi Wi-Fi/LAN ditunda.
- DEC-006: Format dokumen MVP: PDF digital, DOCX, TXT.
- DEC-008: Tipe knowledge MVP: concept, fact, relation, sequence, passage.
- DEC-009: Bentuk soal MVP: pilihan ganda + jawaban singkat.
- DEC-010: Mastery konfigurabel, bukan hard-coded.
- DEC-011: Bahasa UI default Indonesia.
- DEC-012: Data siswa tidak pernah masuk share package.
- DEC-013: Backup/restore lokal wajib; restore diverifikasi.
- DEC-017: Event-based sync (untuk fase sync).
- DEC-018: Generator deterministik dengan seed + provenance.

## Catatan Phase 1A
Bootstrap selesai. APK debug terbangun di build/app/outputs/flutter-apk/app-debug.apk. Next: skeleton arsitektur (core, engines, contract) + database POC Drift + CI baseline.

## Risiko terbuka
- RISK-01 (2026-11-13): sqlite3_flutter_libs 0.6.0+eol dan sqlcipher_flutter_libs 0.7.0+eol adalah paket End of Life. Drift 2.35.4 masih resolve ke paket ini. POC Phase 1A masih pakai, tapi sebelum Phase 2 perlu audit: (a) apakah sqlite3_native_assets sudah viable, (b) apakah build Android API 35+ dan Windows aman, (c) apakah perlu alternatif paket. Jangan upgrade major drift tanpa audit ini.

## Hasil audit dependency Drift (2026-11-13)
- sqlite3_flutter_libs 0.6.0+eol TIDAK berisi kode (removed all code). Hanya deklarasi kosong.
- Drift 2.32.0+ tidak membutuhkan sqlite3_flutter_libs. sqlite3 3.x membundel SQLite via hooks.
- Tindakan: sqlite3_flutter_libs dan sqlcipher_flutter_libs DIHAPUS dari pubspec.yaml. drift_flutter masih mendeklarasikannya tapi tidak berbahaya.
- RISK-01 (sqlite3_flutter_libs EOL) DITUTUP. Tidak ada risiko keamanan karena paket EOL tidak berisi kode.

## Database POC (2026-11-13)
- lib/infrastructure/database/app_database.dart: schema POC students+subjects, schemaVersion=1
- app_database.g.dart di-generate via build_runner. Jangan diedit manual.
- sqlite3 3.9.1 dev dependency (dipakai test untuk verifikasi versi native lib)
- Schema ini POC. Schema penuh (kurikulum, knowledge, soal, asesmen, progres, sinkronisasi) masuk Phase 2+.

## Phase 1A selesai (2026-11-13)
- CI hijau pada commit 1f546d2.
- Exit audit: docs/phases/phase-1a-foundation.md
- Phase 1B checklist: docs/phases/phase-1b-local-checklist.md (eksekusi di PC Windows lokal + tablet Android)
- Jangan mulai Phase 2 sebelum Phase 1B lulus dan dilaporkan.
