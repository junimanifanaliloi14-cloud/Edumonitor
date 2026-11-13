# ED-03 — Product Decision Log

**Status:** Baseline v1.1 (Diperbarui dengan ED-05)
**Tanggal:** 13 November 2026

## Cara Pakai
Setiap keputusan produk/arsitektur dicatat dengan ID, status, konteks, keputusan, konsekuensi. Keputusan berstatus **Dikunci** tidak boleh diubah tanpa persetujuan eksplisit.

## Decision Records

| ID | Keputusan | Status |
|---|---|---|
| DEC-001 | Teacher-only MVP. Siswa tidak login. Aplikasi siswa fase lanjutan. | Dikunci |
| DEC-002 | Local teacher profile, single-user MVP. | Dikunci |
| DEC-003 | Setiap device mandiri; PC coordinator opsional. | Dikunci |
| DEC-004 | Share package ZIP + manifest JSON + checksum. | Dikunci |
| DEC-005 | Sinkronisasi Wi-Fi/LAN ditunda. | Dikunci |
| DEC-006 | Format dokumen MVP: PDF digital, DOCX, TXT. | Dikunci |
| DEC-007 | Generic Engine penuh; Math/Physics/Bio/Chemistry stub + kontrak. | Dikunci |
| DEC-008 | Tipe knowledge MVP: concept, fact, relation, sequence, passage. | Dikunci |
| DEC-009 | Bentuk soal MVP: pilihan ganda + jawaban singkat. | Dikunci |
| DEC-010 | Mastery konfigurabel, bukan hard-coded. | Dikunci |
| DEC-011 | Bahasa UI default Indonesia. | Dikunci |
| DEC-012 | Data siswa tidak pernah masuk share package. | Dikunci |
| DEC-013 | Backup/restore lokal wajib; restore diverifikasi. | Dikunci |
| DEC-014 | AI tidak ada di MVP. | Dikunci |
| DEC-015 | Rule builder deklaratif, allowlist, sandbox. | Dikunci |
| DEC-016 | Historical assessment/answer immutable. | Dikunci |
| DEC-017 | Event-based sync (untuk fase sync). | Dikunci |
| DEC-018 | Generator deterministik dengan seed + provenance. | Dikunci |
| DEC-019 | Format `content_json` wajib menggunakan skema terstruktur (sealed class: TextBlock, FormulaBlock, dll), bukan HTML atau string tunggal. | Dikunci |
| DEC-020 | Enkripsi database at-rest (SQLCipher) ditunda. MVP mengandalkan enkripsi OS (BitLocker/FBE) + PIN aplikasi. | Dikunci |
| DEC-021 | `knowledge_items.content` disimpan sebagai JSON terstruktur (bukan Markdown bebas) untuk memfasilitasi algoritma generator. | Dikunci |

## Keputusan Terbuka (Belum Final)
*(Diisi dari waktu ke waktu, jangan diasumsikan oleh AI)*
- OPEN-01: Cakupan kurikulum awal (jenjang/kelas).
- OPEN-02: Skema rule deklaratif final (ED-11).
- OPEN-03: Kontrak engine Dart final (ED-13).
- OPEN-04: Threat model share package (ED-06).
- OPEN-05: Kebijakan retensi data siswa.