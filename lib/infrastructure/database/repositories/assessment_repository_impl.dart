import 'package:drift/drift.dart';
import 'package:uuid/uuid.dart';

import '../../../domain/assessments/assessment_repository.dart';
import '../app_database.dart';

class AssessmentRepositoryImpl implements AssessmentRepository {
  AssessmentRepositoryImpl(this._db);
  final AppDatabase _db;
  final _uuid = const Uuid();

  @override
  Stream<List<Assessment>> watchAllAssessments() {
    return (_db.select(_db.assessments)
          ..where((t) => t.deletedAt.isNull())
          ..orderBy([
            (t) =>
                OrderingTerm(expression: t.createdAt, mode: OrderingMode.desc),
          ]))
        .watch();
  }

  @override
  Future<void> createAssessmentFromQuestions({
    required String title,
    required List<Question> questions,
    String? learningObjectiveId,
  }) async {
    if (questions.isEmpty) {
      throw Exception('Tidak ada soal untuk dijadikan ujian.');
    }

    final assessmentId = _uuid.v4();
    final assessmentSnapshotId = _uuid.v4();

    // 1. Buat Assessment
    await _db
        .into(_db.assessments)
        .insert(
          AssessmentsCompanion.insert(
            id: assessmentId,
            title: title,
            learningObjectiveId: Value(learningObjectiveId),
          ),
        );

    // 2. Buat AssessmentSnapshot (Immutable)
    await _db
        .into(_db.assessmentSnapshots)
        .insert(
          AssessmentSnapshotsCompanion.insert(
            id: assessmentSnapshotId,
            assessmentId: assessmentId,
          ),
        );

    // 3. Loop setiap soal: Buat QuestionSnapshot & AssessmentItem
    for (int i = 0; i < questions.length; i++) {
      final q = questions[i];
      final qSnapshotId = _uuid.v4();

      // Snapshot soal (menyalin isi soal agar kebal terhadap perubahan)
      await _db
          .into(_db.questionSnapshots)
          .insert(
            QuestionSnapshotsCompanion.insert(
              id: qSnapshotId,
              questionId: q.id,
              contentJson: q.contentJson,
              answerJson: q.answerJson,
              provenanceJson: '{"generator":"${q.generatorId}"}',
            ),
          );

      // Hubungkan ke Assessment
      await _db
          .into(_db.assessmentItems)
          .insert(
            AssessmentItemsCompanion.insert(
              id: _uuid.v4(),
              assessmentSnapshotId: assessmentSnapshotId,
              questionSnapshotId: qSnapshotId,
              sequence: i,
            ),
          );
    }
  }

  @override
  Future<void> deleteAssessment(String id) async {
    await (_db.update(_db.assessments)..where((t) => t.id.equals(id))).write(
      AssessmentsCompanion(
        deletedAt: Value(DateTime.now()),
        updatedAt: Value(DateTime.now()),
      ),
    );
  }
}
