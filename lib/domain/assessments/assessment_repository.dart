import '../../infrastructure/database/app_database.dart';

abstract interface class AssessmentRepository {
  Stream<List<Assessment>> watchAllAssessments();
  Future<void> createAssessmentFromQuestions({
    required String title,
    required List<Question> questions,
  });
  Future<void> deleteAssessment(String id);
}
