import 'package:drift/drift.dart';
import 'package:uuid/uuid.dart';

import '../../../domain/questions/question_repository.dart';
import '../app_database.dart';

class QuestionRepositoryImpl implements QuestionRepository {
  QuestionRepositoryImpl(this._db);
  final AppDatabase _db;
  final _uuid = const Uuid();

  @override
  Stream<List<Question>> watchQuestionsByTopic(String topicId) {
    return (_db.select(_db.questions)
          ..where((t) => t.topicId.equals(topicId) & t.deletedAt.isNull())
          ..orderBy([
            (t) =>
                OrderingTerm(expression: t.createdAt, mode: OrderingMode.desc),
          ]))
        .watch();
  }

  @override
  Future<void> saveQuestion({
    required String topicId,
    required String contentJson,
    required String answerJson,
    required String generatorId,
  }) async {
    await _db
        .into(_db.questions)
        .insert(
          QuestionsCompanion.insert(
            id: _uuid.v4(),
            topicId: topicId,
            generatorId: generatorId,
            status: const Value('draft'),
            contentJson: contentJson,
            answerJson: answerJson,
          ),
        );
  }

  @override
  Future<void> updateQuestion({
    required String id,
    String? contentJson,
    String? answerJson,
    String? status,
  }) async {
    await (_db.update(_db.questions)..where((t) => t.id.equals(id))).write(
      QuestionsCompanion(
        contentJson: contentJson != null
            ? Value(contentJson)
            : const Value.absent(),
        answerJson: answerJson != null
            ? Value(answerJson)
            : const Value.absent(),
        status: status != null ? Value(status) : const Value.absent(),
        updatedAt: Value(DateTime.now()),
      ),
    );
  }

  @override
  Future<void> deleteQuestion(String id) async {
    await (_db.update(_db.questions)..where((t) => t.id.equals(id))).write(
      QuestionsCompanion(
        deletedAt: Value(DateTime.now()),
        updatedAt: Value(DateTime.now()),
      ),
    );
  }
}
