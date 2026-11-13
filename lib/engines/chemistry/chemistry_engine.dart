import '../../core/errors/app_error.dart';
import '../../core/result/result.dart';
import '../contract/capability.dart';
import '../contract/generation.dart';
import '../contract/subject_engine.dart';

final class ChemistryEngine implements SubjectEngine {
  const ChemistryEngine();

  @override
  String get subjectId => 'chemistry';

  @override
  String get engineVersion => '0.1.0';

  @override
  Set<Capability> get requiredCapabilities => const <Capability>{};

  @override
  Compatibility get compatibility => const Compatibility(
    minAppVersion: '0.1.0',
    maxAppVersion: '99.99.99',
    questionSchemaVersion: 1,
  );

  @override
  Future<Result<GenerationResult, AppError>> generate(
    GenerationRequest request,
  ) async {
    return const Err(
      EngineError(
        code: 'engine.not_implemented',
        message: 'ChemistryEngine is a stub in Phase 1A.',
      ),
    );
  }

  @override
  Future<Result<ValidationReport, AppError>> validateQuestion(
    QuestionDraft draft,
  ) async {
    return const Err(
      EngineError(
        code: 'engine.not_implemented',
        message: 'ChemistryEngine is a stub in Phase 1A.',
      ),
    );
  }

  @override
  EngineHealth healthCheck() => const EngineHealth(ok: true, message: 'stub');
}
