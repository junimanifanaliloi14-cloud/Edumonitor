class ExportResult {
  const ExportResult({required this.filePath});
  final String filePath;
}

class StudentReportRow {
  const StudentReportRow({
    required this.assessmentTitle,
    required this.score,
    required this.completedAt,
  });

  final String assessmentTitle;
  final double score;
  final DateTime completedAt;
}

class StudentReport {
  const StudentReport({
    required this.studentId,
    required this.studentName,
    required this.rows,
  });

  final String studentId;
  final String studentName;
  final List<StudentReportRow> rows;

  double get averageScore => rows.isEmpty
      ? 0.0
      : rows.map((r) => r.score).reduce((a, b) => a + b) / rows.length;
}

/// Model untuk laporan kelas (matriks nilai semua siswa × semua asesmen).
class ClassReportData {
  const ClassReportData({
    required this.assessmentTitles,
    required this.studentRows,
  });

  /// Judul asesmen (kolom), maks 8 agar PDF muat di A4 landscape.
  final List<String> assessmentTitles;

  /// Baris per siswa dengan nilai untuk masing-masing asesmen.
  final List<ClassReportRow> studentRows;

  double get classAverage {
    final allScores = studentRows
        .expand((r) => r.scores)
        .whereType<double>()
        .toList();
    if (allScores.isEmpty) return 0.0;
    return allScores.reduce((a, b) => a + b) / allScores.length;
  }
}

class ClassReportRow {
  const ClassReportRow({
    required this.studentId,
    required this.studentName,
    required this.scores,
  });

  final String studentId;
  final String studentName;

  /// Selaras dengan ClassReportData.assessmentTitles. null = belum dikerjakan.
  final List<double?> scores;

  double? get average {
    final filled = scores.whereType<double>().toList();
    if (filled.isEmpty) return null;
    return filled.reduce((a, b) => a + b) / filled.length;
  }
}

abstract interface class ExportService {
  Future<StudentReport> buildStudentReport(String studentId);

  /// Bangun data matriks kelas dari semua attempt.
  Future<ClassReportData> buildClassReport({int maxColumns = 8});

  Future<ExportResult?> exportAllScoresToCsv();

  Future<ExportResult?> exportStudentReportToPdf(String studentId);

  Future<ExportResult?> exportClassReportToPdf();
}
