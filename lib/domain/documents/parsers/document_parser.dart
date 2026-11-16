abstract interface class DocumentParser {
  /// Mengekstrak teks dari file dan mengembalikan list paragraf.
  Future<List<String>> extractParagraphs(String filePath);
}
