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
}
