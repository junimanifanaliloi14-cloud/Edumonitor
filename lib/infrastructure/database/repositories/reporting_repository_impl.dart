import 'package:drift/drift.dart';

import '../../../domain/reporting/reporting_models.dart';
import '../../../domain/reporting/reporting_repository.dart';
import '../app_database.dart';

class ReportingRepositoryImpl implements ReportingRepository {
  ReportingRepositoryImpl(this._db);
  final AppDatabase _db;

  @override
  Future<ReportingMetrics> getMetrics({
    double attentionThreshold = 70.0,
  }) async {
    // 1. Basic counts
    final totalStudents = await _db.students.count().getSingle();
    final totalSubjects = await _db.subjects.count().getSingle();
    final totalDocuments = await _db.sourceDocuments.count().getSingle();
    final totalAssessments = await _db.assessments.count().getSingle();
    final totalQuestions = await _db.questions.count().getSingle();
    final pendingQuestions =
        await (_db.selectOnly(_db.questions)
              ..addColumns([_db.questions.id.count()])
              ..where(_db.questions.status.equals('draft'))
              ..where(_db.questions.deletedAt.isNull()))
            .map((row) => row.read(_db.questions.id.count()) ?? 0)
            .getSingle();

    // 2. Ambil semua siswa aktif (belum dihapus)
    final studentsList = await (_db.select(
      _db.students,
    )..where((t) => t.deletedAt.isNull())).get();
    final activeStudentIds = studentsList.map((s) => s.id).toSet();

    // 3. Kumpulkan semua attempt dan score dari siswa aktif
    final attempts = await (_db.select(
      _db.studentAttempts,
    )..where((t) => t.deletedAt.isNull())).get();
    final activeAttempts = attempts
        .where((a) => activeStudentIds.contains(a.studentId))
        .toList();
    final activeAttemptIds = activeAttempts.map((a) => a.id).toSet();

    final answers = await (_db.select(
      _db.studentAnswers,
    )..where((t) => t.deletedAt.isNull())).get();
    final activeAnswers = answers
        .where((ans) => activeAttemptIds.contains(ans.attemptId))
        .toList();

    // 4. Kalkulasi KPI berdasarkan data yang sudah terfilter
    final scoresByAttempt = <String, double>{};
    for (final a in activeAnswers) {
      if (a.score != null) scoresByAttempt[a.attemptId] = a.score!;
    }

    final allScores = scoresByAttempt.values.toList();
    final classAverage = allScores.isEmpty
        ? 0.0
        : allScores.reduce((a, b) => a + b) / allScores.length;
    final highestScore = allScores.isEmpty
        ? 0.0
        : allScores.reduce((a, b) => a > b ? a : b);
    final lowestScore = allScores.isEmpty
        ? 0.0
        : allScores.reduce((a, b) => a < b ? a : b);

    // 5. Score trend: group by assessment snapshot (active students only)
    final trendQueryWithStudent =
        _db.select(_db.studentAttempts).join([
            innerJoin(
              _db.students,
              _db.students.id.equalsExp(_db.studentAttempts.studentId),
            ),
            innerJoin(
              _db.assessmentSnapshots,
              _db.assessmentSnapshots.id.equalsExp(
                _db.studentAttempts.assessmentSnapshotId,
              ),
            ),
            innerJoin(
              _db.assessments,
              _db.assessments.id.equalsExp(
                _db.assessmentSnapshots.assessmentId,
              ),
            ),
          ])
          ..where(_db.studentAttempts.deletedAt.isNull())
          ..where(_db.studentAttempts.completedAt.isNotNull())
          ..where(_db.students.deletedAt.isNull())
          ..orderBy([OrderingTerm.desc(_db.studentAttempts.completedAt)])
          ..limit(100);

    final trendRows = await trendQueryWithStudent.get();
    final grouped = <String, List<_TrendItem>>{};
    for (final row in trendRows) {
      final attempt = row.readTable(_db.studentAttempts);
      final assessment = row.readTable(_db.assessments);
      final score = scoresByAttempt[attempt.id];
      if (score == null) continue;
      grouped
          .putIfAbsent(attempt.assessmentSnapshotId, () => [])
          .add(
            _TrendItem(
              date: attempt.completedAt!,
              score: score,
              title: assessment.title,
            ),
          );
    }

    final scoreTrend = grouped.values.map((items) {
      final avg =
          items.map((i) => i.score).reduce((a, b) => a + b) / items.length;
      final earliest = items
          .map((i) => i.date)
          .reduce((a, b) => a.isBefore(b) ? a : b);
      return ScoreTrendPoint(
        assessmentTitle: items.first.title,
        completedAt: earliest,
        averageScore: avg,
        attemptCount: items.length,
      );
    }).toList()..sort((a, b) => a.completedAt.compareTo(b.completedAt));

    final trimmedTrend = scoreTrend.length > 10
        ? scoreTrend.sublist(scoreTrend.length - 10)
        : scoreTrend;

    // 6. Siswa perlu perhatian (hanya siswa aktif yang punya attempt aktif)
    final attentionList = <StudentAttentionItem>[];
    for (final student in studentsList) {
      final studentAttempts = activeAttempts
          .where((a) => a.studentId == student.id)
          .toList();
      if (studentAttempts.isEmpty) continue;

      final attemptIds = studentAttempts.map((a) => a.id).toSet();
      final studentScores = <double>[];
      for (final a in activeAnswers) {
        if (attemptIds.contains(a.attemptId) && a.score != null) {
          studentScores.add(a.score!);
        }
      }
      if (studentScores.isEmpty) continue;

      final avg = studentScores.reduce((a, b) => a + b) / studentScores.length;
      if (avg < attentionThreshold) {
        attentionList.add(
          StudentAttentionItem(
            studentId: student.id,
            studentName: student.displayName,
            averageScore: avg,
            attemptCount: studentScores.length,
          ),
        );
      }
    }
    attentionList.sort((a, b) => a.averageScore.compareTo(b.averageScore));

    return ReportingMetrics(
      totalStudents: totalStudents,
      totalSubjects: totalSubjects,
      totalDocuments: totalDocuments,
      totalQuestions: totalQuestions,
      pendingQuestions: pendingQuestions,
      totalAssessments: totalAssessments,
      classAverage: classAverage,
      highestScore: highestScore,
      lowestScore: lowestScore,
      scoreTrend: trimmedTrend,
      studentsNeedingAttention: attentionList,
    );
  }
}

class _TrendItem {
  const _TrendItem({
    required this.date,
    required this.score,
    required this.title,
  });
  final DateTime date;
  final double score;
  final String title;
}
