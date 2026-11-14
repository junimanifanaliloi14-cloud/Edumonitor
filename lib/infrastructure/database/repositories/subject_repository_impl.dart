import 'package:drift/drift.dart';
import 'package:uuid/uuid.dart';

import '../../../domain/curriculum/subject_repository.dart';
import '../app_database.dart';

class SubjectRepositoryImpl implements SubjectRepository {
  SubjectRepositoryImpl(this._db);
  final AppDatabase _db;
  final _uuid = const Uuid();

  @override
  Stream<List<Subject>> watchAllSubjects() {
    return (_db.select(_db.subjects)
          ..where((t) => t.deletedAt.isNull())
          ..orderBy([(t) => OrderingTerm(expression: t.name)]))
        .watch();
  }

  @override
  Future<void> addSubject(String name, String engineId) async {
    await _db
        .into(_db.subjects)
        .insert(
          SubjectsCompanion.insert(
            id: _uuid.v4(),
            name: name,
            engineId: Value(engineId),
          ),
        );
  }

  @override
  Future<void> deleteSubject(String id) async {
    await (_db.update(_db.subjects)..where((t) => t.id.equals(id))).write(
      SubjectsCompanion(
        deletedAt: Value(DateTime.now()),
        updatedAt: Value(DateTime.now()),
      ),
    );
  }
}
