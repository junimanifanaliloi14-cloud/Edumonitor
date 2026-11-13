import '../../core/errors/app_error.dart';
import '../../core/result/result.dart';
import 'capability.dart';
import 'generation.dart';

/// Standard contract every SubjectEngine must satisfy.
/// Engines MUST NOT access the database directly. They receive typed input
/// and return structured results via application services.
abstract interface class SubjectEngine {
  String get subjectId;
  String get engineVersion;
  Set<Capability> get requiredCapabilities;
  Compatibility get compatibility;

  Future<Result<GenerationResult, AppError>> generate(
    GenerationRequest request,
  );

  Future<Result<ValidationReport, AppError>> validateQuestion(
    QuestionDraft draft,
  );

  EngineHealth healthCheck();
}
