import 'dart:io';

import 'package:drift/native.dart';
import 'package:edumonitor/infrastructure/database/app_database.dart';
import 'package:edumonitor/infrastructure/database/repositories/knowledge_repository_impl.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:path/path.dart' as p;

void main() {
  late Directory tempDir;
  late AppDatabase db;
  late KnowledgeRepositoryImpl repo;

  setUp(() async {
    tempDir = await Directory.systemTemp.createTemp('edumonitor_kr_test_');
    db = AppDatabase(NativeDatabase(File(p.join(tempDir.path, 'test.sqlite'))));
    repo = KnowledgeRepositoryImpl(db);
  });

  tearDown(() async {
    await db.close();
    if (await tempDir.exists()) {
      await tempDir.delete(recursive: true);
    }
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

  Future<void> seedChunk() async {
    await db
        .into(db.sourceDocuments)
        .insert(
          SourceDocumentsCompanion.insert(
            id: 'd1',
            title: 'Doc',
            filePath: '/p',
            fileHash: 'h',
            fileType: 'txt',
          ),
        );
    await db
        .into(db.documentVersions)
        .insert(
          DocumentVersionsCompanion.insert(
            id: 'v1',
            documentId: 'd1',
            versionNumber: 1,
          ),
        );
    await db
        .into(db.documentChunks)
        .insert(
          DocumentChunksCompanion.insert(
            id: 'chunk-1',
            versionId: 'v1',
            sequence: 1,
            textContent: 'Gaya adalah tarikan atau dorongan.',
            locator: 'page:1',
          ),
        );
  }

  test('addKnowledgeFromChunk menyimpan tipe dan status draft', () async {
    await seedTopic();
    await seedChunk();

    await repo.addKnowledgeFromChunk(
      topicId: 't1',
      chunkId: 'chunk-1',
      content: 'Gaya adalah tarikan atau dorongan.',
      type: 'fact',
    );

    final items = await db.select(db.knowledgeItems).get();
    expect(items.length, 1);
    expect(items.first.type, 'fact');
    expect(items.first.status, 'draft');
    expect(items.first.content, 'Gaya adalah tarikan atau dorongan.');
  });

  test('updateKnowledge mengubah status ke verified', () async {
    await seedTopic();
    await seedChunk();
    await repo.addKnowledgeFromChunk(
      topicId: 't1',
      chunkId: 'chunk-1',
      content: 'Test.',
      type: 'concept',
    );
    final initial = await db.select(db.knowledgeItems).getSingle();
    expect(initial.status, 'draft');

    await repo.updateKnowledge(id: initial.id, status: 'verified');

    final updated = await db.select(db.knowledgeItems).getSingle();
    expect(updated.status, 'verified');
  });

  test('updateKnowledge mengubah tipe dan konten', () async {
    await seedTopic();
    await seedChunk();
    await repo.addKnowledgeFromChunk(
      topicId: 't1',
      chunkId: 'chunk-1',
      content: 'Lama.',
      type: 'concept',
    );
    final initial = await db.select(db.knowledgeItems).getSingle();

    await repo.updateKnowledge(
      id: initial.id,
      type: 'relation',
      content: 'Baru.',
    );

    final updated = await db.select(db.knowledgeItems).getSingle();
    expect(updated.type, 'relation');
    expect(updated.content, 'Baru.');
    expect(updated.status, 'draft'); // tidak berubah
  });

  test('watchVerifiedKnowledgeByTopic hanya mengembalikan verified', () async {
    await seedTopic();
    await seedChunk();

    await repo.addKnowledgeFromChunk(
      topicId: 't1',
      chunkId: 'chunk-1',
      content: 'A.',
      type: 'concept',
    );
    final all = await db.select(db.knowledgeItems).get();
    expect(all.length, 1);
    await repo.updateKnowledge(id: all.first.id, status: 'verified');

    final verified = await repo.watchVerifiedKnowledgeByTopic('t1').first;
    expect(verified.length, 1);
    expect(verified.first.status, 'verified');
  });
}
