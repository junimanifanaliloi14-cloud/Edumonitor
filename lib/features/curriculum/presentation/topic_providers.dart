import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../domain/curriculum/topic_repository.dart';
import '../../../infrastructure/database/app_database.dart';
import '../../../infrastructure/database/repositories/topic_repository_impl.dart';
import '../../students/presentation/student_providers.dart';

final topicRepositoryProvider = Provider<TopicRepository>((ref) {
  final db = ref.watch(databaseProvider);
  return TopicRepositoryImpl(db);
});

final topicListProvider = StreamProvider.family<List<Topic>, String>((
  ref,
  chapterId,
) {
  final repo = ref.watch(topicRepositoryProvider);
  return repo.watchTopicsByChapter(chapterId);
});
