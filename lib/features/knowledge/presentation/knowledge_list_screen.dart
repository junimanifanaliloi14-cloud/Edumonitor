import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../infrastructure/database/app_database.dart';
import '../../questions/presentation/question_generator.dart';
import '../../questions/presentation/question_providers.dart';
import '../../assessments/presentation/assessment_providers.dart';
import 'knowledge_providers.dart';

class KnowledgeListScreen extends ConsumerWidget {
  final Topic topic;
  const KnowledgeListScreen({super.key, required this.topic});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Topik: ${topic.name}'),
          backgroundColor: Colors.teal,
          foregroundColor: Colors.white,
          bottom: const TabBar(
            indicatorColor: Colors.white,
            tabs: [
              Tab(text: 'Pengetahuan', icon: Icon(Icons.lightbulb_outline)),
              Tab(text: 'Bank Soal', icon: Icon(Icons.quiz_outlined)),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            _KnowledgeTab(topic: topic),
            _QuestionBankTab(topic: topic),
          ],
        ),
      ),
    );
  }
}

class _KnowledgeTab extends ConsumerWidget {
  final Topic topic;
  const _KnowledgeTab({required this.topic});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final knowledgeAsync = ref.watch(knowledgeListProvider(topic.id));

    return knowledgeAsync.when(
      data: (items) {
        if (items.isEmpty) {
          return const Center(child: Text('Belum ada pengetahuan.'));
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
                    Align(
                      alignment: Alignment.centerRight,
                      child: ElevatedButton.icon(
                        onPressed: () async {
                          final generator = SimpleQuestionGenerator();
                          final result = generator.generateFromKnowledge(item);
                          await ref
                              .read(questionRepositoryProvider)
                              .saveQuestion(
                                topicId: topic.id,
                                contentJson: result['content']!,
                                answerJson: result['answer']!,
                                generatorId: 'generic-simple-v1',
                              );
                          if (context.mounted) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text(
                                  'Soal berhasil dibuat! Cek tab Bank Soal.',
                                ),
                              ),
                            );
                          }
                        },
                        icon: const Icon(Icons.auto_awesome, size: 18),
                        label: const Text('Buat Soal'),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.teal,
                          foregroundColor: Colors.white,
                        ),
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
    );
  }
}

class _QuestionBankTab extends ConsumerWidget {
  final Topic topic;
  const _QuestionBankTab({required this.topic});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final questionsAsync = ref.watch(questionListProvider(topic.id));

    return questionsAsync.when(
      data: (questions) {
        if (questions.isEmpty) {
          return const Center(
            child: Text('Belum ada soal. Generate dari tab Pengetahuan.'),
          );
        }
        return Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(12),
              child: ElevatedButton.icon(
                onPressed: () async {
                  final titleController = TextEditingController(
                    text: 'Ujian ${topic.name}',
                  );
                  showDialog(
                    context: context,
                    builder: (ctx) => AlertDialog(
                      title: const Text('Buat Paket Ujian'),
                      content: TextField(
                        controller: titleController,
                        decoration: const InputDecoration(
                          labelText: 'Judul Ujian',
                        ),
                      ),
                      actions: [
                        TextButton(
                          onPressed: () => Navigator.pop(ctx),
                          child: const Text('Batal'),
                        ),
                        ElevatedButton(
                          onPressed: () async {
                            await ref
                                .read(assessmentRepositoryProvider)
                                .createAssessmentFromQuestions(
                                  title: titleController.text.trim(),
                                  questions: questions,
                                );
                            if (ctx.mounted) Navigator.pop(ctx);
                            if (context.mounted) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text(
                                    'Asesmen berhasil dibuat! Cek tab Asesmen di menu utama.',
                                  ),
                                ),
                              );
                            }
                          },
                          child: const Text('Simpan'),
                        ),
                      ],
                    ),
                  );
                },
                icon: const Icon(Icons.playlist_add_check),
                label: Text('Jadikan Paket Ujian (${questions.length} Soal)'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.orange,
                  foregroundColor: Colors.white,
                  minimumSize: const Size(double.infinity, 48),
                ),
              ),
            ),
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                itemCount: questions.length,
                itemBuilder: (context, index) {
                  final q = questions[index];
                  final contentMap =
                      jsonDecode(q.contentJson) as Map<String, dynamic>;
                  final textBlock =
                      (contentMap['blocks'] as List).first
                          as Map<String, dynamic>;
                  final options = (contentMap['options'] as List)
                      .cast<String>();
                  final answerMap =
                      jsonDecode(q.answerJson) as Map<String, dynamic>;
                  final correctIndex = answerMap['correctIndex'] as int;

                  return Card(
                    margin: const EdgeInsets.only(bottom: 16),
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Soal #${index + 1}',
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.grey,
                                ),
                              ),
                              Chip(
                                label: Text(q.status.toUpperCase()),
                                backgroundColor: Colors.orange.shade50,
                              ),
                            ],
                          ),
                          const SizedBox(height: 8),
                          Text(
                            textBlock['text'],
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          const SizedBox(height: 12),
                          ...options.asMap().entries.map((entry) {
                            final isCorrect = entry.key == correctIndex;
                            return Padding(
                              padding: const EdgeInsets.only(bottom: 8),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Icon(
                                    isCorrect
                                        ? Icons.check_circle
                                        : Icons.radio_button_unchecked,
                                    color: isCorrect
                                        ? Colors.green
                                        : Colors.grey,
                                    size: 20,
                                  ),
                                  const SizedBox(width: 8),
                                  Expanded(
                                    child: Text(
                                      entry.value,
                                      style: TextStyle(
                                        color: isCorrect
                                            ? Colors.green
                                            : Colors.black87,
                                        fontWeight: isCorrect
                                            ? FontWeight.bold
                                            : FontWeight.normal,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            );
                          }),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        );
      },
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (err, stack) => Center(child: Text('Error: $err')),
    );
  }
}
