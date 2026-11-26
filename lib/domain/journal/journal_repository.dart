import '../../infrastructure/database/app_database.dart';

abstract interface class JournalRepository {
  Stream<List<JournalEntry>> watchJournalEntries(String classroomId);

  Future<JournalEntry?> getJournalEntry(String id);

  Stream<List<Attendance>> watchAttendances(String journalEntryId);

  /// Membuat jurnal + presensi siswa dalam 1 transaksi atomik.
  /// [attendances] map studentId -> status (hadir/izin/sakit/alpha).
  Future<void> createJournalEntry({
    required String classroomId,
    String? learningObjectiveId,
    required DateTime date,
    String? title,
    required String activity,
    String? notes,
    Map<String, String> attendances = const {},
  });

  Future<void> updateJournalEntry({
    required String id,
    String? learningObjectiveId,
    DateTime? date,
    String? title,
    String? activity,
    String? notes,
    Map<String, String>? attendances,
  });

  Future<void> deleteJournalEntry(String id);
}
