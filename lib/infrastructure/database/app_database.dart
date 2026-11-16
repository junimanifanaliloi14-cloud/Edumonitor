import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';

part 'app_database.g.dart';

// ==========================================
// 1. IDENTITY & LEARNING CONTEXT
// ==========================================

class Students extends Table {
  TextColumn get id => text()();
  TextColumn get displayName => text().withLength(min: 1, max: 200)();
  TextColumn get notes => text().nullable()();
  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();
  DateTimeColumn get updatedAt => dateTime().withDefault(currentDateAndTime)();
  TextColumn get createdByDeviceId =>
      text().withDefault(const Constant('local'))();
  IntColumn get revision => integer().withDefault(const Constant(1))();
  DateTimeColumn get deletedAt => dateTime().nullable()();

  @override
  Set<Column> get primaryKey => {id};
}

class Subjects extends Table {
  TextColumn get id => text()();
  TextColumn get name => text().withLength(min: 1, max: 200)();
  TextColumn get engineId => text().withDefault(const Constant('generic'))();
  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();
  DateTimeColumn get updatedAt => dateTime().withDefault(currentDateAndTime)();
  TextColumn get createdByDeviceId =>
      text().withDefault(const Constant('local'))();
  IntColumn get revision => integer().withDefault(const Constant(1))();
  DateTimeColumn get deletedAt => dateTime().nullable()();

  @override
  Set<Column> get primaryKey => {id};
}

class Chapters extends Table {
  TextColumn get id => text()();
  TextColumn get subjectId => text().references(Subjects, #id)();
  TextColumn get name => text().withLength(min: 1, max: 200)();
  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();
  DateTimeColumn get updatedAt => dateTime().withDefault(currentDateAndTime)();
  TextColumn get createdByDeviceId =>
      text().withDefault(const Constant('local'))();
  IntColumn get revision => integer().withDefault(const Constant(1))();
  DateTimeColumn get deletedAt => dateTime().nullable()();

  @override
  Set<Column> get primaryKey => {id};
}

class Topics extends Table {
  TextColumn get id => text()();
  TextColumn get chapterId => text().references(Chapters, #id)();
  TextColumn get name => text().withLength(min: 1, max: 200)();
  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();
  DateTimeColumn get updatedAt => dateTime().withDefault(currentDateAndTime)();
  TextColumn get createdByDeviceId =>
      text().withDefault(const Constant('local'))();
  IntColumn get revision => integer().withDefault(const Constant(1))();
  DateTimeColumn get deletedAt => dateTime().nullable()();

  @override
  Set<Column> get primaryKey => {id};
}

class Competencies extends Table {
  TextColumn get id => text()();
  TextColumn get topicId => text().references(Topics, #id)();
  TextColumn get description => text()();
  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();
  DateTimeColumn get updatedAt => dateTime().withDefault(currentDateAndTime)();
  TextColumn get createdByDeviceId =>
      text().withDefault(const Constant('local'))();
  IntColumn get revision => integer().withDefault(const Constant(1))();
  DateTimeColumn get deletedAt => dateTime().nullable()();

  @override
  Set<Column> get primaryKey => {id};
}

// ==========================================
// 2. DOCUMENTS & KNOWLEDGE
// ==========================================

class SourceDocuments extends Table {
  TextColumn get id => text()();
  TextColumn get title => text()();
  TextColumn get filePath => text()();
  TextColumn get fileHash => text()();
  TextColumn get fileType => text()();
  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();
  DateTimeColumn get updatedAt => dateTime().withDefault(currentDateAndTime)();
  TextColumn get createdByDeviceId =>
      text().withDefault(const Constant('local'))();
  IntColumn get revision => integer().withDefault(const Constant(1))();
  DateTimeColumn get deletedAt => dateTime().nullable()();

