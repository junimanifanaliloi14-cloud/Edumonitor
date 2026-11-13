/// High-level capabilities an engine may declare support for.
enum Capability {
  generateQuestion,
  validateQuestion,
  explainResult,
  parseKnowledge,
  solveNumeric,
  solveSymbolic,
}

/// Semver range and schema version an engine is compatible with.
class Compatibility {
  const Compatibility({
    required this.minAppVersion,
    required this.maxAppVersion,
    required this.questionSchemaVersion,
  });

  final String minAppVersion;
  final String maxAppVersion;
  final int questionSchemaVersion;

  @override
  String toString() =>
      'Compatibility($minAppVersion..$maxAppVersion, qsv=$questionSchemaVersion)';
}

/// Simple health report an engine returns.
class EngineHealth {
  const EngineHealth({required this.ok, this.message});

  final bool ok;
  final String? message;

  @override
  String toString() =>
      'EngineHealth(ok=$ok${message == null ? '' : ', $message'})';
}
