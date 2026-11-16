import 'dart:io';

import 'package:drift/drift.dart' show Value;
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
    await db
        .into(db.students)
        .insert(StudentsCompanion.insert(id: 'stu-1', displayName: 'Aisyah'));
    final rows = await db.select(db.students).get();
    expect(rows.length, 1);
    expect(rows.first.id, 'stu-1');
    expect(rows.first.displayName, 'Aisyah');
    expect(rows.first.revision, 1);
    expect(rows.first.deletedAt, isNull);
  });

  test('schema version is 6', () {
    expect(db.schemaVersion, 6);
  });

  test('insert and query curriculum hierarchy', () async {
    await db
        .into(db.subjects)
        .insert(SubjectsCompanion.insert(id: 's1', name: 'Matematika'));
    await db
        .into(db.chapters)
        .insert(
          ChaptersCompanion.insert(id: 'c1', subjectId: 's1', name: 'Aljabar'),
        );
    await db
        .into(db.topics)
        .insert(
          TopicsCompanion.insert(
            id: 't1',
            chapterId: 'c1',
            name: 'Persamaan Linear',
          ),
        );
    await db
        .into(db.competencies)
        .insert(
          CompetenciesCompanion.insert(
            id: 'comp1',
            topicId: 't1',
            description: 'Siswa dapat menyelesaikan persamaan linear',
          ),
        );

    final competencies = await db.select(db.competencies).get();
    expect(competencies.length, 1);
    expect(competencies.first.description, contains('linear'));
  });

  test('insert and query document and knowledge hierarchy', () async {
    await db
        .into(db.sourceDocuments)
        .insert(
          SourceDocumentsCompanion.insert(
            id: 'doc1',
            title: 'Buku Fisika',
            filePath: '/path',
            fileHash: 'abc',
            fileType: 'pdf',
          ),
        );
    await db
        .into(db.documentVersions)
        .insert(
          DocumentVersionsCompanion.insert(
            id: 'ver1',
            documentId: 'doc1',
            versionNumber: 1,
          ),
        );
    await db
        .into(db.documentChunks)
        .insert(
          DocumentChunksCompanion.insert(
            id: 'chunk1',
            versionId: 'ver1',
            sequence: 1,
            textContent: 'Gaya adalah tarikan.',
            locator: 'page:1',
          ),
        );

    await db
        .into(db.subjects)
        .insert(SubjectsCompanion.insert(id: 's-phy', name: 'Fisika'));
    await db
        .into(db.chapters)
        .insert(
          ChaptersCompanion.insert(
            id: 'c-phy',
            subjectId: 's-phy',
            name: 'Mekanika',
          ),
        );
    await db
        .into(db.topics)
        .insert(
          TopicsCompanion.insert(id: 't-phy', chapterId: 'c-phy', name: 'Gaya'),
        );

    await db
        .into(db.knowledgeItems)
        .insert(
          KnowledgeItemsCompanion.insert(
            id: 'k1',
            topicId: 't-phy',
            type: 'concept',
            content: '{"def":"Gaya"}',
            sourceChunkId: Value('chunk1'),
          ),
        );
    await db
        .into(db.knowledgeSources)
        .insert(
          KnowledgeSourcesCompanion.insert(
            id: 'ks1',
            knowledgeId: 'k1',
            chunkId: 'chunk1',
            quote: 'Gaya adalah tarikan.',
          ),
        );

    final knowledge = await db.select(db.knowledgeItems).get();
    expect(knowledge.length, 1);
  });

  test('insert and query questions and assessments hierarchy', () async {
    await db
        .into(db.subjects)
        .insert(SubjectsCompanion.insert(id: 's1', name: 'Math'));
    await db
        .into(db.chapters)
        .insert(
          ChaptersCompanion.insert(id: 'c1', subjectId: 's1', name: 'Aljabar'),
        );
    await db
        .into(db.topics)
        .insert(
          TopicsCompanion.insert(id: 't1', chapterId: 'c1', name: 'Linear'),
        );

    await db
        .into(db.questions)
        .insert(
          QuestionsCompanion.insert(
            id: 'q1',
            topicId: 't1',
            generatorId: 'gen-math',
            contentJson: '{"text":"2+2?"}',
            answerJson: '{"ans":4}',
          ),
        );
    await db
        .into(db.questionSnapshots)
        .insert(
          QuestionSnapshotsCompanion.insert(
            id: 'qs1',
            questionId: 'q1',
            contentJson: '{"text":"2+2?"}',
            answerJson: '{"ans":4}',
            provenanceJson: '{"seed":42}',
          ),
        );
    await db
        .into(db.assessments)
        .insert(AssessmentsCompanion.insert(id: 'a1', title: 'Ulangan Harian'));
    await db
        .into(db.assessmentSnapshots)
        .insert(
          AssessmentSnapshotsCompanion.insert(id: 'as1', assessmentId: 'a1'),
        );
    await db
        .into(db.assessmentItems)
        .insert(
          AssessmentItemsCompanion.insert(
            id: 'ai1',
            assessmentSnapshotId: 'as1',
            questionSnapshotId: 'qs1',
            sequence: 1,
          ),
        );

    final items = await db.select(db.assessmentItems).get();
    expect(items.length, 1);
    expect(items.first.weight, 1.0);
  });

  test('insert and query student progress and sync', () async {
    // 1. Setup Data Dummy
    await db
        .into(db.students)
        .insert(StudentsCompanion.insert(id: 'stu-1', displayName: 'Budi'));
    await db
        .into(db.subjects)
        .insert(SubjectsCompanion.insert(id: 's1', name: 'Math'));
    await db
        .into(db.chapters)
        .insert(
          ChaptersCompanion.insert(id: 'c1', subjectId: 's1', name: 'Aljabar'),
        );
    await db
        .into(db.topics)
        .insert(
          TopicsCompanion.insert(id: 't1', chapterId: 'c1', name: 'Linear'),
        );
    await db
        .into(db.competencies)
        .insert(
          CompetenciesCompanion.insert(
            id: 'comp1',
            topicId: 't1',
            description: 'Desc',
          ),
        );

    await db
        .into(db.questions)
        .insert(
          QuestionsCompanion.insert(
            id: 'q1',
            topicId: 't1',
            generatorId: 'gen',
            contentJson: '{}',
            answerJson: '{}',
          ),
        );
    await db
        .into(db.questionSnapshots)
        .insert(
          QuestionSnapshotsCompanion.insert(
            id: 'qs1',
            questionId: 'q1',
            contentJson: '{}',
            answerJson: '{}',
            provenanceJson: '{}',
          ),
        );
    await db
        .into(db.assessments)
        .insert(AssessmentsCompanion.insert(id: 'a1', title: 'Test'));
    await db
        .into(db.assessmentSnapshots)
        .insert(
          AssessmentSnapshotsCompanion.insert(id: 'as1', assessmentId: 'a1'),
        );

    // 2. Insert Attempt & Answer
    await db
        .into(db.studentAttempts)
        .insert(
          StudentAttemptsCompanion.insert(
            id: 'att1',
            studentId: 'stu-1',
            assessmentSnapshotId: 'as1',
          ),
        );
    await db
        .into(db.studentAnswers)
        .insert(
          StudentAnswersCompanion.insert(
            id: 'ans1',
            attemptId: 'att1',
            questionSnapshotId: 'qs1',
            answerJson: '{"ans":4}',
            isCorrect: Value(true),
            score: Value(1.0),
          ),
        );

    // 3. Insert Mastery
    await db
        .into(db.masteryRecords)
        .insert(
          MasteryRecordsCompanion.insert(
            id: 'm1',
            studentId: 'stu-1',
            competencyId: 'comp1',
            masteryLevel: 'cukup',
          ),
        );

    // 4. Insert Sync Event
    await db
        .into(db.syncEvents)
        .insert(
          SyncEventsCompanion.insert(
            id: 'evt1',
            entityType: 'student_attempt',
            entityId: 'att1',
            operation: 'create',
            baseRevision: 0,
            newRevision: 1,
            payloadJson: '{}',
            deviceId: 'device-A',
            idempotencyKey: 'key-123',
          ),
        );

    final attempts = await db.select(db.studentAttempts).get();
    expect(attempts.length, 1);

    final answers = await db.select(db.studentAnswers).get();
    expect(answers.first.isCorrect, isTrue);

    final syncEvents = await db.select(db.syncEvents).get();
    expect(syncEvents.first.idempotencyKey, 'key-123');
  });
}
