class ReportingMetrics {
  const ReportingMetrics({
    required this.totalStudents,
    required this.totalSubjects,
    required this.totalDocuments,
    required this.totalQuestions,
    required this.pendingQuestions,
    required this.totalAssessments,
    required this.classAverage,
    required this.highestScore,
    required this.lowestScore,
    required this.scoreTrend,
    required this.studentsNeedingAttention,
  });

  final int totalStudents;
  final int totalSubjects;
  final int totalDocuments;
  final int totalQuestions;
  final int pendingQuestions;
  final int totalAssessments;
  final double classAverage;
  final double highestScore;
  final double lowestScore;
  final List<ScoreTrendPoint> scoreTrend;
  final List<StudentAttentionItem> studentsNeedingAttention;
}

class ScoreTrendPoint {
  const ScoreTrendPoint({
    required this.assessmentTitle,
    required this.completedAt,
    required this.averageScore,
    required this.attemptCount,
  });

  final String assessmentTitle;
  final DateTime completedAt;
  final double averageScore;
  final int attemptCount;
}

class StudentAttentionItem {
  const StudentAttentionItem({
    required this.studentId,
    required this.studentName,
    required this.averageScore,
    required this.attemptCount,
  });

  final String studentId;
  final String studentName;
  final double averageScore;
  final int attemptCount;
}
