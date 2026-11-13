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
