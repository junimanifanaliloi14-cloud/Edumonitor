import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';

part 'app_database.g.dart';

/// Students table. Phase 1A POC only.
/// Schema will expand in Phase 3 (Student & Curriculum).
class Students extends Table {
  TextColumn get id => text()();
  TextColumn get displayName => text().withLength(min: 1, max: 200)();
  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();
  DateTimeColumn get updatedAt => dateTime().withDefault(currentDateAndTime)();
  TextColumn get createdByDeviceId => text().withDefault(const Constant('local'))();
  IntColumn get revision => integer().withDefault(const Constant(1))();
  DateTimeColumn get deletedAt => dateTime().nullable()();

  @override
  Set<Column> get primaryKey => {id};
}

/// Subjects table. Phase 1A POC only.
class Subjects extends Table {
  TextColumn get id => text()();
  TextColumn get name => text().withLength(min: 1, max: 200)();
  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();
  DateTimeColumn get updatedAt => dateTime().withDefault(currentDateAndTime)();
  TextColumn get createdByDeviceId => text().withDefault(const Constant('local'))();
  IntColumn get revision => integer().withDefault(const Constant(1))();
  DateTimeColumn get deletedAt => dateTime().nullable()();

  @override
  Set<Column> get primaryKey => {id};
}

@DriftDatabase(tables: [Students, Subjects])
class AppDatabase extends _$AppDatabase {
  AppDatabase(super.e);

  @override
  int get schemaVersion => 1;
}

/// Opens a database at a given file path.
/// Used by tests and by the app (the app passes a path under app support dir).
LazyDatabase openAppDatabaseAt(File file) {
  return LazyDatabase(() async {
    return NativeDatabase.createInBackground(file);
  });
}

/// Convenience for the real app: resolves the app support directory.
Future<LazyDatabase> openAppDatabase() async {
  final dir = await getApplicationSupportDirectory();
  final file = File(p.join(dir.path, 'edumonitor.sqlite'));
  return openAppDatabaseAt(file);
}
