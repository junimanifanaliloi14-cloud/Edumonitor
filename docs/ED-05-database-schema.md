# ED-05 — Database Schema Draft (v0.1)

**Status:** Draft untuk persetujuan
**Acuan:** Master Blueprint v1.2 (Bagian 12), ED-01 SRS v1.0
**Teknologi:** SQLite via Drift (Flutter)
**Tanggal:** 13 November 2026

## 1. Prinsip Dasar Database
1. **Identity:** Gunakan UUID v4 (TEXT) untuk semua Primary Key. Jangan gunakan auto-increment (INTEGER) sebagai global identity.
2. **Audit & Sync Wajib:** Hampir semua tabel harus memiliki kolom standar:
   - `id` (TEXT, PK)
   - `created_at` (DATETIME)
   - `updated_at` (DATETIME)
   - `created_by_device_id` (TEXT)
   - `revision` (INT, default 1)
   - `deleted_at` (DATETIME, nullable — untuk soft-delete/tombstone)
3. **Immutability:** Tabel snapshot (soal/asesmen historis) tidak boleh memiliki `updated_at` atau `revision`. Sekali dibuat, tidak boleh diubah.
4. **File Store:** File besar (PDF, gambar, backup) disimpan di filesystem. Database hanya menyimpan metadata, path, dan hash/checksum.

---

## 2. Entity Relationship Diagram (High-Level)

