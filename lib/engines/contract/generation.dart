/// Content block types for question rendering. Phase 1A supports text only.
/// Additional block types (Formula, Table, Graph, Image, Molecule, Data)
/// will be added in Phase 6 (Question Core) without breaking this contract.
sealed class ContentBlock {
  const ContentBlock();
}

final class TextBlock extends ContentBlock {
  const TextBlock(this.text);
  final String text;
}

/// Structured question content. Never a single string.
class QuestionContent {
  const QuestionContent({required this.blocks, this.schemaVersion = 1});

  final List<ContentBlock> blocks;
  final int schemaVersion;
}

/// A generated question draft, not yet reviewed by teacher.
class QuestionDraft {
  const QuestionDraft({required this.id, required this.content});

  final String id;
  final QuestionContent content;
}

/// Request that a SubjectEngine generates questions.
class GenerationRequest {
  const GenerationRequest({
    required this.subjectId,
    required this.knowledgeIds,
    required this.targetCount,
    required this.seed,
  });

  final String subjectId;
  final List<String> knowledgeIds;
  final int targetCount;
  final int seed;
}

/// Result of a generation request.
class GenerationResult {
  const GenerationResult({required this.drafts});
  final List<QuestionDraft> drafts;
}

/// Result of validation. Phase 1A returns a simple list of issues.
class ValidationReport {
  const ValidationReport({
    required this.isValid,
    this.issues = const <String>[],
  });

  final bool isValid;
  final List<String> issues;
}
