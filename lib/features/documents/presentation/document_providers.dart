import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../domain/documents/document_repository.dart';
import '../../../infrastructure/database/app_database.dart';
import '../../../infrastructure/database/repositories/document_repository_impl.dart';
import '../../students/presentation/student_providers.dart';

final documentRepositoryProvider = Provider<DocumentRepository>((ref) {
  final db = ref.watch(databaseProvider);
  return DocumentRepositoryImpl(db);
});

final documentListProvider = StreamProvider<List<SourceDocument>>((ref) {
  final repo = ref.watch(documentRepositoryProvider);
  return repo.watchAllDocuments();
});

final documentChunksProvider =
    StreamProvider.family<List<DocumentChunk>, String>((ref, documentId) {
      final repo = ref.watch(documentRepositoryProvider);
      return repo.watchChunksByDocument(documentId);
    });
