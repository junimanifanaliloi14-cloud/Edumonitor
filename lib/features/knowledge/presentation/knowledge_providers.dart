import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../domain/knowledge/knowledge_repository.dart';
import '../../../infrastructure/database/app_database.dart';
import '../../../infrastructure/database/repositories/knowledge_repository_impl.dart';
import '../../students/presentation/student_providers.dart';

final knowledgeRepositoryProvider = Provider<KnowledgeRepository>((ref) {
  final db = ref.watch(databaseProvider);
  return KnowledgeRepositoryImpl(db);
});

final knowledgeListProvider =
    StreamProvider.family<List<KnowledgeItem>, String>((ref, topicId) {
      final repo = ref.watch(knowledgeRepositoryProvider);
      return repo.watchKnowledgeByTopic(topicId);
    });
