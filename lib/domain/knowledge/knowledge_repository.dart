import '../../infrastructure/database/app_database.dart';

abstract interface class KnowledgeRepository {
  Stream<List<KnowledgeItem>> watchKnowledgeByTopic(String topicId);
  Future<void> addKnowledgeFromChunk({
    required String topicId,
    required String chunkId,
    required String content,
  });
  Future<void> deleteKnowledge(String id);
}
