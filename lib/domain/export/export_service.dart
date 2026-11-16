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

abstract interface class ExportService {
  /// Mengembalikan data untuk rapor satu siswa.
  Future<StudentReport> buildStudentReport(String studentId);

  /// Ekspor semua nilai ke CSV. Return path atau null jika user batal.
  Future<ExportResult?> exportAllScoresToCsv();

  /// Ekspor rapor satu siswa ke PDF. Return path atau null jika user batal.
  Future<ExportResult?> exportStudentReportToPdf(String studentId);
}
