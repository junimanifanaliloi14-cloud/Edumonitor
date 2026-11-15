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
  Future<void> addKnowledgeFromChunk({
    required String topicId,
    required String chunkId,
    required String content,
  }) async {
    final knowledgeId = _uuid.v4();

    // 1. Simpan Knowledge Item
    await _db
        .into(_db.knowledgeItems)
        .insert(
          KnowledgeItemsCompanion.insert(
            id: knowledgeId,
            topicId: topicId,
            type: 'concept', // Default MVP
            content: content,
            status: const Value('draft'), // PERBAIKAN: Gunakan Value()
            sourceChunkId: Value(chunkId),
          ),
        );

    // 2. Simpan relasi ke sumber (Knowledge Sources)
    await _db
        .into(_db.knowledgeSources)
        .insert(
          KnowledgeSourcesCompanion.insert(
            id: _uuid.v4(),
            knowledgeId: knowledgeId,
            chunkId: chunkId,
            quote: content, // Simpan kutipan persisnya
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
