import 'dart:io';

import 'package:drift/drift.dart' show Value;
import 'package:drift/native.dart';
import 'package:edumonitor/infrastructure/database/app_database.dart';
import 'package:edumonitor/infrastructure/database/repositories/reporting_repository_impl.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:path/path.dart' as p;

void main() {
  late Directory tempDir;
  late AppDatabase db;
  late ReportingRepositoryImpl repo;

  setUp(() async {
    tempDir = await Directory.systemTemp.createTemp('edumonitor_reporting_');
    db = AppDatabase(NativeDatabase(File(p.join(tempDir.path, 'test.sqlite'))));
    repo = ReportingRepositoryImpl(db);
  });

  tearDown(() async {
    await db.close();
    if (await tempDir.exists()) await tempDir.delete(recursive: true);
  });

  test('empty database: all zeros and empty lists', () async {
    final metrics = await repo.getMetrics();
    expect(metrics.totalStudents, 0);
    expect(metrics.totalSubjects, 0);
    expect(metrics.totalDocuments, 0);
    expect(metrics.totalQuestions, 0);
    expect(metrics.pendingQuestions, 0);
    expect(metrics.totalAssessments, 0);
    expect(metrics.classAverage, 0.0);
    expect(metrics.highestScore, 0.0);
    expect(metrics.lowestScore, 0.0);
    expect(metrics.scoreTrend, isEmpty);
    expect(metrics.studentsNeedingAttention, isEmpty);
  });

  Future<({String studentId, String snapshotId, String attemptId})>
  seedAttempt({
    required String studentName,
    required double score,
    required DateTime completedAt,
    required String assessmentTitle,
  }) async {
    final studentId = 'stu-$studentName';
    await db
        .into(db.students)
        .insert(
          StudentsCompanion.insert(id: studentId, displayName: studentName),
        );

    final assessmentId = 'as-${studentName.hashCode}';
    await db
        .into(db.assessments)
        .insert(
          AssessmentsCompanion.insert(id: assessmentId, title: assessmentTitle),
        );

    final snapshotId = 'snap-${studentName.hashCode}';
    await db
        .into(db.assessmentSnapshots)
        .insert(
          AssessmentSnapshotsCompanion.insert(
            id: snapshotId,
            assessmentId: assessmentId,
          ),
        );

    final attemptId = 'att-$studentName';
    await db
        .into(db.studentAttempts)
        .insert(
          StudentAttemptsCompanion.insert(
            id: attemptId,
            studentId: studentId,
            assessmentSnapshotId: snapshotId,
            completedAt: Value(completedAt),
          ),
        );

    await db
        .into(db.studentAnswers)
        .insert(
          StudentAnswersCompanion.insert(
            id: 'ans-$studentName',
            attemptId: attemptId,
            questionSnapshotId: 'qs-dummy',
            answerJson: '{"score":$score}',
            score: Value(score),
          ),
        );

    return (studentId: studentId, snapshotId: snapshotId, attemptId: attemptId);
  }

  test('class average, highest, lowest from single attempt', () async {
    await seedAttempt(
      studentName: 'Andi',
      score: 85.0,
      completedAt: DateTime(2026, 11, 15),
      assessmentTitle: 'UTS Fisika',
    );

    final metrics = await repo.getMetrics();
    expect(metrics.totalStudents, 1);
    expect(metrics.totalAssessments, 1);
    expect(metrics.classAverage, 85.0);
    expect(metrics.highestScore, 85.0);
    expect(metrics.lowestScore, 85.0);
  });

  test(
    'students with average below threshold appear in attention list',
    () async {
      await seedAttempt(
        studentName: 'Andi',
        score: 50.0,
        completedAt: DateTime(2026, 11, 15),
        assessmentTitle: 'UTS Fisika',
      );
      await seedAttempt(
        studentName: 'Budi',
        score: 90.0,
        completedAt: DateTime(2026, 11, 15),
        assessmentTitle: 'UTS Fisika',
      );

      final metrics = await repo.getMetrics();
      expect(metrics.studentsNeedingAttention.length, 1);
      expect(metrics.studentsNeedingAttention.first.studentName, 'Andi');
      expect(metrics.studentsNeedingAttention.first.averageScore, 50.0);
    },
  );

  test('pending questions count only draft status', () async {
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
    await db
        .into(db.questions)
        .insert(
          QuestionsCompanion.insert(
            id: 'q-draft',
            topicId: 't1',
            generatorId: 'gen',
            contentJson: '{}',
            answerJson: '{}',
            status: const Value('draft'),
          ),
        );
    await db
        .into(db.questions)
        .insert(
          QuestionsCompanion.insert(
            id: 'q-verified',
            topicId: 't1',
            generatorId: 'gen',
            contentJson: '{}',
            answerJson: '{}',
            status: const Value('verified'),
          ),
        );

    final metrics = await repo.getMetrics();
    expect(metrics.totalQuestions, 2);
    expect(metrics.pendingQuestions, 1);
  });

  test('score trend groups attempts by assessment snapshot', () async {
    // Dua siswa pada asesmen yang sama, snapshot sama
    final student1 = 'stu-s1';
    final student2 = 'stu-s2';
    await db
        .into(db.students)
        .insert(StudentsCompanion.insert(id: student1, displayName: 'Siswa1'));
    await db
        .into(db.students)
        .insert(StudentsCompanion.insert(id: student2, displayName: 'Siswa2'));
    await db
        .into(db.assessments)
        .insert(AssessmentsCompanion.insert(id: 'as1', title: 'Ulangan 1'));
    await db
        .into(db.assessmentSnapshots)
        .insert(
          AssessmentSnapshotsCompanion.insert(id: 'snap1', assessmentId: 'as1'),
        );

    for (final s in [student1, student2]) {
      final attemptId = 'att-$s';
      await db
          .into(db.studentAttempts)
          .insert(
            StudentAttemptsCompanion.insert(
              id: attemptId,
              studentId: s,
              assessmentSnapshotId: 'snap1',
              completedAt: Value(DateTime(2026, 11, 15)),
            ),
          );
      await db
          .into(db.studentAnswers)
          .insert(
            StudentAnswersCompanion.insert(
              id: 'ans-$s',
              attemptId: attemptId,
              questionSnapshotId: 'qs-dummy',
              answerJson: '{}',
              score: Value(s == student1 ? 80.0 : 100.0),
            ),
          );
    }

    final metrics = await repo.getMetrics();
    expect(metrics.scoreTrend.length, 1);
    expect(metrics.scoreTrend.first.averageScore, 90.0);
    expect(metrics.scoreTrend.first.attemptCount, 2);
  });
}
