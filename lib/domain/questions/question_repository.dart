import '../../infrastructure/database/app_database.dart';

abstract interface class QuestionRepository {
  Stream<List<Question>> watchQuestionsByTopic(String topicId);

  Future<void> saveQuestion({
    required String topicId,
    required String contentJson,
    required String answerJson,
    required String generatorId,
  });

  Future<void> updateQuestion({
    required String id,
    String? contentJson,
    String? answerJson,
    String? status,
  });

  Future<void> deleteQuestion(String id);
}
