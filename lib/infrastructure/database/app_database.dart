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
  TextColumn get createdByDeviceId => text().withDefault(const Constant('local'))();
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
  TextColumn get createdByDeviceId => text().withDefault(const Constant('local'))();
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
  TextColumn get createdByDeviceId => text().withDefault(const Constant('local'))();
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
  TextColumn get createdByDeviceId => text().withDefault(const Constant('local'))();
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
  TextColumn get createdByDeviceId => text().withDefault(const Constant('local'))();
  IntColumn get revision => integer().withDefault(const Constant(1))();
  DateTimeColumn get deletedAt => dateTime().nullable()();

  @override
  Set<Column> get primaryKey => {id};
}

// ==========================================
// DATABASE DEFINITION
// ==========================================

@DriftDatabase(tables: [
  Students,
  Subjects,
  Chapters,
  Topics,
  Competencies,
])
class AppDatabase extends _$AppDatabase {
  AppDatabase(super.e);

  @override
  int get schemaVersion => 2; // Naik dari 1 ke 2 karena penambahan tabel

  @override
  MigrationStrategy get migration => MigrationStrategy(
        onCreate: (m) async {
          await m.createAll();
        },
        onUpgrade: (m, from, to) async {
          if (from == 1) {
            // Migrasi dari POC v1 ke v2 (menambahkan tabel baru)
            await m.createTable(chapters);
            await m.createTable(topics);
            await m.createTable(competencies);
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