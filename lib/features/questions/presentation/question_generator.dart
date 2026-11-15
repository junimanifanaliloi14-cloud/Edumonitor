import 'dart:convert';

import '../../../infrastructure/database/app_database.dart';

class SimpleQuestionGenerator {
  Map<String, String> generateFromKnowledge(KnowledgeItem item) {
    String correctAnswer = item.content;
    if (correctAnswer.length > 100) {
      correctAnswer = '${correctAnswer.substring(0, 97)}...';
    }

    String questionText = 'Manakah pernyataan yang benar berdasarkan materi?';

    List<String> options = [
      correctAnswer,
      'Pernyataan ini tidak memiliki hubungan dengan materi.',
      'Semua pernyataan di atas salah.',
      'Tidak ada jawaban yang benar.',
    ];

    options.shuffle();
    int correctIndex = options.indexOf(correctAnswer);

    final contentJson = jsonEncode({
      'blocks': [
        {'type': 'text', 'text': questionText},
      ],
      'options': options,
    });

    final answerJson = jsonEncode({'correctIndex': correctIndex});

    return {'content': contentJson, 'answer': answerJson};
  }
}