```mermaid
erDiagram
    STUDENTS ||--o{ STUDENT_ATTEMPTS : "takes"
    SUBJECTS ||--o{ CHAPTERS : "has"
    CHAPTERS ||--o{ TOPICS : "has"
    TOPICS ||--o{ KNOWLEDGE_ITEMS : "contains"
    SOURCE_DOCUMENTS ||--o{ DOCUMENT_VERSIONS : "has"
    DOCUMENT_VERSIONS ||--o{ DOCUMENT_CHUNKS : "has"
    DOCUMENT_CHUNKS ||--o{ KNOWLEDGE_ITEMS : "extracts"
    KNOWLEDGE_ITEMS ||--o{ QUESTIONS : "generates"
    QUESTIONS ||--o{ QUESTION_SNAPSHOTS : "freezes to"
    ASSESSMENTS ||--o{ ASSESSMENT_SNAPSHOTS : "freezes to"
    QUESTION_SNAPSHOTS ||--o{ ASSESSMENT_ITEMS : "included in"
    ASSESSMENT_SNAPSHOTS ||--o{ ASSESSMENT_ITEMS : "has"
    STUDENT_ATTEMPTS ||--o{ STUDENT_ANSWERS : "contains"
    SYNC_EVENTS ||--o{ CONFLICT_RECORDS : "raises"

---

## 3. Kelompok Entitas & Skema Tabel

### 3.1 Identity & Learning Context
- **`students`**
  - `id` (TEXT, PK)
  - `display_name` (TEXT) — Nama panggilan/nama siswa
  - `notes` (TEXT, nullable) — Catatan umum guru
  - *Standard columns* (created_at, dll)
- **`subjects`**
  - `id` (TEXT, PK)
  - `name` (TEXT) — cth: Matematika, Biologi
  - `engine_id` (TEXT) — relasi ke engine registry (generic, math, dll)
- **`chapters`**
  - `id` (TEXT, PK)
  - `subject_id` (TEXT, FK)
  - `name` (TEXT)
- **`topics`**
  - `id` (TEXT, PK)
  - `chapter_id` (TEXT, FK)
  - `name` (TEXT)
- **`competencies`** (Tujuan Pembelajaran)
  - `id` (TEXT, PK)
  - `topic_id` (TEXT, FK)
  - `description` (TEXT)

### 3.2 Documents & Knowledge
- **`source_documents`**
  - `id` (TEXT, PK)
  - `title` (TEXT)
  - `file_path` (TEXT) — path di file store lokal
  - `file_hash` (TEXT) — SHA-256 untuk deteksi duplikasi/korupsi
  - `file_type` (TEXT) — pdf, docx, txt
- **`document_versions`**
  - `id` (TEXT, PK)
  - `document_id` (TEXT, FK)
  - `version_number` (INT)
  - `extracted_at` (DATETIME)
- **`document_chunks`** (Teks hasil ekstraksi)
  - `id` (TEXT, PK)
  - `version_id` (TEXT, FK)
  - `page_number` (INT, nullable)
  - `sequence` (INT) — urutan paragraf
  - `text_content` (TEXT)
  - `locator` (TEXT) — cth: "page:12;offset:450"
- **`knowledge_items`**
  - `id` (TEXT, PK)
  - `topic_id` (TEXT, FK)
  - `type` (TEXT) — concept, fact, relation, sequence, passage
  - `content` (TEXT) — isi pengetahuan (JSON atau teks)
  - `status` (TEXT) — extracted, draft, teacher_reviewed, verified, rejected
  - `source_chunk_id` (TEXT, FK, nullable) — dari mana knowledge ini diekstrak
- **`knowledge_sources`**
  - `id` (TEXT, PK)
  - `knowledge_id` (TEXT, FK)
  - `chunk_id` (TEXT, FK)
  - `quote` (TEXT) — kutipan persis dari sumber

### 3.3 Questions & Assessments
- **`questions`** (Entitas hidup/aktif)
  - `id` (TEXT, PK)
  - `topic_id` (TEXT, FK)
  - `generator_id` (TEXT) — mesin mana yang membuat
  - `status` (TEXT) — draft, pending_review, approved, rejected
  - `content_json` (TEXT) — struktur QuestionContent (blocks, schema)
  - `answer_json` (TEXT) — struktur jawaban benar
  - `difficulty_estimate` (REAL, nullable)
- **`question_snapshots`** (Immutable / Historis)
  - `id` (TEXT, PK)
  - `question_id` (TEXT, FK)
  - `content_json` (TEXT) — salinan persis saat disetujui
  - `answer_json` (TEXT)
  - `provenance_json` (TEXT) — sumber knowledge, seed, versi template
  - `created_at` (DATETIME)
  - *(Tidak ada updated_at / revision)*
- **`assessments`** (Paket ujian/latihan)
  - `id` (TEXT, PK)
  - `title` (TEXT)
  - `status` (TEXT) — draft, active, completed
- **`assessment_snapshots`**
  - `id` (TEXT, PK)
  - `assessment_id` (TEXT, FK)
  - `created_at` (DATETIME)
- **`assessment_items`** (Menghubungkan asesmen dengan snapshot soal)
  - `id` (TEXT, PK)
  - `assessment_snapshot_id` (TEXT, FK)
  - `question_snapshot_id` (TEXT, FK)
  - `sequence` (INT)
  - `weight` (REAL)

### 3.4 Student Progress
- **`student_attempts`** (Sesi pengerjaan)
  - `id` (TEXT, PK)
  - `student_id` (TEXT, FK)
  - `assessment_snapshot_id` (TEXT, FK)
  - `started_at` (DATETIME)
  - `completed_at` (DATETIME, nullable)
  - `actor_type` (TEXT) — "teacher-recorded" (untuk MVP)
- **`student_answers`** (Jawaban per soal)
  - `id` (TEXT, PK)
  - `attempt_id` (TEXT, FK)
  - `question_snapshot_id` (TEXT, FK)
  - `answer_json` (TEXT) — jawaban yang dipilih/diinput
  - `is_correct` (BOOLEAN, nullable)
  - `score` (REAL, nullable)
- **`mastery_records`** (Rekap penguasaan per kompetensi)
  - `id` (TEXT, PK)
  - `student_id` (TEXT, FK)
  - `competency_id` (TEXT, FK)
  - `mastery_level` (TEXT) — cth: "belum", "cukup", "mahir" (konfigurabel)
  - `last_updated` (DATETIME)

### 3.5 Templates, Rules, Sharing
*(Disederhanakan untuk MVP, detail di ED-11 & ED-19)*
- **`templates`**: `id`, `name`, `type` (question, rubric, dll), `engine_id`, `schema_json`
- **`rule_packs`**: `id`, `name`, `engine_id`, `version`, `is_active`
- **`share_packages`**: `id`, `manifest_hash`, `imported_at`, `status` (success, rejected)

### 3.6 Sync & Security
- **`sync_events`** (Jantung sinkronisasi)
  - `id` (TEXT, PK) — Event ID (UUID)
  - `entity_type` (TEXT) — cth: "student", "question"
  - `entity_id` (TEXT)
  - `operation` (TEXT) — create, update, delete
  - `base_revision` (INT)
  - `new_revision` (INT)
  - `payload_json` (TEXT) — data aktual
  - `device_id` (TEXT)
  - `created_at` (DATETIME)
  - `idempotency_key` (TEXT, UNIQUE) — mencegah duplikasi event
- **`conflict_records`**
  - `id` (TEXT, PK)
  - `entity_type` (TEXT)
  - `entity_id` (TEXT)
  - `local_revision` (INT)
  - `remote_revision` (INT)
  - `resolution` (TEXT, nullable) — pending, local_wins, remote_wins, manual
- **`audit_logs`**
  - `id` (TEXT, PK)
  - `action` (TEXT) — cth: "approve_question", "import_package"
  - `actor` (TEXT)
  - `timestamp` (DATETIME)
  - `details_json` (TEXT)

---

## 4. Aturan Index & Performa
1. Semua Foreign Key (`*_id`) harus memiliki Index untuk mempercepat JOIN.
2. Kolom `deleted_at` harus di-index untuk memfilter data aktif (`WHERE deleted_at IS NULL`).
3. Kolom `idempotency_key` di `sync_events` harus UNIQUE.
4. Pencarian teks (jika ada) menggunakan SQLite FTS5 (Full-Text Search) pada tabel `document_chunks` dan `knowledge_items`.

---

## 5. Strategi Migrasi (Drift)
1. **Schema Versioning:** Setiap perubahan schema wajib menaikkan `schemaVersion` di `AppDatabase`.
2. **Migration Script:** Tulis fungsi `MigrationStrategy` di Drift. Jangan pernah drop tabel di production; gunakan `ALTER TABLE` atau migrasi data.
3. **Backup Sebelum Migrasi:** Aplikasi wajib membuat backup database sebelum menjalankan migrasi schema baru.
4. **Test Migrasi:** Buat unit test yang mensimulasikan DB versi lama, jalankan migrasi, dan pastikan data tidak hilang.

---

## 6. Keputusan Terbuka (Perlu Persetujuan)
1. **Format JSON `content_json`**: Harus mengikuti schema `QuestionContent` (TextBlock, FormulaBlock, dll) yang akan difinalkan di ED-10.
2. **Enkripsi Database**: SQLCipher opsi EOL. Apakah kita butuh enkripsi at-rest di MVP, atau mengandalkan enkripsi filesystem OS?
3. **Penyimpanan `knowledge_items.content`**: Disimpan sebagai JSON terstruktur atau teks kaya (Markdown)?