import 'package:drift/drift.dart';
import 'package:uuid/uuid.dart';

import '../../../domain/curriculum/topic_repository.dart';
import '../app_database.dart';

class TopicRepositoryImpl implements TopicRepository {
  TopicRepositoryImpl(this._db);
  final AppDatabase _db;
  final _uuid = const Uuid();

  @override
  Stream<List<Topic>> watchTopicsByChapter(String chapterId) {
    return (_db.select(_db.topics)
          ..where((t) => t.chapterId.equals(chapterId) & t.deletedAt.isNull())
          ..orderBy([(t) => OrderingTerm(expression: t.name)]))
        .watch();
  }

  @override
  Future<void> addTopic(String chapterId, String name) async {
    await _db
        .into(_db.topics)
        .insert(
          TopicsCompanion.insert(
            id: _uuid.v4(),
            chapterId: chapterId,
            name: name,
          ),
        );
  }

  @override
  Future<void> deleteTopic(String id) async {
    await (_db.update(_db.topics)..where((t) => t.id.equals(id))).write(
      TopicsCompanion(
        deletedAt: Value(DateTime.now()),
        updatedAt: Value(DateTime.now()),
      ),
    );
  }
}
