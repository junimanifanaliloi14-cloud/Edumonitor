import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../infrastructure/database/app_database.dart';
import '../../knowledge/presentation/knowledge_providers.dart';
import '../../curriculum/presentation/topic_providers.dart';
import 'document_providers.dart';

class DocumentDetailScreen extends ConsumerStatefulWidget {
  final SourceDocument document;
  const DocumentDetailScreen({super.key, required this.document});

  @override
  ConsumerState<DocumentDetailScreen> createState() =>
      _DocumentDetailScreenState();
}

class _DocumentDetailScreenState extends ConsumerState<DocumentDetailScreen> {
  bool _isProcessing = false;

  void _startExtraction() async {
    setState(() => _isProcessing = true);
    try {
      await ref
          .read(documentRepositoryProvider)
          .processDocument(widget.document);
      if (mounted) {
        ScaffoldMessenger.of(context)
            .showSnackBar(const SnackBar(content: Text('Ekstraksi berhasil!')));
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text('Gagal: $e')));
      }
    } finally {
      if (mounted) setState(() => _isProcessing = false);
    }
  }

  void _markAsKnowledge(DocumentChunk chunk) async {
    // Tampilkan dialog dan tunggu hasilnya (nama topik)
    final String? topicName = await showDialog<String>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Jadikan Pengetahuan'),
        content: Consumer(
          builder: (context, ref, child) {
            final topicsAsync = ref.watch(allTopicsProvider);
            return topicsAsync.when(
              data: (topics) {
                if (topics.isEmpty) {
                  return const Text(
                    'Belum ada Topik. Buat Topik di menu Kurikulum terlebih dahulu.',
                  );
                }
                return SizedBox(
                  width: 300,
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: topics.length,
                    itemBuilder: (context, index) {
                      final topic = topics[index];
                      return ListTile(
                        title: Text(topic.name),
                        onTap: () async {
                          await ref
                              .read(knowledgeRepositoryProvider)
                              .addKnowledgeFromChunk(
                                topicId: topic.id,
                                chunkId: chunk.id,
                                content: chunk.textContent,
                              );
                          // Kembalikan nama topik ke pemanggil dialog
                          if (context.mounted) {
                            Navigator.pop(context, topic.name);
                          }
                        },
                      );
                    },
                  ),
                );
              },
              loading: () => const Center(child: CircularProgressIndicator()),
              error: (e, s) => Text('Error: $e'),
            );
          },
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Batal'),
          ),
        ],
      ),
    );

    // Jika dialog mengembalikan nama topik, tampilkan SnackBar di sini
    if (topicName != null && mounted) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('Disimpan ke Topik: $topicName')));
    }
  }

  @override
  Widget build(BuildContext context) {
    final chunksAsync = ref.watch(documentChunksProvider(widget.document.id));

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.document.title, overflow: TextOverflow.ellipsis),
        backgroundColor: Colors.teal,
        foregroundColor: Colors.white,
      ),
      body: chunksAsync.when(
        data: (chunks) {
          if (chunks.isEmpty) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.text_snippet, size: 64, color: Colors.grey),
                  const SizedBox(height: 16),
                  const Text('Belum ada teks yang diekstrak.'),
                  const SizedBox(height: 16),
                  ElevatedButton.icon(
                    onPressed: _isProcessing ? null : _startExtraction,
                    icon: _isProcessing
                        ? const CircularProgressIndicator()
                        : const Icon(Icons.play_arrow),
                    label: Text(
                      _isProcessing ? 'Memproses...' : 'Ekstrak Teks (TXT)',
                    ),
                  ),
                ],
              ),
            );
          }

          return ListView.builder(
            padding: const EdgeInsets.all(16),
            itemCount: chunks.length,
            itemBuilder: (context, index) {
              final chunk = chunks[index];
              return Card(
                margin: const EdgeInsets.only(bottom: 12),
                child: Padding(
                  padding: const EdgeInsets.all(12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Paragraf ${chunk.sequence + 1}',
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.teal,
                            ),
                          ),
                          TextButton.icon(
                            onPressed: () => _markAsKnowledge(chunk),
                            icon: const Icon(Icons.add_task, size: 18),
                            label: const Text('Tandai Pengetahuan'),
                          ),
                        ],
                      ),
                      const Divider(),
                      Text(
                        chunk.textContent,
                        style: const TextStyle(fontSize: 15, height: 1.5),
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (err, stack) => Center(child: Text('Error: $err')),
      ),
    );
  }
}
