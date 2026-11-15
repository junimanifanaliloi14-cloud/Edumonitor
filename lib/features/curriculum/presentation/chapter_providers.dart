import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../domain/curriculum/chapter_repository.dart';
import '../../../infrastructure/database/app_database.dart';
import '../../../infrastructure/database/repositories/chapter_repository_impl.dart';
import '../../students/presentation/student_providers.dart';

final chapterRepositoryProvider = Provider<ChapterRepository>((ref) {
  final db = ref.watch(databaseProvider);
  return ChapterRepositoryImpl(db);
});

// Menggunakan .family karena kita membutuhkan parameter subjectId
final chapterListProvider = StreamProvider.family<List<Chapter>, String>((
  ref,
  subjectId,
) {
  final repo = ref.watch(chapterRepositoryProvider);
  return repo.watchChaptersBySubject(subjectId);
});
