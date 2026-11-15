import '../../infrastructure/database/app_database.dart';

abstract interface class TopicRepository {
  Stream<List<Topic>> watchTopicsByChapter(String chapterId);
  Stream<List<Topic>> watchAllTopics(); // Tambahan baru
  Future<void> addTopic(String chapterId, String name);
  Future<void> deleteTopic(String id);
}
