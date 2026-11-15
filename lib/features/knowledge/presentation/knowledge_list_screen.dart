import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../infrastructure/database/app_database.dart';
import 'knowledge_providers.dart';

class KnowledgeListScreen extends ConsumerWidget {
  final Topic topic;
  const KnowledgeListScreen({super.key, required this.topic});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final knowledgeAsync = ref.watch(knowledgeListProvider(topic.id));

    return Scaffold(
      appBar: AppBar(
        title: Text('Pengetahuan: ${topic.name}'),
        backgroundColor: Colors.teal,
        foregroundColor: Colors.white,
      ),
      body: knowledgeAsync.when(
        data: (items) {
          if (items.isEmpty) {
            return const Center(
              child: Text(
                'Belum ada pengetahuan.\nEkstrak materi di menu Materi.',
              ),
            );
          }
          return ListView.builder(
            padding: const EdgeInsets.all(12),
            itemCount: items.length,
            itemBuilder: (context, index) {
              final item = items[index];
              return Card(
                margin: const EdgeInsets.only(bottom: 12),
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Chip(
                            label: Text(item.type.toUpperCase()),
                            backgroundColor: Colors.teal.shade50,
                            labelStyle: const TextStyle(
                              color: Colors.teal,
                              fontSize: 12,
                            ),
                          ),
                          IconButton(
                            icon: const Icon(Icons.delete, color: Colors.red),
                            onPressed: () async {
                              await ref
                                  .read(knowledgeRepositoryProvider)
                                  .deleteKnowledge(item.id);
                            },
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),
                      Text(
                        item.content,
                        style: const TextStyle(fontSize: 16, height: 1.5),
                      ),
                      const SizedBox(height: 12),
                      Text(
                        'Status: ${item.status}',
                        style: TextStyle(
                          color: item.status == 'verified'
                              ? Colors.green
                              : Colors.orange,
                          fontWeight: FontWeight.bold,
                        ),
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
      // Nanti kita akan menaruh tombol "Generate Soal" di sini
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Fitur Generator Soal segera hadir!')),
          );
        },
        backgroundColor: Colors.teal,
        icon: const Icon(Icons.auto_awesome),
        label: const Text('Buat Soal'),
      ),
    );
  }
}
