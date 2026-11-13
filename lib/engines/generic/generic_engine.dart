import '../../core/errors/app_error.dart';
import '../../core/result/result.dart';
import '../contract/capability.dart';
import '../contract/generation.dart';
import '../contract/subject_engine.dart';

/// Generic Subject Engine. Full implementation arrives in Phase 7.
/// Phase 1A: registered stub that declares its capabilities and fails
/// gracefully with a clear EngineError.
final class GenericEngine implements SubjectEngine {
  const GenericEngine();

  @override
  String get subjectId => 'generic';

  @override
  String get engineVersion => '0.1.0';

  @override
  Set<Capability> get requiredCapabilities => <Capability>{
    Capability.generateQuestion,
    Capability.validateQuestion,
  };

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
        message: 'GenericEngine.generate is not implemented in Phase 1A.',
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
        message:
            'GenericEngine.validateQuestion is not implemented in Phase 1A.',
      ),
    );
  }

  @override
  EngineHealth healthCheck() => const EngineHealth(ok: true, message: 'stub');
}
