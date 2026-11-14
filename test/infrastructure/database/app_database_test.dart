import 'dart:io';

import 'package:drift/drift.dart' show Value; // PERBAIKAN: Hanya ambil Value
import 'package:drift/native.dart';
import 'package:edumonitor/infrastructure/database/app_database.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:path/path.dart' as p;
import 'package:sqlite3/sqlite3.dart';

void main() {
  late Directory tempDir;
  late AppDatabase db;

  setUp(() async {
    tempDir = await Directory.systemTemp.createTemp('edumonitor_db_test_');
    final file = File(p.join(tempDir.path, 'test.sqlite'));
    final executor = NativeDatabase(file);
    db = AppDatabase(executor);
  });

  tearDown(() async {
    await db.close();
    if (await tempDir.exists()) {
      await tempDir.delete(recursive: true);
    }
  });

  test('sqlite3 version is available', () {
    expect(sqlite3.version.libVersion, isNotEmpty);
  });

  test('insert and query a student', () async {
    await db.into(db.students).insert(
          StudentsCompanion.insert(
            id: 'stu-1',
            displayName: 'Aisyah',
          ),
        );

    final rows = await db.select(db.students).get();
    expect(rows.length, 1);
    expect(rows.first.id, 'stu-1');
    expect(rows.first.displayName, 'Aisyah');
    expect(rows.first.revision, 1);
    expect(rows.first.deletedAt, isNull);
  });

  test('insert and query a subject', () async {
    await db.into(db.subjects).insert(
          SubjectsCompanion.insert(
            id: 'sub-1',
            name: 'Matematika',
          ),
        );

    final rows = await db.select(db.subjects).get();
    expect(rows.length, 1);
    expect(rows.first.name, 'Matematika');
  });

  test('schema version is 3', () {
    expect(db.schemaVersion, 3);
  });

  test('insert and query curriculum hierarchy', () async {
    await db.into(db.subjects).insert(
          SubjectsCompanion.insert(id: 's1', name: 'Matematika'),
        );
    await db.into(db.chapters).insert(
          ChaptersCompanion.insert(id: 'c1', subjectId: 's1', name: 'Aljabar'),
        );
    await db.into(db.topics).insert(
          TopicsCompanion.insert(
              id: 't1', chapterId: 'c1', name: 'Persamaan Linear'),
        );
    await db.into(db.competencies).insert(
          CompetenciesCompanion.insert(
            id: 'comp1',
            topicId: 't1',
            description:
                'Siswa dapat menyelesaikan persamaan linear satu variabel',
          ),
        );

    final competencies = await db.select(db.competencies).get();
    expect(competencies.length, 1);
    expect(competencies.first.description, contains('linear'));

    final chapters = await db.select(db.chapters).get();
    expect(chapters.length, 1);
    expect(chapters.first.name, 'Aljabar');
  });

  test('insert and query document and knowledge hierarchy', () async {
    // 1. Insert Document
    await db.into(db.sourceDocuments).insert(SourceDocumentsCompanion.insert(
      id: 'doc1', title: 'Buku Fisika', filePath: '/path/to/pdf', fileHash: 'abc123', fileType: 'pdf'
    ));

    // 2. Insert Version
    await db.into(db.documentVersions).insert(DocumentVersionsCompanion.insert(
      id: 'ver1', documentId: 'doc1', versionNumber: 1
    ));

    // 3. Insert Chunk
    await db.into(db.documentChunks).insert(DocumentChunksCompanion.insert(
      id: 'chunk1', versionId: 'ver1', sequence: 1, textContent: 'Gaya adalah tarikan atau dorongan.', locator: 'page:1'
    ));

    // 4. Insert Knowledge (butuh TopicId, kita buat dummy topic dulu)
    await db.into(db.subjects).insert(SubjectsCompanion.insert(id: 's-phy', name: 'Fisika'));
    await db.into(db.chapters).insert(ChaptersCompanion.insert(id: 'c-phy', subjectId: 's-phy', name: 'Mekanika'));
    await db.into(db.topics).insert(TopicsCompanion.insert(id: 't-phy', chapterId: 'c-phy', name: 'Gaya'));

    await db.into(db.knowledgeItems).insert(KnowledgeItemsCompanion.insert(
      id: 'k1', 
      topicId: 't-phy', 
      type: 'concept', 
      content: '{"definition":"Gaya"}', 
      sourceChunkId: Value('chunk1') // Dibungkus dengan Value()
    ));

    // 5. Insert Knowledge Source
    await db.into(db.knowledgeSources).insert(KnowledgeSourcesCompanion.insert(
      id: 'ks1', knowledgeId: 'k1', chunkId: 'chunk1', quote: 'Gaya adalah tarikan atau dorongan.'
    ));

    final knowledge = await db.select(db.knowledgeItems).get();
    expect(knowledge.length, 1);
    
    final source = await db.select(db.knowledgeSources).get();
    expect(source.first.quote, contains('tarikan'));
  });
}