  @override
  Set<Column> get primaryKey => {id};
}

class DocumentVersions extends Table {
  TextColumn get id => text()();
  TextColumn get documentId => text().references(SourceDocuments, #id)();
  IntColumn get versionNumber => integer()();
  DateTimeColumn get extractedAt =>
      dateTime().withDefault(currentDateAndTime)();
  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();
  DateTimeColumn get updatedAt => dateTime().withDefault(currentDateAndTime)();
  TextColumn get createdByDeviceId =>
      text().withDefault(const Constant('local'))();
  IntColumn get revision => integer().withDefault(const Constant(1))();
  DateTimeColumn get deletedAt => dateTime().nullable()();

  @override
  Set<Column> get primaryKey => {id};
}

class DocumentChunks extends Table {
  TextColumn get id => text()();
  TextColumn get versionId => text().references(DocumentVersions, #id)();
  IntColumn get pageNumber => integer().nullable()();
  IntColumn get sequence => integer()();
  TextColumn get textContent => text()();
  TextColumn get locator => text()();
  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();
  DateTimeColumn get updatedAt => dateTime().withDefault(currentDateAndTime)();
  TextColumn get createdByDeviceId =>
      text().withDefault(const Constant('local'))();
  IntColumn get revision => integer().withDefault(const Constant(1))();
  DateTimeColumn get deletedAt => dateTime().nullable()();

  @override
  Set<Column> get primaryKey => {id};
}

class KnowledgeItems extends Table {
  TextColumn get id => text()();
  TextColumn get topicId => text().references(Topics, #id)();
  TextColumn get type => text()();
  TextColumn get content => text()();
  TextColumn get status => text().withDefault(const Constant('extracted'))();
  TextColumn get sourceChunkId =>
      text().nullable().references(DocumentChunks, #id)();
  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();
  DateTimeColumn get updatedAt => dateTime().withDefault(currentDateAndTime)();
  TextColumn get createdByDeviceId =>
      text().withDefault(const Constant('local'))();
  IntColumn get revision => integer().withDefault(const Constant(1))();
  DateTimeColumn get deletedAt => dateTime().nullable()();

  @override
  Set<Column> get primaryKey => {id};
}

class KnowledgeSources extends Table {
  TextColumn get id => text()();
  TextColumn get knowledgeId => text().references(KnowledgeItems, #id)();
  TextColumn get chunkId => text().references(DocumentChunks, #id)();
  TextColumn get quote => text()();
  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();
  DateTimeColumn get updatedAt => dateTime().withDefault(currentDateAndTime)();
  TextColumn get createdByDeviceId =>
      text().withDefault(const Constant('local'))();
  IntColumn get revision => integer().withDefault(const Constant(1))();
  DateTimeColumn get deletedAt => dateTime().nullable()();

  @override
  Set<Column> get primaryKey => {id};
}

// ==========================================
// 3. QUESTIONS & ASSESSMENTS
// ==========================================

class Questions extends Table {
  TextColumn get id => text()();
  TextColumn get topicId => text().references(Topics, #id)();
  TextColumn get generatorId => text()();
  TextColumn get status => text().withDefault(const Constant('draft'))();
  TextColumn get contentJson => text()();
  TextColumn get answerJson => text()();
  RealColumn get difficultyEstimate => real().nullable()();
  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();
  DateTimeColumn get updatedAt => dateTime().withDefault(currentDateAndTime)();
  TextColumn get createdByDeviceId =>
      text().withDefault(const Constant('local'))();
  IntColumn get revision => integer().withDefault(const Constant(1))();
  DateTimeColumn get deletedAt => dateTime().nullable()();

  @override
  Set<Column> get primaryKey => {id};
}

class QuestionSnapshots extends Table {
  TextColumn get id => text()();
  TextColumn get questionId => text().references(Questions, #id)();
  TextColumn get contentJson => text()();
  TextColumn get answerJson => text()();
  TextColumn get provenanceJson => text()();
  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();

  @override
  Set<Column> get primaryKey => {id};
}

class Assessments extends Table {
  TextColumn get id => text()();
  TextColumn get title => text()();
  TextColumn get status => text().withDefault(const Constant('draft'))();
  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();
  DateTimeColumn get updatedAt => dateTime().withDefault(currentDateAndTime)();
  TextColumn get createdByDeviceId =>
      text().withDefault(const Constant('local'))();
  IntColumn get revision => integer().withDefault(const Constant(1))();
  DateTimeColumn get deletedAt => dateTime().nullable()();

  @override
  Set<Column> get primaryKey => {id};
}

class AssessmentSnapshots extends Table {
  TextColumn get id => text()();
  TextColumn get assessmentId => text().references(Assessments, #id)();
  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();

  @override
  Set<Column> get primaryKey => {id};
}

class AssessmentItems extends Table {
  TextColumn get id => text()();
  TextColumn get assessmentSnapshotId =>
      text().references(AssessmentSnapshots, #id)();
  TextColumn get questionSnapshotId =>
      text().references(QuestionSnapshots, #id)();
  IntColumn get sequence => integer()();
  RealColumn get weight => real().withDefault(const Constant(1.0))();
  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();

  @override
  Set<Column> get primaryKey => {id};
}

// ==========================================
// 4. STUDENT PROGRESS
// ==========================================

class StudentAttempts extends Table {
  TextColumn get id => text()();
  TextColumn get studentId => text().references(Students, #id)();
  TextColumn get assessmentSnapshotId =>
      text().references(AssessmentSnapshots, #id)();
  DateTimeColumn get startedAt => dateTime().withDefault(currentDateAndTime)();
  DateTimeColumn get completedAt => dateTime().nullable()();
  TextColumn get actorType =>
      text().withDefault(const Constant('teacher-recorded'))();
  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();
  DateTimeColumn get updatedAt => dateTime().withDefault(currentDateAndTime)();
  TextColumn get createdByDeviceId =>
      text().withDefault(const Constant('local'))();
  IntColumn get revision => integer().withDefault(const Constant(1))();
  DateTimeColumn get deletedAt => dateTime().nullable()();

  @override
  Set<Column> get primaryKey => {id};
}

class StudentAnswers extends Table {
  TextColumn get id => text()();
  TextColumn get attemptId => text().references(StudentAttempts, #id)();
  TextColumn get questionSnapshotId =>
      text().references(QuestionSnapshots, #id)();
  TextColumn get answerJson => text()();
  BoolColumn get isCorrect => boolean().nullable()();
  RealColumn get score => real().nullable()();
  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();
  DateTimeColumn get updatedAt => dateTime().withDefault(currentDateAndTime)();
  TextColumn get createdByDeviceId =>
      text().withDefault(const Constant('local'))();
  IntColumn get revision => integer().withDefault(const Constant(1))();
  DateTimeColumn get deletedAt => dateTime().nullable()();

  @override
  Set<Column> get primaryKey => {id};
}

class MasteryRecords extends Table {
  TextColumn get id => text()();
  TextColumn get studentId => text().references(Students, #id)();
  TextColumn get competencyId => text().references(Competencies, #id)();
  TextColumn get masteryLevel => text()();
  DateTimeColumn get lastUpdated =>
      dateTime().withDefault(currentDateAndTime)();
  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();
  DateTimeColumn get updatedAt => dateTime().withDefault(currentDateAndTime)();
  TextColumn get createdByDeviceId =>
      text().withDefault(const Constant('local'))();
  IntColumn get revision => integer().withDefault(const Constant(1))();
  DateTimeColumn get deletedAt => dateTime().nullable()();

  @override
  Set<Column> get primaryKey => {id};
}

// ==========================================
// 5. SYNC & SECURITY
// ==========================================

class SyncEvents extends Table {
  TextColumn get id => text()();
  TextColumn get entityType => text()();
  TextColumn get entityId => text()();
  TextColumn get operation => text()();
  IntColumn get baseRevision => integer()();
  IntColumn get newRevision => integer()();
  TextColumn get payloadJson => text()();
  TextColumn get deviceId => text()();
  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();
  TextColumn get idempotencyKey => text().unique()();

  @override
  Set<Column> get primaryKey => {id};
}

class ConflictRecords extends Table {
  TextColumn get id => text()();
  TextColumn get entityType => text()();
  TextColumn get entityId => text()();
  IntColumn get localRevision => integer()();
  IntColumn get remoteRevision => integer()();
  TextColumn get resolution => text().nullable()();
  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();
  DateTimeColumn get updatedAt => dateTime().withDefault(currentDateAndTime)();
  TextColumn get createdByDeviceId =>
      text().withDefault(const Constant('local'))();
  IntColumn get revision => integer().withDefault(const Constant(1))();
  DateTimeColumn get deletedAt => dateTime().nullable()();

  @override
  Set<Column> get primaryKey => {id};
}

class AuditLogs extends Table {
  TextColumn get id => text()();
  TextColumn get action => text()();
  TextColumn get actor => text()();
  DateTimeColumn get timestamp => dateTime().withDefault(currentDateAndTime)();
  TextColumn get detailsJson => text()();

  @override
  Set<Column> get primaryKey => {id};
}

// ==========================================
// 6. DEVICES & SYNC (v6 — NEW)
// ==========================================

class Devices extends Table {
  TextColumn get id => text()();
  TextColumn get displayName => text()();
  DateTimeColumn get lastSeenAt => dateTime().withDefault(currentDateAndTime)();
  BoolColumn get isTrusted => boolean().withDefault(const Constant(false))();
  DateTimeColumn get lastSyncAt => dateTime().nullable()();

  @override
  Set<Column> get primaryKey => {id};
}

class SyncPeers extends Table {
  TextColumn get id => text()();
  TextColumn get peerDeviceId => text().references(Devices, #id)();
  DateTimeColumn get pairedAt => dateTime().withDefault(currentDateAndTime)();
  DateTimeColumn get lastSyncAt => dateTime().nullable()();

  @override
  Set<Column> get primaryKey => {id};
}

class SyncCursors extends Table {
  TextColumn get id => text()();
  TextColumn get peerDeviceId => text().references(Devices, #id)();
  TextColumn get lastReceivedEventId => text().nullable()();
  DateTimeColumn get updatedAt => dateTime().withDefault(currentDateAndTime)();

  @override
  Set<Column> get primaryKey => {id};
}

// ==========================================
// DATABASE DEFINITION
// ==========================================

@DriftDatabase(
  tables: [
    Students,
    Subjects,
    Chapters,
    Topics,
    Competencies,
    SourceDocuments,
    DocumentVersions,
    DocumentChunks,
    KnowledgeItems,
    KnowledgeSources,
    Questions,
    QuestionSnapshots,
    Assessments,
    AssessmentSnapshots,
    AssessmentItems,
    StudentAttempts,
    StudentAnswers,
    MasteryRecords,
    SyncEvents,
    ConflictRecords,
    AuditLogs,
    Devices,
    SyncPeers,
    SyncCursors,
  ],
)
class AppDatabase extends _$AppDatabase {
  AppDatabase(super.e);

  @override
  int get schemaVersion => 6;

  @override
  MigrationStrategy get migration => MigrationStrategy(
    onCreate: (m) async {
      await m.createAll();
    },
    onUpgrade: (m, from, to) async {
      if (from < 2) {
        await m.createTable(chapters);
        await m.createTable(topics);
        await m.createTable(competencies);
      }
      if (from < 3) {
        await m.createTable(sourceDocuments);
        await m.createTable(documentVersions);
        await m.createTable(documentChunks);
        await m.createTable(knowledgeItems);
        await m.createTable(knowledgeSources);
      }
      if (from < 4) {
        await m.createTable(questions);
        await m.createTable(questionSnapshots);
        await m.createTable(assessments);
        await m.createTable(assessmentSnapshots);
        await m.createTable(assessmentItems);
      }
      if (from < 5) {
        await m.createTable(studentAttempts);
        await m.createTable(studentAnswers);
        await m.createTable(masteryRecords);
        await m.createTable(syncEvents);
        await m.createTable(conflictRecords);
        await m.createTable(auditLogs);
      }
      if (from < 6) {
        await m.createTable(devices);
        await m.createTable(syncPeers);
        await m.createTable(syncCursors);
      }
    },
  );
}

LazyDatabase openAppDatabaseAt(File file) {
  return LazyDatabase(() async {
    return NativeDatabase.createInBackground(file);
  });
}

Future<LazyDatabase> openAppDatabase() async {
  final file = await getDatabaseFile();
  return openAppDatabaseAt(file);
}

// HELPER: Mendapatkan File database untuk backup
Future<File> getDatabaseFile() async {
  final dir = await getApplicationSupportDirectory();
  return File(p.join(dir.path, 'edumonitor.sqlite'));
}
