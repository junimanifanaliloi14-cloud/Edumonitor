import 'dart:io';

import 'package:drift/native.dart';
import 'package:edumonitor/infrastructure/database/app_database.dart';
import 'package:edumonitor/infrastructure/database/repositories/question_repository_impl.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:path/path.dart' as p;

void main() {
  late Directory tempDir;
  late AppDatabase db;
  late QuestionRepositoryImpl repo;

  setUp(() async {
    tempDir = await Directory.systemTemp.createTemp('edumonitor_q_test_');
    db = AppDatabase(NativeDatabase(File(p.join(tempDir.path, 'test.sqlite'))));
    repo = QuestionRepositoryImpl(db);
  });

  tearDown(() async {
    await db.close();
    if (await tempDir.exists()) await tempDir.delete(recursive: true);
  });

  Future<void> seedTopic() async {
    await db
        .into(db.subjects)
        .insert(SubjectsCompanion.insert(id: 's1', name: 'Fisika'));
    await db
        .into(db.chapters)
        .insert(
          ChaptersCompanion.insert(id: 'c1', subjectId: 's1', name: 'Mekanika'),
        );
    await db
        .into(db.topics)
        .insert(
          TopicsCompanion.insert(id: 't1', chapterId: 'c1', name: 'Gaya'),
        );
  }

  test('saveQuestion creates question with draft status', () async {
    await seedTopic();
    await repo.saveQuestion(
      topicId: 't1',
      contentJson: '{"stem":"test"}',
      answerJson: '{"correctIndex":0}',
      generatorId: 'test-gen',
    );
    final items = await db.select(db.questions).get();
    expect(items.length, 1);
    expect(items.first.status, 'draft');
    expect(items.first.generatorId, 'test-gen');
  });

  test('updateQuestion modifies content and status', () async {
    await seedTopic();
    await repo.saveQuestion(
      topicId: 't1',
      contentJson: '{"old":true}',
      answerJson: '{"correctIndex":0}',
      generatorId: 'test-gen',
    );
    final initial = await db.select(db.questions).getSingle();

    await repo.updateQuestion(
      id: initial.id,
      contentJson: '{"new":true}',
      status: 'verified',
    );

    final updated = await db.select(db.questions).getSingle();
    expect(updated.contentJson, '{"new":true}');
    expect(updated.status, 'verified');
    expect(updated.answerJson, '{"correctIndex":0}');
  });

  test('deleteQuestion soft-deletes (deletedAt set)', () async {
    await seedTopic();
    await repo.saveQuestion(
      topicId: 't1',
      contentJson: '{}',
      answerJson: '{}',
      generatorId: 'test-gen',
    );
    final initial = await db.select(db.questions).getSingle();
    expect(initial.deletedAt, isNull);

    await repo.deleteQuestion(initial.id);

    final deleted = await db.select(db.questions).getSingle();
    expect(deleted.deletedAt, isNotNull);
  });

  test('watchQuestionsByTopic excludes soft-deleted', () async {
    await seedTopic();
    await repo.saveQuestion(
      topicId: 't1',
      contentJson: '{}',
      answerJson: '{}',
      generatorId: 'test-gen',
    );
    final initial = await db.select(db.questions).getSingle();
    await repo.deleteQuestion(initial.id);

    final visible = await repo.watchQuestionsByTopic('t1').first;
    expect(visible, isEmpty);
  });
}
