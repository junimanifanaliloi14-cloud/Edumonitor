import 'dart:io';

import 'package:drift/drift.dart' show Value;
import 'package:drift/native.dart';
import 'package:edumonitor/infrastructure/database/app_database.dart';
import 'package:edumonitor/infrastructure/export/export_service_impl.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:path/path.dart' as p;

void main() {
  late Directory tempDir;
  late AppDatabase db;

  setUp(() async {
    tempDir = await Directory.systemTemp.createTemp('edumonitor_export_test_');
    final file = File(p.join(tempDir.path, 'test.sqlite'));
    db = AppDatabase(NativeDatabase(file));
  });

  tearDown(() async {
    await db.close();
    if (await tempDir.exists()) {
      await tempDir.delete(recursive: true);
    }
  });

  test(
    'buildStudentReport returns correct rows for student with attempts',
    () async {
      // 1. Insert student
      await db
          .into(db.students)
          .insert(StudentsCompanion.insert(id: 's1', displayName: 'Budi'));

      // 2. Insert assessment + snapshot
      await db
          .into(db.assessments)
          .insert(
            AssessmentsCompanion.insert(id: 'a1', title: 'Ulangan Harian 1'),
          );
      await db
          .into(db.assessmentSnapshots)
          .insert(
            AssessmentSnapshotsCompanion.insert(id: 'as1', assessmentId: 'a1'),
          );

      // 3. Insert attempt
      await db
          .into(db.studentAttempts)
          .insert(
            StudentAttemptsCompanion.insert(
              id: 'att1',
              studentId: 's1',
              assessmentSnapshotId: 'as1',
              completedAt: Value(DateTime(2026, 11, 15)),
            ),
          );

      // 4. Insert answer with score
      await db
          .into(db.studentAnswers)
          .insert(
            StudentAnswersCompanion.insert(
              id: 'ans1',
              attemptId: 'att1',
              questionSnapshotId: 'qs-dummy',
              answerJson: '{"total_score": 85}',
              score: const Value(85.0),
            ),
          );

      final service = ExportServiceImpl(db);
      final report = await service.buildStudentReport('s1');

      expect(report.studentId, 's1');
      expect(report.studentName, 'Budi');
      expect(report.rows.length, 1);
      expect(report.rows.first.assessmentTitle, 'Ulangan Harian 1');
      expect(report.rows.first.score, 85.0);
      expect(report.averageScore, 85.0);
    },
  );

  test(
    'buildStudentReport returns empty rows for student without attempts',
    () async {
      await db
          .into(db.students)
          .insert(StudentsCompanion.insert(id: 's2', displayName: 'Siti'));

      final service = ExportServiceImpl(db);
      final report = await service.buildStudentReport('s2');

      expect(report.studentId, 's2');
      expect(report.studentName, 'Siti');
      expect(report.rows, isEmpty);
      expect(report.averageScore, 0.0);
    },
  );
}
