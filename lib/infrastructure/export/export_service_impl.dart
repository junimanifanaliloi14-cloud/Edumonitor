import 'dart:convert';

import 'package:drift/drift.dart';
import 'package:file_picker/file_picker.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;

import '../../domain/export/export_service.dart';
import '../database/app_database.dart';

/// Builder CSV yang kompatibel dengan Excel Indonesia.
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
  // CSV EXPORT — format tanggal compact
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
        _formatDateCompact(attempt.completedAt ?? attempt.startedAt),
      ]);
    }

    final csvString = CsvBuilder.build(csvData);
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

  /// Format panjang untuk PDF (17/11/2026)
  String _formatDate(DateTime dt) =>
      '${dt.day.toString().padLeft(2, '0')}/'
      '${dt.month.toString().padLeft(2, '0')}/'
      '${dt.year}';

  /// Format pendek untuk CSV (17/11/26) — hemat lebar kolom di Excel
  String _formatDateCompact(DateTime dt) =>
      '${dt.day.toString().padLeft(2, '0')}/'
      '${dt.month.toString().padLeft(2, '0')}/'
      '${dt.year.toString().substring(2)}';

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

  // ==========================================
  // CLASS REPORT (Phase 17C)
  // ==========================================

  @override
  Future<ClassReportData> buildClassReport({int maxColumns = 8}) async {
    // 1. Ambil semua assessment (unik) dengan attempt di dalamnya
    final allAttempts =
        await (_db.select(_db.studentAttempts).join([
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
                  _db.studentAnswers.attemptId.equalsExp(
                    _db.studentAttempts.id,
                  ),
                ),
              ])
              ..where(_db.studentAttempts.deletedAt.isNull())
              ..where(_db.students.deletedAt.isNull()))
            .get();

    if (allAttempts.isEmpty) {
      return const ClassReportData(assessmentTitles: [], studentRows: []);
    }

    // 2. Kumpulkan (studentId, studentName, assessmentTitle, score)
    final Map<String, String> studentNames = {};
    final Map<String, double> scoreMap =
        {}; // key: "$studentId|$assessmentTitle"
    final Set<String> assessmentSet = {};
    final Map<String, DateTime> assessmentDates = {};

    for (final row in allAttempts) {
      final student = row.readTable(_db.students);
      final attempt = row.readTable(_db.studentAttempts);
      final assessment = row.readTable(_db.assessments);
      final answer = row.readTableOrNull(_db.studentAnswers);

      studentNames[student.id] = student.displayName;
      assessmentSet.add(assessment.title);
      final date = attempt.completedAt ?? attempt.startedAt;
      if (!assessmentDates.containsKey(assessment.title) ||
          date.isBefore(assessmentDates[assessment.title]!)) {
        assessmentDates[assessment.title] = date;
      }

      if (answer?.score != null) {
        scoreMap['${student.id}|${assessment.title}'] = answer!.score!;
      }
    }

    // 3. Urutkan asesmen berdasarkan tanggal, ambil maxColumns terakhir
    final sortedAssessments = assessmentSet.toList()
      ..sort((a, b) {
        final da = assessmentDates[a] ?? DateTime(2000);
        final db = assessmentDates[b] ?? DateTime(2000);
        return da.compareTo(db);
      });
    final selectedAssessments = sortedAssessments.length > maxColumns
        ? sortedAssessments.sublist(sortedAssessments.length - maxColumns)
        : sortedAssessments;

    // 4. Susun baris siswa
    final studentIds = studentNames.keys.toList()
      ..sort((a, b) => studentNames[a]!.compareTo(studentNames[b]!));

    final studentRows = <ClassReportRow>[];
    for (final sid in studentIds) {
      final scores = <double?>[];
      for (final title in selectedAssessments) {
        scores.add(scoreMap['$sid|$title']);
      }
      studentRows.add(
        ClassReportRow(
          studentId: sid,
          studentName: studentNames[sid]!,
          scores: scores,
        ),
      );
    }

    return ClassReportData(
      assessmentTitles: selectedAssessments,
      studentRows: studentRows,
    );
  }

  @override
  Future<ExportResult?> exportClassReportToPdf() async {
    final report = await buildClassReport();
    if (report.assessmentTitles.isEmpty) {
      throw Exception(
        'Belum ada data nilai untuk dilaporkan. Catat nilai di menu Asesmen.',
      );
    }

    final bytes = await _generateClassPdfBytes(report);
    return _saveToFile(bytes, 'laporan_kelas_${_timestamp()}.pdf');
  }

  Future<Uint8List> _generateClassPdfBytes(ClassReportData report) async {
    final pdf = pw.Document();

    pdf.addPage(
      pw.MultiPage(
        pageFormat: PdfPageFormat.a4.landscape,
        margin: const pw.EdgeInsets.all(24),
        build: (context) => [
          pw.Header(
            level: 0,
            child: pw.Column(
              crossAxisAlignment: pw.CrossAxisAlignment.start,
              children: [
                pw.Text(
                  'Laporan Kelas',
                  style: pw.TextStyle(
                    fontSize: 20,
                    fontWeight: pw.FontWeight.bold,
                  ),
                ),
                pw.SizedBox(height: 4),
                pw.Text(
                  'EduMonitor - Offline Learning Platform',
                  style: const pw.TextStyle(
                    fontSize: 9,
                    color: PdfColors.grey700,
                  ),
                ),
              ],
            ),
          ),
          pw.SizedBox(height: 12),
          pw.Row(
            mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
            children: [
              pw.Text('Jumlah Siswa: ${report.studentRows.length}'),
              pw.Text('Tanggal Cetak: ${_formatDate(DateTime.now())}'),
            ],
          ),
          pw.SizedBox(height: 16),
          _buildClassTable(report),
        ],
        footer: (context) => pw.Container(
          alignment: pw.Alignment.centerRight,
          margin: const pw.EdgeInsets.only(top: 8),
          child: pw.Text(
            'Halaman ${context.pageNumber} dari ${context.pagesCount}',
            style: const pw.TextStyle(fontSize: 8, color: PdfColors.grey600),
          ),
        ),
      ),
    );

    return Uint8List.fromList(await pdf.save());
  }

  pw.Widget _buildClassTable(ClassReportData report) {
    final headerCells = <String>[
      'Siswa',
      ...report.assessmentTitles,
      'Rata-rata',
    ];

    final bodyRows = <List<pw.Widget>>[];
    for (final row in report.studentRows) {
      final cells = <pw.Widget>[
        pw.Text(row.studentName, style: const pw.TextStyle(fontSize: 9)),
      ];
      for (final score in row.scores) {
        cells.add(_scoreCell(score));
      }
      cells.add(_scoreCell(row.average, bold: true));
      bodyRows.add(cells);
    }

    // Baris rata-rata kelas
    final classCells = <pw.Widget>[
      pw.Text(
        'Rata-rata Kelas',
        style: pw.TextStyle(fontSize: 9, fontWeight: pw.FontWeight.bold),
      ),
    ];
    for (var i = 0; i < report.assessmentTitles.length; i++) {
      final scores = report.studentRows
          .map((r) => r.scores[i])
          .whereType<double>()
          .toList();
      final avg = scores.isEmpty
          ? null
          : scores.reduce((a, b) => a + b) / scores.length;
      classCells.add(_scoreCell(avg, bold: true));
    }
    classCells.add(_scoreCell(report.classAverage, bold: true));
    bodyRows.add(classCells);

    return pw.Table(
      border: pw.TableBorder.all(color: PdfColors.grey400, width: 0.5),
      children: [
        pw.TableRow(
          decoration: const pw.BoxDecoration(color: PdfColors.grey300),
          children: headerCells
              .map(
                (h) => pw.Padding(
                  padding: const pw.EdgeInsets.all(4),
                  child: pw.Text(
                    h,
                    style: pw.TextStyle(
                      fontSize: 9,
                      fontWeight: pw.FontWeight.bold,
                    ),
                    textAlign: pw.TextAlign.center,
                  ),
                ),
              )
              .toList(),
        ),
        ...bodyRows.map((cells) => pw.TableRow(children: cells)),
      ],
    );
  }

  pw.Widget _scoreCell(double? score, {bool bold = false}) {
    if (score == null) {
      return pw.Padding(
        padding: const pw.EdgeInsets.all(4),
        child: pw.Text(
          '-',
          style: const pw.TextStyle(fontSize: 9, color: PdfColors.grey500),
          textAlign: pw.TextAlign.center,
        ),
      );
    }

    PdfColor bg;
    if (score < 70) {
      bg = PdfColors.red100;
    } else if (score < 85) {
      bg = PdfColors.yellow100;
    } else {
      bg = PdfColors.green100;
    }

    return pw.Container(
      color: bg,
      padding: const pw.EdgeInsets.all(4),
      child: pw.Text(
        score.toStringAsFixed(1),
        style: pw.TextStyle(
          fontSize: 9,
          fontWeight: bold ? pw.FontWeight.bold : pw.FontWeight.normal,
        ),
        textAlign: pw.TextAlign.center,
      ),
    );
  }
}
