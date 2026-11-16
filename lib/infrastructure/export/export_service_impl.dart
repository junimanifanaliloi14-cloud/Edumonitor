import 'dart:convert';

import 'package:drift/drift.dart';
import 'package:file_picker/file_picker.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;

import '../../domain/export/export_service.dart';
import '../database/app_database.dart';

/// Builder CSV yang kompatibel dengan Excel Indonesia.
/// - Delimiter: `;` (bukan `,`)
/// - File disertai UTF-8 BOM agar karakter Indonesia terbaca benar
class CsvBuilder {
  static String build(List<List<String>> rows, {String delimiter = ';'}) {
    return rows
        .map(
          (row) =>
              row.map((field) => _escape(field, delimiter)).join(delimiter),
        )
        .join('\r\n');
  }

  static String _escape(String value, String delimiter) {
    if (value.contains(delimiter) ||
        value.contains('"') ||
        value.contains('\n') ||
        value.contains('\r')) {
      return '"${value.replaceAll('"', '""')}"';
    }
    return value;
  }
}

class ExportServiceImpl implements ExportService {
  ExportServiceImpl(this._db);
  final AppDatabase _db;

  // ==========================================
  // BUILD REPORT
  // ==========================================

  @override
  Future<StudentReport> buildStudentReport(String studentId) async {
    final student = await (_db.select(
      _db.students,
    )..where((t) => t.id.equals(studentId))).getSingle();

    final query =
        _db.select(_db.studentAttempts).join([
            innerJoin(
              _db.assessmentSnapshots,
              _db.assessmentSnapshots.id.equalsExp(
                _db.studentAttempts.assessmentSnapshotId,
              ),
            ),
            innerJoin(
              _db.assessments,
              _db.assessments.id.equalsExp(
                _db.assessmentSnapshots.assessmentId,
              ),
            ),
            leftOuterJoin(
              _db.studentAnswers,
              _db.studentAnswers.attemptId.equalsExp(_db.studentAttempts.id),
            ),
          ])
          ..where(_db.studentAttempts.studentId.equals(studentId))
          ..where(_db.studentAttempts.deletedAt.isNull())
          ..orderBy([OrderingTerm.desc(_db.studentAttempts.completedAt)]);

    final rows = await query.get();
    final reportRows = <StudentReportRow>[];

    for (final row in rows) {
      final attempt = row.readTable(_db.studentAttempts);
      final assessment = row.readTable(_db.assessments);
      final answer = row.readTableOrNull(_db.studentAnswers);

      reportRows.add(
        StudentReportRow(
          assessmentTitle: assessment.title,
          score: answer?.score ?? 0.0,
          completedAt: attempt.completedAt ?? attempt.startedAt,
        ),
      );
    }

    return StudentReport(
      studentId: student.id,
      studentName: student.displayName,
      rows: reportRows,
    );
  }

  // ==========================================
  // PDF EXPORT
  // ==========================================

  @override
  Future<ExportResult?> exportStudentReportToPdf(String studentId) async {
    final report = await buildStudentReport(studentId);
    final bytes = await _generatePdfBytes(report);
    return _saveToFile(
      bytes,
      'rapor_${_sanitize(report.studentName)}_${_timestamp()}.pdf',
    );
  }

