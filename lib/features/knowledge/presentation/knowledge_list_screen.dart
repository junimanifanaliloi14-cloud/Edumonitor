import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../infrastructure/database/app_database.dart';
import '../../assessments/presentation/assessment_providers.dart';
import '../../questions/presentation/question_generator.dart';
import '../../questions/presentation/question_providers.dart';
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

// ==========================================
// KNOWLEDGE TAB
// ==========================================

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
            return _buildCard(context, ref, items[index]);
          },
        );
      },
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (err, stack) => Center(child: Text('Error: $err')),
    );
  }

  Widget _buildCard(BuildContext context, WidgetRef ref, KnowledgeItem item) {
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
                  labelStyle: const TextStyle(color: Colors.teal, fontSize: 12),
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
            Wrap(
              alignment: WrapAlignment.end,
              spacing: 8,
              runSpacing: 4,
              children: [
                OutlinedButton.icon(
                  onPressed: () => _generateMC(context, ref, item),
                  icon: const Icon(Icons.quiz, size: 16),
                  label: const Text('Pilihan Ganda'),
                  style: OutlinedButton.styleFrom(foregroundColor: Colors.teal),
                ),
                OutlinedButton.icon(
                  onPressed: () => _generateTF(context, ref, item),
                  icon: const Icon(Icons.rule, size: 16),
                  label: const Text('Benar/Salah'),
                  style: OutlinedButton.styleFrom(
                    foregroundColor: Colors.orange.shade800,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _generateMC(
    BuildContext context,
    WidgetRef ref,
    KnowledgeItem item,
  ) async {
    try {
      final others = await ref
          .read(knowledgeRepositoryProvider)
          .getOtherKnowledgeInTopic(topic.id, item.id);
      final generator = EnhancedQuestionGenerator();
      final result = generator.generateMultipleChoice(item, others);
      await ref
          .read(questionRepositoryProvider)
          .saveQuestion(
            topicId: topic.id,
            contentJson: result['content']!,
            answerJson: result['answer']!,
            generatorId: 'enhanced-mc-v1',
          );
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Soal Pilihan Ganda dibuat!')),
        );
      }
    } catch (e) {
      if (context.mounted) {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text('Gagal: $e')));
      }
    }
  }

  Future<void> _generateTF(
    BuildContext context,
    WidgetRef ref,
    KnowledgeItem item,
  ) async {
    try {
      final others = await ref
          .read(knowledgeRepositoryProvider)
          .getOtherKnowledgeInTopic(topic.id, item.id);
      final generator = EnhancedQuestionGenerator();
      final result = generator.generateTrueFalse(item, others);
      if (result == null) {
        if (context.mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text(
                'Butuh minimal 1 pengetahuan lain di topik ini untuk '
                'membuat soal Benar/Salah.',
              ),
            ),
          );
        }
        return;
      }
      await ref
          .read(questionRepositoryProvider)
          .saveQuestion(
            topicId: topic.id,
            contentJson: result['content']!,
            answerJson: result['answer']!,
            generatorId: 'enhanced-tf-v1',
          );
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Soal Benar/Salah dibuat!')),
        );
      }
    } catch (e) {
      if (context.mounted) {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text('Gagal: $e')));
      }
    }
  }
}

// ==========================================
// QUESTION BANK TAB
// ==========================================

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
                onPressed: () => _createAssessment(context, ref, questions),
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
                  return _buildQuestionCard(index, questions[index]);
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

  Widget _buildQuestionCard(int index, Question q) {
    final contentMap = jsonDecode(q.contentJson) as Map<String, dynamic>;
    final textBlock =
        (contentMap['blocks'] as List).first as Map<String, dynamic>;
    final options = (contentMap['options'] as List).cast<String>();
    final questionType =
        (contentMap['questionType'] as String?) ?? 'multipleChoice';
    final answerMap = jsonDecode(q.answerJson) as Map<String, dynamic>;
    final correctIndex = answerMap['correctIndex'] as int;

    final typeLabel = questionType == 'trueFalse' ? 'B/S' : 'PG';
    final typeColor = questionType == 'trueFalse'
        ? Colors.purple.shade50
        : Colors.blue.shade50;

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
                  label: Text(typeLabel),
                  backgroundColor: typeColor,
                  labelStyle: const TextStyle(fontSize: 10),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Text(
              textBlock['text'] as String,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 12),
            _buildOptionsList(options, correctIndex),
          ],
        ),
      ),
    );
  }

  Widget _buildOptionsList(List<String> options, int correctIndex) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: List.generate(options.length, (i) {
        final isCorrect = i == correctIndex;
        return Padding(
          padding: const EdgeInsets.only(bottom: 6),
          child: Text(
            '${isCorrect ? "✓" : "○"} ${options[i]}',
            style: TextStyle(
              color: isCorrect ? Colors.green : Colors.black87,
              fontWeight: isCorrect ? FontWeight.bold : FontWeight.normal,
            ),
          ),
        );
      }),
    );
  }

  Future<void> _createAssessment(
    BuildContext context,
    WidgetRef ref,
    List<Question> questions,
  ) async {
    final titleController = TextEditingController(text: 'Ujian ${topic.name}');
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('Buat Paket Ujian'),
        content: TextField(
          controller: titleController,
          decoration: const InputDecoration(labelText: 'Judul Ujian'),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx, false),
            child: const Text('Batal'),
          ),
          ElevatedButton(
            onPressed: () => Navigator.pop(ctx, true),
            child: const Text('Simpan'),
          ),
        ],
      ),
    );

    if (confirmed != true) return;

    try {
      await ref
          .read(assessmentRepositoryProvider)
          .createAssessmentFromQuestions(
            title: titleController.text.trim(),
            questions: questions,
          );
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Asesmen dibuat! Cek tab Asesmen.')),
        );
      }
    } catch (e) {
      if (context.mounted) {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text('Gagal: $e')));
      }
    }
  }
}
