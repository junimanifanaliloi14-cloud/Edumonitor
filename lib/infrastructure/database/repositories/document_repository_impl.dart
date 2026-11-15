import 'package:drift/drift.dart';
import 'package:uuid/uuid.dart';

import '../../../domain/documents/document_repository.dart';
import '../app_database.dart';

class DocumentRepositoryImpl implements DocumentRepository {
  DocumentRepositoryImpl(this._db);
  final AppDatabase _db;
  final _uuid = const Uuid();

  @override
  Stream<List<SourceDocument>> watchAllDocuments() {
    return (_db.select(_db.sourceDocuments)
          ..where((t) => t.deletedAt.isNull())
          ..orderBy([
            (t) =>
                OrderingTerm(expression: t.createdAt, mode: OrderingMode.desc),
          ]))
        .watch();
  }

  @override
  Future<void> addDocument({
    required String title,
    required String filePath,
    required String fileHash,
    required String fileType,
  }) async {
    await _db
        .into(_db.sourceDocuments)
        .insert(
          SourceDocumentsCompanion.insert(
            id: _uuid.v4(),
            title: title,
            filePath: filePath,
            fileHash:
                fileHash, // Untuk MVP, kita akan menggunakan UUID sementara
            fileType: fileType,
          ),
        );
  }

  @override
  Future<void> deleteDocument(String id) async {
    await (_db.update(
      _db.sourceDocuments,
    )..where((t) => t.id.equals(id))).write(
      SourceDocumentsCompanion(
        deletedAt: Value(DateTime.now()),
        updatedAt: Value(DateTime.now()),
      ),
    );
  }
}
