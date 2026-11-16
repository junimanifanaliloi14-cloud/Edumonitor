import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../domain/knowledge/knowledge_repository.dart';
import '../../../infrastructure/database/app_database.dart';
import '../../../infrastructure/database/repositories/knowledge_repository_impl.dart';
import '../../students/presentation/student_providers.dart';

enum KnowledgeFilter { all, draft, verified }

class KnowledgeFilterNotifier extends Notifier<KnowledgeFilter> {
  @override
  KnowledgeFilter build() => KnowledgeFilter.all;

  void setFilter(KnowledgeFilter value) => state = value;
}

final knowledgeFilterProvider =
    NotifierProvider<KnowledgeFilterNotifier, KnowledgeFilter>(
      KnowledgeFilterNotifier.new,
    );

final knowledgeRepositoryProvider = Provider<KnowledgeRepository>((ref) {
  final db = ref.watch(databaseProvider);
  return KnowledgeRepositoryImpl(db);
});

final knowledgeListProvider =
    StreamProvider.family<List<KnowledgeItem>, String>((ref, topicId) {
      final repo = ref.watch(knowledgeRepositoryProvider);
      return repo.watchKnowledgeByTopic(topicId);
    });

/// Stream knowledge yang sudah terverifikasi, untuk generator soal.
final verifiedKnowledgeProvider =
    StreamProvider.family<List<KnowledgeItem>, String>((ref, topicId) {
      final repo = ref.watch(knowledgeRepositoryProvider);
      return repo.watchVerifiedKnowledgeByTopic(topicId);
    });
