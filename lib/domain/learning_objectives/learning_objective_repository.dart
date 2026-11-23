import '../../infrastructure/database/app_database.dart';

abstract interface class LearningObjectiveRepository {
  Stream<List<LearningObjective>> watchLearningObjectives(String classroomId);

  Future<void> createLearningObjective({
    required String classroomId,
    required String code,
    required String description,
    required int sequence,
    String? topicId,
  });

  Future<void> updateLearningObjective({
    required String id,
    String? code,
    String? description,
    int? sequence,
  });

  Future<void> deleteLearningObjective(String id);
}
