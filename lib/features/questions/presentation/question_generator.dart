import 'dart:convert';
import 'dart:math';

import '../../../infrastructure/database/app_database.dart';

/// Generator soal yang membuat soal baru berdasarkan knowledge item.
/// Deterministic jika [seed] diberikan.
///
/// Phase 12b: Mendukung Multiple Choice (dengan distraktor dari knowledge lain
/// bertipe sama) dan True/False (dengan 50% chance memakai knowledge lain).
class EnhancedQuestionGenerator {
  static const _fallbackDistractors = <String>[
    'Pernyataan ini tidak memiliki hubungan dengan materi.',
    'Semua pernyataan di atas salah.',
    'Tidak ada jawaban yang benar.',
  ];

  Map<String, String> generateMultipleChoice(
    KnowledgeItem target,
    List<KnowledgeItem> others, {
    int? seed,
  }) {
    final rng = Random(seed ?? DateTime.now().millisecondsSinceEpoch);
    final correctAnswer = _truncate(target.content);

    // Prioritas distraktor: tipe sama → tipe apapun → fallback hardcoded
    var sameType = others
        .where((o) => o.type == target.type && o.content != target.content)
        .map((o) => _truncate(o.content))
        .toSet()
        .toList();

    if (sameType.length < 3) {
      final anyType = others
          .where((o) => o.content != target.content)
          .map((o) => _truncate(o.content))
          .toSet()
          .toList();
      sameType = anyType;
    }

    List<String> distractors;
    if (sameType.length >= 3) {
      sameType.shuffle(rng);
      distractors = sameType.take(3).toList();
    } else {
      final combined = <String>{...sameType, ..._fallbackDistractors}.toList();
      combined.shuffle(rng);
      distractors = combined.take(3).toList();
    }

    final options = [correctAnswer, ...distractors];
    options.shuffle(rng);
    final correctIndex = options.indexOf(correctAnswer);

    final stem = _stemForType(target.type);

    final contentJson = jsonEncode({
      'blocks': [
        {'type': 'text', 'text': stem},
      ],
      'options': options,
      'questionType': 'multipleChoice',
    });
    final answerJson = jsonEncode({'correctIndex': correctIndex});

    return {'content': contentJson, 'answer': answerJson};
  }

  /// True/False: 50% menampilkan statement asli (Benar) atau statement dari
  /// knowledge lain (Salah). Deterministic dengan [seed].
  /// Return null jika tidak ada knowledge lain untuk membuat variant Salah.
  Map<String, String>? generateTrueFalse(
    KnowledgeItem target,
    List<KnowledgeItem> others, {
    int? seed,
  }) {
    final candidates = others
        .where((o) => o.content != target.content)
        .toList();
    if (candidates.isEmpty) return null;

    final rng = Random(seed ?? DateTime.now().millisecondsSinceEpoch);
    final useOriginal = rng.nextBool();

    final String statement;
    final bool isTrue;
    if (useOriginal) {
      statement = _truncate(target.content);
      isTrue = true;
    } else {
      final other = candidates[rng.nextInt(candidates.length)];
      statement = _truncate(other.content);
      isTrue = false;
    }

    final contentJson = jsonEncode({
      'blocks': [
        {'type': 'text', 'text': 'Benar atau Salah: "$statement"'},
      ],
      'options': ['Benar', 'Salah'],
      'questionType': 'trueFalse',
    });
    final answerJson = jsonEncode({'correctIndex': isTrue ? 0 : 1});

    return {'content': contentJson, 'answer': answerJson};
  }

  String _stemForType(String type) {
    switch (type.toLowerCase()) {
      case 'concept':
        return 'Manakah pernyataan yang paling tepat mengenai konsep pada materi?';
      case 'fact':
        return 'Manakah fakta yang benar berdasarkan materi?';
      case 'relation':
        return 'Manakah hubungan yang benar berdasarkan materi?';
      case 'sequence':
        return 'Manakah pernyataan yang benar mengenai urutan proses?';
      case 'passage':
        return 'Manakah pernyataan yang sesuai dengan bacaan?';
      default:
        return 'Manakah pernyataan yang benar berdasarkan materi?';
    }
  }

  String _truncate(String s, [int maxLen = 100]) {
    if (s.length <= maxLen) return s;
    return '${s.substring(0, maxLen - 3)}...';
  }
}
