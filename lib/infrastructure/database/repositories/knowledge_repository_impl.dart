import 'package:drift/drift.dart';
import 'package:uuid/uuid.dart';

import '../../../domain/knowledge/knowledge_repository.dart';
import '../app_database.dart';

class KnowledgeRepositoryImpl implements KnowledgeRepository {
  KnowledgeRepositoryImpl(this._db);
  final AppDatabase _db;
  final _uuid = const Uuid();

  @override
  Stream<List<KnowledgeItem>> watchKnowledgeByTopic(String topicId) {
    return (_db.select(_db.knowledgeItems)
          ..where((t) => t.topicId.equals(topicId) & t.deletedAt.isNull())
          ..orderBy([
            (t) =>
                OrderingTerm(expression: t.createdAt, mode: OrderingMode.desc),
          ]))
        .watch();
  }

  @override
  Stream<List<KnowledgeItem>> watchVerifiedKnowledgeByTopic(String topicId) {
    return (_db.select(_db.knowledgeItems)
          ..where((t) => t.topicId.equals(topicId) & t.deletedAt.isNull())
          ..where((t) => t.status.equals('verified'))
          ..orderBy([
            (t) =>
                OrderingTerm(expression: t.createdAt, mode: OrderingMode.desc),
          ]))
        .watch();
  }

  @override
  Future<List<KnowledgeItem>> getOtherKnowledgeInTopic(
    String topicId,
    String excludeId,
  ) async {
    return await (_db.select(_db.knowledgeItems)
          ..where((t) => t.topicId.equals(topicId))
          ..where((t) => t.deletedAt.isNull())
          ..where((t) => t.id.equals(excludeId).not()))
        .get();
  }

  @override
  Future<void> addKnowledgeFromChunk({
    required String topicId,
    required String chunkId,
    required String content,
    required String type,
  }) async {
    final knowledgeId = _uuid.v4();

    await _db
        .into(_db.knowledgeItems)
        .insert(
          KnowledgeItemsCompanion.insert(
            id: knowledgeId,
            topicId: topicId,
            type: type,
            content: content,
            status: const Value('draft'),
            sourceChunkId: Value(chunkId),
          ),
        );

    await _db
        .into(_db.knowledgeSources)
        .insert(
          KnowledgeSourcesCompanion.insert(
            id: _uuid.v4(),
            knowledgeId: knowledgeId,
            chunkId: chunkId,
            quote: content,
          ),
        );
  }

  @override
  Future<void> updateKnowledge({
    required String id,
    String? type,
    String? content,
    String? status,
  }) async {
    await (_db.update(_db.knowledgeItems)..where((t) => t.id.equals(id))).write(
      KnowledgeItemsCompanion(
        type: type != null ? Value(type) : const Value.absent(),
        content: content != null ? Value(content) : const Value.absent(),
        status: status != null ? Value(status) : const Value.absent(),
        updatedAt: Value(DateTime.now()),
      ),
    );
  }

  @override
  Future<void> deleteKnowledge(String id) async {
    await (_db.update(_db.knowledgeItems)..where((t) => t.id.equals(id))).write(
      KnowledgeItemsCompanion(
        deletedAt: Value(DateTime.now()),
        updatedAt: Value(DateTime.now()),
      ),
    );
  }
}
