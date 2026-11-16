import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../infrastructure/database/app_database.dart';
import '../../curriculum/presentation/topic_providers.dart';
import '../../knowledge/presentation/knowledge_providers.dart';
import 'document_providers.dart';

const _knowledgeTypeLabels = <String, String>{
  'concept': 'Konsep / Definisi',
  'fact': 'Fakta / Entitas',
  'relation': 'Hubungan',
  'sequence': 'Urutan / Proses',
  'passage': 'Bacaan',
};

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

  Future<void> _markAsKnowledge(DocumentChunk chunk) async {
    final result = await showDialog<Map<String, String>>(
      context: context,
      builder: (ctx) => _MarkKnowledgeDialog(chunk: chunk),
    );

    if (result == null) return;

    final topicId = result['topicId']!;
    final type = result['type']!;

    try {
      await ref
          .read(knowledgeRepositoryProvider)
          .addKnowledgeFromChunk(
            topicId: topicId,
            chunkId: chunk.id,
            content: chunk.textContent,
            type: type,
          );
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Pengetahuan berhasil disimpan sebagai draft.'),
          ),
        );
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text('Gagal menyimpan: $e')));
      }
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
                      _isProcessing ? 'Memproses...' : 'Ekstrak Teks',
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

class _MarkKnowledgeDialog extends ConsumerStatefulWidget {
  final DocumentChunk chunk;
  const _MarkKnowledgeDialog({required this.chunk});

  @override
  ConsumerState<_MarkKnowledgeDialog> createState() =>
      _MarkKnowledgeDialogState();
}

class _MarkKnowledgeDialogState extends ConsumerState<_MarkKnowledgeDialog> {
  String? _selectedTopicId;
  String _selectedType = 'concept';

  @override
  Widget build(BuildContext context) {
    final topicsAsync = ref.watch(allTopicsProvider);

    return AlertDialog(
      title: const Text('Tandai sebagai Pengetahuan'),
      content: SizedBox(
        width: 400,
        child: topicsAsync.when(
          data: (topics) {
            if (topics.isEmpty) {
              return const Text(
                'Belum ada Topik. Buat Topik di menu Kurikulum terlebih dahulu.',
              );
            }
            return SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Pilih topik:',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  DropdownButtonFormField<String>(
                    initialValue: _selectedTopicId,
                    isExpanded: true,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Pilih topik...',
                    ),
                    items: topics
                        .map(
                          (t) => DropdownMenuItem(
                            value: t.id,
                            child: Text(t.name),
                          ),
                        )
                        .toList(),
                    onChanged: (v) => setState(() => _selectedTopicId = v),
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    'Tipe pengetahuan:',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  DropdownButtonFormField<String>(
                    initialValue: _selectedType,
                    isExpanded: true,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                    ),
                    items: _knowledgeTypeLabels.entries
                        .map(
                          (e) => DropdownMenuItem(
                            value: e.key,
                            child: Text(e.value),
                          ),
                        )
                        .toList(),
                    onChanged: (v) {
                      if (v != null) setState(() => _selectedType = v);
                    },
                  ),
                ],
              ),
            );
          },
          loading: () => const Center(child: CircularProgressIndicator()),
          error: (e, _) => Text('Error: $e'),
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text('Batal'),
        ),
        ElevatedButton(
          onPressed: _selectedTopicId == null
              ? null
              : () => Navigator.pop(context, {
                  'topicId': _selectedTopicId!,
                  'type': _selectedType,
                }),
          child: const Text('Simpan'),
        ),
      ],
    );
  }
}
