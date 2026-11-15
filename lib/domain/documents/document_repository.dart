import '../../infrastructure/database/app_database.dart';

abstract interface class DocumentRepository {
  Stream<List<SourceDocument>> watchAllDocuments();
  Future<void> addDocument({
    required String title,
    required String filePath,
    required String fileHash,
    required String fileType,
  });
  Future<void> deleteDocument(String id);
}
