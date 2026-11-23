import 'package:drift/drift.dart';
import 'package:uuid/uuid.dart';

import '../../../domain/learning_objectives/learning_objective_repository.dart';
import '../app_database.dart';

class LearningObjectiveRepositoryImpl implements LearningObjectiveRepository {
  LearningObjectiveRepositoryImpl(this._db);
  final AppDatabase _db;
  final _uuid = const Uuid();

  @override
  Stream<List<LearningObjective>> watchLearningObjectives(String classroomId) {
    return (_db.select(_db.learningObjectives)
          ..where(
            (t) => t.classroomId.equals(classroomId) & t.deletedAt.isNull(),
          )
          ..orderBy([
            (t) => OrderingTerm(expression: t.sequence),
            (t) => OrderingTerm(expression: t.code),
          ]))
        .watch();
  }

  @override
  Future<void> createLearningObjective({
    required String classroomId,
    required String code,
    required String description,
    required int sequence,
    String? topicId,
  }) async {
    await _db
        .into(_db.learningObjectives)
        .insert(
          LearningObjectivesCompanion.insert(
            id: _uuid.v4(),
            classroomId: Value(classroomId),
            code: code,
            description: description,
            sequence: Value(sequence),
            topicId: Value(topicId),
          ),
        );
  }

  @override
  Future<void> updateLearningObjective({
    required String id,
    String? code,
    String? description,
    int? sequence,
  }) async {
    await (_db.update(
      _db.learningObjectives,
    )..where((t) => t.id.equals(id))).write(
      LearningObjectivesCompanion(
        code: code != null ? Value(code) : const Value.absent(),
        description: description != null
            ? Value(description)
            : const Value.absent(),
        sequence: sequence != null ? Value(sequence) : const Value.absent(),
        updatedAt: Value(DateTime.now()),
      ),
    );
  }

  @override
  Future<void> deleteLearningObjective(String id) async {
    await (_db.update(
      _db.learningObjectives,
    )..where((t) => t.id.equals(id))).write(
      LearningObjectivesCompanion(
        deletedAt: Value(DateTime.now()),
        updatedAt: Value(DateTime.now()),
      ),
    );
  }

  @override
  Stream<List<LearningObjective>> watchLearningObjectivesByTopic(
    String topicId,
  ) {
    return (_db.select(_db.learningObjectives)
          ..where((t) => t.topicId.equals(topicId) & t.deletedAt.isNull())
          ..orderBy([(t) => OrderingTerm(expression: t.sequence)]))
        .watch();
  }
}
