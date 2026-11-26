import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../domain/journal/journal_repository.dart';
import '../../../infrastructure/database/app_database.dart';
import '../../../infrastructure/database/repositories/journal_repository_impl.dart';
import '../../students/presentation/student_providers.dart';

final journalRepositoryProvider = Provider<JournalRepository>((ref) {
  final db = ref.watch(databaseProvider);
  return JournalRepositoryImpl(db);
});

final journalEntryListProvider =
    StreamProvider.family<List<JournalEntry>, String>((ref, classroomId) {
      return ref
          .watch(journalRepositoryProvider)
          .watchJournalEntries(classroomId);
    });

final journalAttendancesProvider =
    StreamProvider.family<List<Attendance>, String>((ref, journalEntryId) {
      return ref
          .watch(journalRepositoryProvider)
          .watchAttendances(journalEntryId);
    });
