import 'dart:convert';
import 'dart:io';

import 'package:drift/native.dart';
import 'package:edumonitor/features/questions/presentation/question_generator.dart';
import 'package:edumonitor/infrastructure/database/app_database.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:path/path.dart' as p;

void main() {
  late Directory tempDir;
  late AppDatabase db;

  setUp(() async {
    tempDir = await Directory.systemTemp.createTemp('edumonitor_qgen_test_');
    db = AppDatabase(NativeDatabase(File(p.join(tempDir.path, 'test.sqlite'))));
  });

  tearDown(() async {
    await db.close();
    if (await tempDir.exists()) {
      await tempDir.delete(recursive: true);
    }
  });

  Future<KnowledgeItem> insertKnowledge({
    required String id,
    required String type,
    required String content,
  }) async {
    await db
        .into(db.knowledgeItems)
        .insert(
          KnowledgeItemsCompanion.insert(
            id: id,
            topicId: 'topic-1',
            type: type,
            content: content,
          ),
        );
    return (db.select(
      db.knowledgeItems,
    )..where((t) => t.id.equals(id))).getSingle();
  }

  test('generateMultipleChoice: 4 opsi, 1 benar, tanpa duplikat', () async {
    final target = await insertKnowledge(
      id: 'k1',
      type: 'concept',
      content: 'Gaya adalah tarikan atau dorongan.',
    );
    final o2 = await insertKnowledge(
      id: 'k2',
      type: 'concept',
      content: 'Massa adalah jumlah zat.',
    );
    final o3 = await insertKnowledge(
      id: 'k3',
      type: 'concept',
      content: 'Berat adalah gaya gravitasi.',
    );
    final o4 = await insertKnowledge(
      id: 'k4',
      type: 'concept',
      content: 'Energi adalah kemampuan kerja.',
    );

    final gen = EnhancedQuestionGenerator();
    final result = gen.generateMultipleChoice(target, [o2, o3, o4], seed: 42);

    final content = jsonDecode(result['content']!) as Map<String, dynamic>;
    final options = (content['options'] as List).cast<String>();
    final answer = jsonDecode(result['answer']!) as Map<String, dynamic>;
    final correctIndex = answer['correctIndex'] as int;

    expect(options.length, 4);
    expect(options[correctIndex], target.content);
    expect(options.toSet().length, 4, reason: 'opsi tidak boleh duplikat');
  });

  test(
    'generateMultipleChoice: fallback saat distraktor kurang dari 3',
    () async {
      final target = await insertKnowledge(
        id: 'k1',
        type: 'concept',
        content: 'Gaya adalah tarikan atau dorongan.',
      );

      final gen = EnhancedQuestionGenerator();
      final result = gen.generateMultipleChoice(target, [], seed: 42);

      final content = jsonDecode(result['content']!) as Map<String, dynamic>;
      final options = (content['options'] as List).cast<String>();
      final answer = jsonDecode(result['answer']!) as Map<String, dynamic>;
      final correctIndex = answer['correctIndex'] as int;

      expect(options.length, 4);
      expect(options[correctIndex], target.content);
    },
  );

  test('generateTrueFalse: deterministic dengan seed', () async {
    final target = await insertKnowledge(
      id: 'k1',
      type: 'concept',
      content: 'Gaya adalah tarikan atau dorongan.',
    );
    final other = await insertKnowledge(
      id: 'k2',
      type: 'concept',
      content: 'Massa adalah jumlah zat.',
    );

    final gen = EnhancedQuestionGenerator();
    final r1 = gen.generateTrueFalse(target, [other], seed: 42);
    final r2 = gen.generateTrueFalse(target, [other], seed: 42);

    expect(r1, isNotNull);
    expect(r2, isNotNull);
    expect(r1!['content'], r2!['content']);
    expect(r1['answer'], r2['answer']);

    final content = jsonDecode(r1['content']!) as Map<String, dynamic>;
    final options = (content['options'] as List).cast<String>();
    expect(options, ['Benar', 'Salah']);
  });

  test('generateTrueFalse: null jika tidak ada knowledge lain', () async {
    final target = await insertKnowledge(
      id: 'k1',
      type: 'concept',
      content: 'Gaya adalah tarikan atau dorongan.',
    );

    final gen = EnhancedQuestionGenerator();
    final result = gen.generateTrueFalse(target, []);
    expect(result, isNull);
  });

  test('stem bervariasi berdasarkan type knowledge', () async {
    final concept = await insertKnowledge(
      id: 'k1',
      type: 'concept',
      content: 'Konsep A.',
    );
    final fact = await insertKnowledge(
      id: 'k2',
      type: 'fact',
      content: 'Fakta B.',
    );
    final gen = EnhancedQuestionGenerator();

    final rConcept = gen.generateMultipleChoice(concept, [fact], seed: 1);
    final rFact = gen.generateMultipleChoice(fact, [concept], seed: 1);

    final cConcept = jsonDecode(rConcept['content']!) as Map<String, dynamic>;
    final cFact = jsonDecode(rFact['content']!) as Map<String, dynamic>;
    final stemConcept =
        ((cConcept['blocks'] as List).first as Map)['text'] as String;
    final stemFact = ((cFact['blocks'] as List).first as Map)['text'] as String;

    expect(stemConcept, isNot(stemFact));
  });
}
