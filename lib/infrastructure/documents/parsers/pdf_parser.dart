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

    if (_looksLikeGibberish(text)) {
      throw Exception(
        'Gagal mengekstrak teks. PDF ini kemungkinan menggunakan font terenkripsi, '
        'hasil scan, atau format yang tidak didukung. '
        'Coba gunakan file PDF lain, atau konversi ke TXT/DOCX.',
      );
    }

    return _chunkText(text);
  }

  bool _looksLikeGibberish(String text) {
    if (text.trim().isEmpty) return true;

    // Deteksi jika ada deretan karakter heksadesimal panjang (seperti a77a65a84)
    final hexPattern = RegExp(r'([a-fA-F0-9]{15,})');
    final noSpaces = text.replaceAll(RegExp(r'\s+'), '');
    if (hexPattern.hasMatch(noSpaces)) {
      return true;
    }

    // Deteksi jika ada banyak "kata" yang sangat panjang tanpa spasi (tanda teks rusak)
    final words = text.split(RegExp(r'\s+'));
    final longWords = words.where((w) => w.length > 40).length;
    if (words.length > 5 && longWords > words.length * 0.1) {
      return true;
    }

    return false;
  }

  List<String> _chunkText(String text) {
    final normalized = text
        .replaceAll('\r\n', '\n')
        .replaceAll('\r', '\n')
        .trim();
    if (normalized.isEmpty) return <String>[];

    // 1. Blank line separation
    final blankLineChunks = normalized
        .split(RegExp(r'\n\s*\n'))
        .map(_clean)
        .where((p) => p.isNotEmpty)
        .toList();
    if (blankLineChunks.length > 1) return blankLineChunks;

    // 2. Single newlines
    final lineChunks = normalized
        .split('\n')
        .map(_clean)
        .where((p) => p.isNotEmpty)
        .toList();
    if (lineChunks.length > 1) {
      final sentenceChunks = _splitBySentences(normalized);
      return sentenceChunks.length > lineChunks.length
          ? sentenceChunks
          : lineChunks;
    }

    // 3. Sentence split
    final sentenceChunks = _splitBySentences(normalized);
    if (sentenceChunks.length > 1) return sentenceChunks;

    // 4. Fallback
    return <String>[normalized];
  }

  List<String> _splitBySentences(String text) {
    return text
        .split(RegExp(r'(?<=[.!?])\s+(?=[A-Z])'))
        .map(_clean)
        .where((p) => p.isNotEmpty)
        .toList();
  }

  String _clean(String s) => s.replaceAll(RegExp(r'\s+'), ' ').trim();
}
