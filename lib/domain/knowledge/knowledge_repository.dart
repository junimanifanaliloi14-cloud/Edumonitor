import '../../infrastructure/database/app_database.dart';

abstract interface class KnowledgeRepository {
  Stream<List<KnowledgeItem>> watchKnowledgeByTopic(String topicId);

  Stream<List<KnowledgeItem>> watchVerifiedKnowledgeByTopic(String topicId);

  Future<List<KnowledgeItem>> getOtherKnowledgeInTopic(
    String topicId,
    String excludeId,
  );

  Future<void> addKnowledgeFromChunk({
    required String topicId,
    required String chunkId,
    required String content,
    required String type,
  });

  Future<void> updateKnowledge({
    required String id,
    String? type,
    String? content,
    String? status,
  });

  Future<void> deleteKnowledge(String id);
}
