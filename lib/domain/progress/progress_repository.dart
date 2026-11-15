import '../../infrastructure/database/app_database.dart';

abstract interface class ProgressRepository {
  Stream<List<StudentAttempt>> watchAttemptsByStudent(String studentId);
  Future<void> recordAttempt({
    required String studentId,
    required String assessmentId,
    required double score,
  });
}
