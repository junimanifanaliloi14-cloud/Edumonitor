import 'package:drift/drift.dart';
import 'package:uuid/uuid.dart';

import '../../../domain/curriculum/chapter_repository.dart';
import '../app_database.dart';

class ChapterRepositoryImpl implements ChapterRepository {
  ChapterRepositoryImpl(this._db);
  final AppDatabase _db;
  final _uuid = const Uuid();

  @override
  Stream<List<Chapter>> watchChaptersBySubject(String subjectId) {
    return (_db.select(_db.chapters)
          ..where((t) => t.subjectId.equals(subjectId) & t.deletedAt.isNull())
          ..orderBy([(t) => OrderingTerm(expression: t.name)]))
        .watch();
  }

  @override
  Future<void> addChapter(String subjectId, String name) async {
    await _db
        .into(_db.chapters)
        .insert(
          ChaptersCompanion.insert(
            id: _uuid.v4(),
            subjectId: subjectId,
            name: name,
          ),
        );
  }

  @override
  Future<void> deleteChapter(String id) async {
    await (_db.update(_db.chapters)..where((t) => t.id.equals(id))).write(
      ChaptersCompanion(
        deletedAt: Value(DateTime.now()),
        updatedAt: Value(DateTime.now()),
      ),
    );
  }
}
