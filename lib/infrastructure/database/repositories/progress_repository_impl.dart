import 'package:drift/drift.dart';
import 'package:uuid/uuid.dart';

import '../../../domain/progress/progress_repository.dart';
import '../app_database.dart';

class ProgressRepositoryImpl implements ProgressRepository {
  ProgressRepositoryImpl(this._db);
  final AppDatabase _db;
  final _uuid = const Uuid();

  @override
  Stream<List<StudentAttempt>> watchAttemptsByStudent(String studentId) {
    return (_db.select(_db.studentAttempts)
          ..where((t) => t.studentId.equals(studentId) & t.deletedAt.isNull())
          ..orderBy([
            (t) =>
                OrderingTerm(expression: t.createdAt, mode: OrderingMode.desc),
          ]))
        .watch();
  }

  @override
  Future<void> recordAttempt({
    required String studentId,
    required String assessmentId,
    required double score,
  }) async {
    // 1. Cari AssessmentSnapshot yang aktif
    final snapshot =
        await (_db.select(_db.assessmentSnapshots)
              ..where((t) => t.assessmentId.equals(assessmentId))
              ..limit(1))
            .getSingle();

    final attemptId = _uuid.v4();

    // 2. Catat StudentAttempt
    await _db
        .into(_db.studentAttempts)
        .insert(
          StudentAttemptsCompanion.insert(
            id: attemptId,
            studentId: studentId,
            assessmentSnapshotId: snapshot.id,
            completedAt: Value(DateTime.now()),
          ),
        );

    // 3. Untuk MVP, kita simpan skor total ke StudentAnswers (soal pertama)
    // Di fase berikutnya, ini akan dipecah per-soal.
    final items = await (_db.select(
      _db.assessmentItems,
    )..where((t) => t.assessmentSnapshotId.equals(snapshot.id))).get();

    if (items.isNotEmpty) {
      await _db
          .into(_db.studentAnswers)
          .insert(
            StudentAnswersCompanion.insert(
              id: _uuid.v4(),
              attemptId: attemptId,
              questionSnapshotId: items.first.questionSnapshotId,
              answerJson: '{"total_score": $score}',
              isCorrect: Value(score >= 70.0),
              score: Value(score),
            ),
          );
    }
  }
}
