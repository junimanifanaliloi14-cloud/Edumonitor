import '../../infrastructure/database/app_database.dart';

abstract interface class ChapterRepository {
  Stream<List<Chapter>> watchChaptersBySubject(String subjectId);
  Future<void> addChapter(String subjectId, String name);
  Future<void> deleteChapter(String id);
}
