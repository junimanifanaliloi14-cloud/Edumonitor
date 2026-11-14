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
  TextColumn get status => text().withDefault(
    const Constant('draft'),
  )(); // draft, approved, rejected
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

// Snapshot bersifat immutable (tidak ada updatedAt/revision)
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

// Snapshot bersifat immutable
class AssessmentSnapshots extends Table {
  TextColumn get id => text()();
  TextColumn get assessmentId => text().references(Assessments, #id)();
  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();

  @override
  Set<Column> get primaryKey => {id};
}

// Menghubungkan AssessmentSnapshot dengan QuestionSnapshot
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
  ],
)
class AppDatabase extends _$AppDatabase {
  AppDatabase(super.e);

  @override
  int get schemaVersion => 4;

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
    },
  );
}

LazyDatabase openAppDatabaseAt(File file) {
  return LazyDatabase(() async {
    return NativeDatabase.createInBackground(file);
  });
}

Future<LazyDatabase> openAppDatabase() async {
  final dir = await getApplicationSupportDirectory();
  final file = File(p.join(dir.path, 'edumonitor.sqlite'));
  return openAppDatabaseAt(file);
}
