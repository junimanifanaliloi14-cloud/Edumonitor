# Phase 12b — Enhanced Generator (v0.4.0)

**Status:** SELESAI
**Tanggal:** 16 November 2026

## Ringkasan
Generator soal ditingkatkan dari sebelumnya yang menghasilkan soal Pilihan Ganda
statis menjadi generator yang mendukung:
- **Distraktor dari knowledge lain bertipe sama** (bukan hardcoded)
- **Soal Benar/Salah** dengan statement asli (Benar) atau dari knowledge lain (Salah)
- **Variasi stem** berdasarkan `KnowledgeItem.type`

## Yang Selesai

### Kode
- `lib/features/questions/presentation/question_generator.dart`
  - `EnhancedQuestionGenerator` (menggantikan `SimpleQuestionGenerator`)
  - `generateMultipleChoice(target, others, {seed})`
  - `generateTrueFalse(target, others, {seed})` — deterministic dengan seed
  - Fallback: jika distraktor kurang dari 3, gunakan hardcoded
- `lib/domain/knowledge/knowledge_repository.dart`
  - `getOtherKnowledgeInTopic(topicId, excludeId)`
- `lib/features/knowledge/presentation/knowledge_list_screen.dart`
  - Tombol "Pilihan Ganda" dan "Benar/Salah" di setiap knowledge card
  - Tab Bank Soal menampilkan badge tipe soal

### Test
- `test/features/questions/question_generator_test.dart` — 5 test baru:
  - MC: 4 opsi, 1 benar, tanpa duplikat
  - MC: fallback saat distraktor kurang dari 3
  - TF: deterministic dengan seed
  - TF: null jika tidak ada knowledge lain
  - Stem bervariasi berdasarkan type knowledge

## Gate Kelulusan

| Gate | Status |
|---|---|
| 22/22 test lulus | PASS |
| flutter analyze bersih | PASS |
| CI hijau | PASS |

## Keterbatasan
- Generator tetap memakai **semua** knowledge item (draft maupun verified).
  Pada Phase 13, filter status verifikasi akan ditambahkan.
- Fill-in-the-blank belum didukung (butuh NER atau penanda guru).
- Enrich schema knowledge (subject/predicate/object) ditunda ke fase terpisah.
