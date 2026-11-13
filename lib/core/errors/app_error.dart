sealed class AppError {
  const AppError({required this.code, required this.message, this.cause});

  final String code;
  final String message;
  final Object? cause;

  @override
  String toString() => 'AppError($code): $message';
}

final class ValidationError extends AppError {
  const ValidationError({
    required super.code,
    required super.message,
    super.cause,
  });
}

final class NotFoundError extends AppError {
  const NotFoundError({
    required super.code,
    required super.message,
    super.cause,
  });
}

final class PermissionError extends AppError {
  const PermissionError({
    required super.code,
    required super.message,
    super.cause,
  });
}

final class ConflictError extends AppError {
  const ConflictError({
    required super.code,
    required super.message,
    super.cause,
  });
}

final class IoError extends AppError {
  const IoError({required super.code, required super.message, super.cause});
}

final class EngineError extends AppError {
  const EngineError({required super.code, required super.message, super.cause});
}

final class RuleError extends AppError {
  const RuleError({required super.code, required super.message, super.cause});
}

final class SchemaError extends AppError {
  const SchemaError({required super.code, required super.message, super.cause});
}

final class PackageSecurityError extends AppError {
  const PackageSecurityError({
    required super.code,
    required super.message,
    super.cause,
  });
}
