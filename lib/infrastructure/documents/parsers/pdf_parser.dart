import 'dart:io';

import 'package:syncfusion_flutter_pdf/pdf.dart';

import '../../../domain/documents/parsers/document_parser.dart';

class PdfParser implements DocumentParser {
  @override
  Future<List<String>> extractParagraphs(String filePath) async {
    final bytes = await File(filePath).readAsBytes();
    final document = PdfDocument(inputBytes: bytes);

    final extractor = PdfTextExtractor(document);
    final text = extractor.extractText();
    document.dispose();

    return _chunkText(text);
  }

  List<String> _chunkText(String text) {
    // PDF seringkali memiliki newline di akhir setiap baris (bukan paragraf).
    // Kita gabungkan baris yang terpotong, lalu pisahkan berdasarkan double newline.
    final cleaned = text.replaceAll(RegExp(r'(?<!\n)\n(?!\n)'), ' ');

    return cleaned
        .split(RegExp(r'\n\s*\n'))
        .map((p) => p.trim().replaceAll(RegExp(r'\s+'), ' '))
        .where((p) => p.isNotEmpty)
        .toList();
  }
}
