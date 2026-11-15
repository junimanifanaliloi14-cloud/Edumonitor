import '../../infrastructure/database/app_database.dart';

abstract interface class TopicRepository {
  Stream<List<Topic>> watchTopicsByChapter(String chapterId);
  Future<void> addTopic(String chapterId, String name);
  Future<void> deleteTopic(String id);
}