  Future<Uint8List> _generatePdfBytes(StudentReport report) async {
    final pdf = pw.Document();

    pdf.addPage(
      pw.MultiPage(
        pageFormat: PdfPageFormat.a4,
        margin: const pw.EdgeInsets.all(32),
        build: (context) => [
          pw.Header(
            level: 0,
            child: pw.Column(
              crossAxisAlignment: pw.CrossAxisAlignment.start,
              children: [
                pw.Text(
                  'Rapor Siswa',
                  style: pw.TextStyle(
                    fontSize: 24,
                    fontWeight: pw.FontWeight.bold,
                  ),
                ),
                pw.SizedBox(height: 4),
                pw.Text(
                  'EduMonitor - Offline Learning Platform',
                  style: const pw.TextStyle(
                    fontSize: 10,
                    color: PdfColors.grey700,
                  ),
                ),
              ],
            ),
          ),
          pw.SizedBox(height: 16),
          pw.Row(
            mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
            crossAxisAlignment: pw.CrossAxisAlignment.start,
            children: [
              pw.Column(
                crossAxisAlignment: pw.CrossAxisAlignment.start,
                children: [
                  pw.Text(
                    'Nama Siswa:',
                    style: pw.TextStyle(fontWeight: pw.FontWeight.bold),
                  ),
                  pw.Text(
                    report.studentName,
                    style: const pw.TextStyle(fontSize: 16),
                  ),
                ],
              ),
              pw.Column(
                crossAxisAlignment: pw.CrossAxisAlignment.end,
                children: [
                  pw.Text(
                    'Tanggal Cetak:',
                    style: pw.TextStyle(fontWeight: pw.FontWeight.bold),
                  ),
                  pw.Text(_formatDate(DateTime.now())),
                ],
              ),
            ],
          ),
          pw.SizedBox(height: 24),
          if (report.rows.isEmpty)
            pw.Text('Belum ada nilai yang tercatat.')
          else
            pw.TableHelper.fromTextArray(
              headers: const ['No', 'Asesmen', 'Nilai', 'Tanggal'],
              data: List.generate(
                report.rows.length,
                (i) => [
                  '${i + 1}',
                  report.rows[i].assessmentTitle,
                  report.rows[i].score.toStringAsFixed(1),
                  _formatDate(report.rows[i].completedAt),
                ],
              ),
              border: pw.TableBorder.all(color: PdfColors.grey400),
              headerStyle: pw.TextStyle(fontWeight: pw.FontWeight.bold),
              headerDecoration: const pw.BoxDecoration(
                color: PdfColors.grey300,
              ),
              cellAlignments: {
                0: pw.Alignment.center,
                1: pw.Alignment.centerLeft,
                2: pw.Alignment.center,
                3: pw.Alignment.center,
              },
            ),
          pw.SizedBox(height: 16),
          if (report.rows.isNotEmpty)
            pw.Container(
              alignment: pw.Alignment.centerRight,
              child: pw.Text(
                'Rata-rata Nilai: ${report.averageScore.toStringAsFixed(1)}',
                style: pw.TextStyle(
                  fontWeight: pw.FontWeight.bold,
                  fontSize: 14,
                ),
              ),
            ),
        ],
        footer: (context) => pw.Container(
          alignment: pw.Alignment.centerRight,
          margin: const pw.EdgeInsets.only(top: 12),
          child: pw.Text(
            'Halaman ${context.pageNumber} dari ${context.pagesCount}',
            style: const pw.TextStyle(fontSize: 9, color: PdfColors.grey600),
          ),
        ),
      ),
    );

    return Uint8List.fromList(await pdf.save());
  }

  // ==========================================
  // CSV EXPORT
  // ==========================================

  @override
  Future<ExportResult?> exportAllScoresToCsv() async {
    final query =
        _db.select(_db.studentAttempts).join([
            innerJoin(
              _db.students,
              _db.students.id.equalsExp(_db.studentAttempts.studentId),
            ),
            innerJoin(
              _db.assessmentSnapshots,
              _db.assessmentSnapshots.id.equalsExp(
                _db.studentAttempts.assessmentSnapshotId,
              ),
            ),
            innerJoin(
              _db.assessments,
              _db.assessments.id.equalsExp(
                _db.assessmentSnapshots.assessmentId,
              ),
            ),
            leftOuterJoin(
              _db.studentAnswers,
              _db.studentAnswers.attemptId.equalsExp(_db.studentAttempts.id),
            ),
          ])
          ..where(_db.studentAttempts.deletedAt.isNull())
          ..orderBy([
            OrderingTerm.asc(_db.students.displayName),
            OrderingTerm.desc(_db.studentAttempts.completedAt),
          ]);

    final rows = await query.get();

    final csvData = <List<String>>[
      <String>['Nama Siswa', 'Asesmen', 'Nilai', 'Tanggal'],
    ];

    for (final row in rows) {
      final student = row.readTable(_db.students);
      final attempt = row.readTable(_db.studentAttempts);
      final assessment = row.readTable(_db.assessments);
      final answer = row.readTableOrNull(_db.studentAnswers);

      csvData.add(<String>[
        student.displayName,
        assessment.title,
        (answer?.score ?? 0.0).toStringAsFixed(1).replaceAll('.', ','),
        _formatDate(attempt.completedAt ?? attempt.startedAt),
      ]);
    }

    final csvString = CsvBuilder.build(csvData);
    // UTF-8 BOM agar Excel Windows membaca karakter Indonesia dengan benar
    final bytes = Uint8List.fromList([
      0xEF,
      0xBB,
      0xBF,
      ...utf8.encode(csvString),
    ]);

    return _saveToFile(bytes, 'nilai_siswa_${_timestamp()}.csv');
  }

  // ==========================================
  // HELPERS
  // ==========================================

  Future<ExportResult?> _saveToFile(Uint8List bytes, String filename) async {
    final saveUri = await FilePicker.saveFile(
      dialogTitle: 'Simpan File',
      fileName: filename,
      bytes: bytes,
    );
    if (saveUri == null) return null;
    return ExportResult(filePath: saveUri.path);
  }

  String _formatDate(DateTime dt) =>
      '${dt.day.toString().padLeft(2, '0')}/'
      '${dt.month.toString().padLeft(2, '0')}/'
      '${dt.year}';

  String _timestamp() {
    final now = DateTime.now();
    return '${now.year}'
        '${now.month.toString().padLeft(2, '0')}'
        '${now.day.toString().padLeft(2, '0')}_'
        '${now.hour.toString().padLeft(2, '0')}'
        '${now.minute.toString().padLeft(2, '0')}';
  }

  String _sanitize(String s) =>
      s.replaceAll(RegExp(r'[^\w\s]'), '').replaceAll(' ', '_');
}
