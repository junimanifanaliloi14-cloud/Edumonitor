import 'package:drift/drift.dart';
import 'package:uuid/uuid.dart';

import '../../../domain/journal/journal_repository.dart';
import '../app_database.dart';

class JournalRepositoryImpl implements JournalRepository {
  JournalRepositoryImpl(this._db);
  final AppDatabase _db;
  final _uuid = const Uuid();

  // ==========================================
  // READ
  // ==========================================

  @override
  Stream<List<JournalEntry>> watchJournalEntries(String classroomId) {
    return (_db.select(_db.journalEntries)
          ..where(
            (t) => t.classroomId.equals(classroomId) & t.deletedAt.isNull(),
          )
          ..orderBy([
            (t) => OrderingTerm(expression: t.date, mode: OrderingMode.desc),
          ]))
        .watch();
  }

  @override
  Future<JournalEntry?> getJournalEntry(String id) async {
    final entry =
        await (_db.select(_db.journalEntries)
              ..where((t) => t.id.equals(id))
              ..where((t) => t.deletedAt.isNull()))
            .getSingleOrNull();
    return entry;
  }

  @override
  Stream<List<Attendance>> watchAttendances(String journalEntryId) {
    return (_db.select(_db.attendances)
          ..where(
            (t) =>
                t.journalEntryId.equals(journalEntryId) & t.deletedAt.isNull(),
          )
          ..orderBy([(t) => OrderingTerm(expression: t.createdAt)]))
        .watch();
  }

  // ==========================================
  // CREATE (atomic: journal + attendance)
  // ==========================================

  @override
  Future<void> createJournalEntry({
    required String classroomId,
    String? learningObjectiveId,
    required DateTime date,
    String? title,
    required String activity,
    String? notes,
    Map<String, String> attendances = const {},
  }) async {
    await _db.transaction(() async {
      final journalId = _uuid.v4();

      await _db
          .into(_db.journalEntries)
          .insert(
            JournalEntriesCompanion.insert(
              id: journalId,
              classroomId: classroomId,
              learningObjectiveId: Value(learningObjectiveId),
              date: date,
              title: Value(title),
              activity: activity,
              notes: Value(notes),
            ),
          );

      for (final entry in attendances.entries) {
        await _db
            .into(_db.attendances)
            .insert(
              AttendancesCompanion.insert(
                id: _uuid.v4(),
                journalEntryId: journalId,
                studentId: entry.key,
                status: entry.value,
              ),
            );
      }
    });
  }

  // ==========================================
  // UPDATE (atomic)
  // ==========================================

  @override
  Future<void> updateJournalEntry({
    required String id,
    String? learningObjectiveId,
    DateTime? date,
    String? title,
    String? activity,
    String? notes,
    Map<String, String>? attendances,
  }) async {
    await _db.transaction(() async {
      await (_db.update(
        _db.journalEntries,
      )..where((t) => t.id.equals(id))).write(
        JournalEntriesCompanion(
          learningObjectiveId: learningObjectiveId != null
              ? Value(learningObjectiveId)
              : const Value.absent(),
          date: date != null ? Value(date) : const Value.absent(),
          title: title != null ? Value(title) : const Value.absent(),
          activity: activity != null ? Value(activity) : const Value.absent(),
          notes: notes != null ? Value(notes) : const Value.absent(),
          updatedAt: Value(DateTime.now()),
        ),
      );

      // Update attendance: untuk setiap studentId di map, upsert
      if (attendances != null) {
        for (final entry in attendances.entries) {
          final existing =
              await (_db.select(_db.attendances)..where(
                    (t) =>
                        t.journalEntryId.equals(id) &
                        t.studentId.equals(entry.key),
                  ))
                  .getSingleOrNull();

          if (existing == null) {
            await _db
                .into(_db.attendances)
                .insert(
                  AttendancesCompanion.insert(
                    id: _uuid.v4(),
                    journalEntryId: id,
                    studentId: entry.key,
                    status: entry.value,
                  ),
                );
          } else {
            await (_db.update(
              _db.attendances,
            )..where((t) => t.id.equals(existing.id))).write(
              AttendancesCompanion(
                status: Value(entry.value),
                updatedAt: Value(DateTime.now()),
              ),
            );
          }
        }
      }
    });
  }

  // ==========================================
  // DELETE (soft)
  // ==========================================

  @override
  Future<void> deleteJournalEntry(String id) async {
    await _db.transaction(() async {
      await (_db.update(
        _db.journalEntries,
      )..where((t) => t.id.equals(id))).write(
        JournalEntriesCompanion(
          deletedAt: Value(DateTime.now()),
          updatedAt: Value(DateTime.now()),
        ),
      );
      // Attendances ikut ditandai terhapus
      await (_db.update(
        _db.attendances,
      )..where((t) => t.journalEntryId.equals(id))).write(
        AttendancesCompanion(
          deletedAt: Value(DateTime.now()),
          updatedAt: Value(DateTime.now()),
        ),
      );
    });
  }
}
