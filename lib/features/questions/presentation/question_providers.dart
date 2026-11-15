import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../domain/questions/question_repository.dart';
import '../../../infrastructure/database/app_database.dart';
import '../../../infrastructure/database/repositories/question_repository_impl.dart';
import '../../students/presentation/student_providers.dart';

final questionRepositoryProvider = Provider<QuestionRepository>((ref) {
  final db = ref.watch(databaseProvider);
  return QuestionRepositoryImpl(db);
});

final questionListProvider = StreamProvider.family<List<Question>, String>((
  ref,
  topicId,
) {
  final repo = ref.watch(questionRepositoryProvider);
  return repo.watchQuestionsByTopic(topicId);
});
