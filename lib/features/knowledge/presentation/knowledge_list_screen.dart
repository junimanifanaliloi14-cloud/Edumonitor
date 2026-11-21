import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../infrastructure/database/app_database.dart';
import '../../assessments/presentation/assessment_providers.dart';
import '../../questions/presentation/question_edit_screen.dart';
import '../../questions/presentation/question_generator.dart';
import '../../questions/presentation/question_providers.dart';
import 'knowledge_providers.dart';

const _typeLabels = <String, String>{
  'concept': 'Konsep',
  'fact': 'Fakta',
  'relation': 'Hubungan',
  'sequence': 'Urutan',
  'passage': 'Bacaan',
};

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
    final filter = ref.watch(knowledgeFilterProvider);

    return knowledgeAsync.when(
      data: (allItems) {
        if (allItems.isEmpty) {
          return const Center(child: Text('Belum ada pengetahuan.'));
        }

        final items = allItems.where((item) {
          return switch (filter) {
            KnowledgeFilter.all => true,
            KnowledgeFilter.draft =>
              item.status == 'draft' || item.status == 'extracted',
            KnowledgeFilter.verified => item.status == 'verified',
          };
        }).toList();

        return Column(
          children: [
            _buildFilterBar(ref, filter, allItems),
            if (items.isEmpty)
              Expanded(
                child: Center(
                  child: Text(
                    filter == KnowledgeFilter.verified
                        ? 'Belum ada pengetahuan terverifikasi.'
                        : 'Belum ada pengetahuan di filter ini.',
                    style: const TextStyle(color: Colors.grey),
                  ),
                ),
              )
            else
              Expanded(
                child: ListView.builder(
                  padding: const EdgeInsets.fromLTRB(12, 0, 12, 12),
                  itemCount: items.length,
                  itemBuilder: (context, index) {
                    return _KnowledgeCard(topic: topic, item: items[index]);
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

  Widget _buildFilterBar(
    WidgetRef ref,
    KnowledgeFilter current,
    List<KnowledgeItem> allItems,
  ) {
    final draftCount = allItems
        .where((i) => i.status == 'draft' || i.status == 'extracted')
        .length;
    final verifiedCount = allItems.where((i) => i.status == 'verified').length;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            _FilterChip(
              label: 'Semua (${allItems.length})',
              selected: current == KnowledgeFilter.all,
              onTap: () => ref
                  .read(knowledgeFilterProvider.notifier)
                  .setFilter(KnowledgeFilter.all),
            ),
            const SizedBox(width: 8),
            _FilterChip(
              label: 'Draft ($draftCount)',
              selected: current == KnowledgeFilter.draft,
              onTap: () => ref
                  .read(knowledgeFilterProvider.notifier)
                  .setFilter(KnowledgeFilter.draft),
            ),
            const SizedBox(width: 8),
            _FilterChip(
              label: 'Terverifikasi ($verifiedCount)',
              selected: current == KnowledgeFilter.verified,
              onTap: () => ref
                  .read(knowledgeFilterProvider.notifier)
                  .setFilter(KnowledgeFilter.verified),
            ),
          ],
        ),
      ),
    );
  }
}

// ==========================================
// REUSABLE FILTER CHIP
// ==========================================

class _FilterChip extends StatelessWidget {
  final String label;
  final bool selected;
  final VoidCallback onTap;
  const _FilterChip({
    required this.label,
    required this.selected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return FilterChip(
      label: Text(label),
      selected: selected,
      onSelected: (_) => onTap(),
      selectedColor: Colors.teal.shade100,
      checkmarkColor: Colors.teal,
    );
  }
}

// ==========================================
// KNOWLEDGE CARD
// ==========================================

class _KnowledgeCard extends ConsumerWidget {
  final Topic topic;
  final KnowledgeItem item;
  const _KnowledgeCard({required this.topic, required this.item});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isVerified = item.status == 'verified';
    final isRejected = item.status == 'rejected';

    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Chip(
                  label: Text(_typeLabels[item.type] ?? item.type),
                  backgroundColor: Colors.teal.shade50,
                  labelStyle: const TextStyle(color: Colors.teal, fontSize: 12),
                ),
                const SizedBox(width: 6),
                _StatusBadge(status: item.status),
                const Spacer(),
                IconButton(
                  icon: const Icon(Icons.edit, size: 20, color: Colors.blue),
                  tooltip: 'Edit',
                  onPressed: () => _showEditDialog(context, ref),
                ),
                IconButton(
                  icon: const Icon(Icons.delete, size: 20, color: Colors.red),
                  tooltip: 'Hapus',
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
            if (!isVerified)
              Align(
                alignment: Alignment.centerLeft,
                child: OutlinedButton.icon(
                  onPressed: () => ref
                      .read(knowledgeRepositoryProvider)
                      .updateKnowledge(id: item.id, status: 'verified'),
                  icon: const Icon(Icons.check_circle, size: 18),
                  label: const Text('Verifikasi'),
                  style: OutlinedButton.styleFrom(
                    foregroundColor: Colors.green,
                  ),
                ),
              ),
            if (isVerified)
              Align(
                alignment: Alignment.centerLeft,
                child: OutlinedButton.icon(
                  onPressed: () => ref
                      .read(knowledgeRepositoryProvider)
                      .updateKnowledge(id: item.id, status: 'draft'),
                  icon: const Icon(Icons.undo, size: 18),
                  label: const Text('Batalkan Verifikasi'),
                  style: OutlinedButton.styleFrom(
                    foregroundColor: Colors.orange,
                  ),
                ),
              ),
            if (!isVerified && !isRejected) const SizedBox(height: 4),
            const Divider(),
            Wrap(
              alignment: WrapAlignment.end,
              spacing: 8,
              runSpacing: 4,
              children: [
                OutlinedButton.icon(
                  onPressed: () => _generateMC(context, ref),
                  icon: const Icon(Icons.quiz, size: 16),
                  label: const Text('Pilihan Ganda'),
                  style: OutlinedButton.styleFrom(foregroundColor: Colors.teal),
                ),
                OutlinedButton.icon(
                  onPressed: () => _generateTF(context, ref),
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

  Future<bool> _confirmDraftGeneration(BuildContext context) async {
    if (item.status == 'verified') return true;

    final confirmed = await showDialog<bool>(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('Pengetahuan Belum Diverifikasi'),
        content: Text(
          'Pengetahuan ini berstatus "${item.status}".\n\n'
          'Blueprint merekomendasikan hanya memakai pengetahuan yang sudah '
          'diverifikasi untuk generator soal. Anda bisa verifikasi dulu untuk '
          'kualitas soal yang lebih baik, atau tetap lanjutkan dengan draft.',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx, false),
            child: const Text('Verifikasi Dulu'),
          ),
          TextButton(
            onPressed: () => Navigator.pop(ctx, true),
            child: const Text('Lanjutkan dengan Draft'),
          ),
        ],
      ),
    );

    return confirmed == true;
  }

  Future<void> _showEditDialog(BuildContext context, WidgetRef ref) async {
    final contentController = TextEditingController(text: item.content);
    String selectedType = item.type;

    final result = await showDialog<Map<String, String>>(
      context: context,
      builder: (ctx) => StatefulBuilder(
        builder: (context, setState) => AlertDialog(
          title: const Text('Edit Pengetahuan'),
          content: SizedBox(
            width: 400,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                DropdownButtonFormField<String>(
                  initialValue: selectedType,
                  isExpanded: true,
                  decoration: const InputDecoration(
                    labelText: 'Tipe',
                    border: OutlineInputBorder(),
                  ),
                  items: _typeLabels.entries
                      .map(
                        (e) => DropdownMenuItem(
                          value: e.key,
                          child: Text(e.value),
                        ),
                      )
                      .toList(),
                  onChanged: (v) {
                    if (v != null) setState(() => selectedType = v);
                  },
                ),
                const SizedBox(height: 12),
                TextField(
                  controller: contentController,
                  maxLines: 5,
                  decoration: const InputDecoration(
                    labelText: 'Konten',
                    border: OutlineInputBorder(),
                  ),
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(ctx),
              child: const Text('Batal'),
            ),
            ElevatedButton(
              onPressed: () => Navigator.pop(ctx, {
                'type': selectedType,
                'content': contentController.text.trim(),
              }),
              child: const Text('Simpan'),
            ),
          ],
        ),
      ),
    );

    if (result == null) return;
    await ref
        .read(knowledgeRepositoryProvider)
        .updateKnowledge(
          id: item.id,
          type: result['type'],
          content: result['content'],
        );
  }

  Future<void> _generateMC(BuildContext context, WidgetRef ref) async {
    final proceed = await _confirmDraftGeneration(context);
    if (!proceed) return;

    try {
      final allOthers = await ref
          .read(knowledgeRepositoryProvider)
          .getOtherKnowledgeInTopic(topic.id, item.id);

      final verifiedOthers = allOthers
          .where((o) => o.status == 'verified')
          .toList();
      final distractors = verifiedOthers.length >= 3
          ? verifiedOthers
          : allOthers;

      final generator = EnhancedQuestionGenerator();
      final result = generator.generateMultipleChoice(item, distractors);
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

  Future<void> _generateTF(BuildContext context, WidgetRef ref) async {
    final proceed = await _confirmDraftGeneration(context);
    if (!proceed) return;

    try {
      final allOthers = await ref
          .read(knowledgeRepositoryProvider)
          .getOtherKnowledgeInTopic(topic.id, item.id);

      final verifiedOthers = allOthers
          .where((o) => o.status == 'verified')
          .toList();
      final distractors = verifiedOthers.isNotEmpty
          ? verifiedOthers
          : allOthers;

      if (distractors.isEmpty) {
        if (context.mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Butuh minimal 1 pengetahuan lain di topik ini.'),
            ),
          );
        }
        return;
      }

      final generator = EnhancedQuestionGenerator();
      final result = generator.generateTrueFalse(item, distractors);
      if (result == null) return;

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

class _StatusBadge extends StatelessWidget {
  final String status;
  const _StatusBadge({required this.status});

  @override
  Widget build(BuildContext context) {
    Color bg;
    Color fg;
    String label;

    switch (status) {
      case 'verified':
        bg = Colors.green.shade50;
        fg = Colors.green.shade800;
        label = 'Terverifikasi';
        break;
      case 'rejected':
        bg = Colors.red.shade50;
        fg = Colors.red.shade800;
        label = 'Ditolak';
        break;
      case 'draft':
      case 'extracted':
      default:
        bg = Colors.orange.shade50;
        fg = Colors.orange.shade800;
        label = 'Draft';
    }

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: bg,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Text(
        label,
        style: TextStyle(color: fg, fontSize: 11, fontWeight: FontWeight.bold),
      ),
    );
  }
}

// ==========================================
// QUESTION BANK TAB (Phase 17A — dengan filter + edit/delete)
// ==========================================

class _QuestionBankTab extends ConsumerWidget {
  final Topic topic;
  const _QuestionBankTab({required this.topic});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final questionsAsync = ref.watch(questionListProvider(topic.id));
    final filter = ref.watch(questionFilterProvider);

    return questionsAsync.when(
      data: (allQuestions) {
        if (allQuestions.isEmpty) {
          return const Center(
            child: Text('Belum ada soal. Generate dari tab Pengetahuan.'),
          );
        }

        final questions = allQuestions.where((q) {
          if (filter == QuestionFilter.all) return true;
          final m = jsonDecode(q.contentJson) as Map<String, dynamic>;
          final type = (m['questionType'] as String?) ?? 'multipleChoice';
          if (filter == QuestionFilter.multipleChoice) {
            return type == 'multipleChoice';
          }
          return type == 'trueFalse';
        }).toList();

        final pgCount = allQuestions.where((q) {
          final m = jsonDecode(q.contentJson) as Map<String, dynamic>;
          return ((m['questionType'] as String?) ?? 'multipleChoice') ==
              'multipleChoice';
        }).length;
        final tfCount = allQuestions.length - pgCount;

        return Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(12, 12, 12, 8),
              child: ElevatedButton.icon(
                onPressed: () => _createAssessment(context, ref, allQuestions),
                icon: const Icon(Icons.playlist_add_check),
                label: Text(
                  'Jadikan Paket Ujian (${allQuestions.length} Soal)',
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.orange,
                  foregroundColor: Colors.white,
                  minimumSize: const Size(double.infinity, 48),
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    _FilterChip(
                      label: 'Semua (${allQuestions.length})',
                      selected: filter == QuestionFilter.all,
                      onTap: () => ref
                          .read(questionFilterProvider.notifier)
                          .setFilter(QuestionFilter.all),
                    ),
                    const SizedBox(width: 8),
                    _FilterChip(
                      label: 'PG ($pgCount)',
                      selected: filter == QuestionFilter.multipleChoice,
                      onTap: () => ref
                          .read(questionFilterProvider.notifier)
                          .setFilter(QuestionFilter.multipleChoice),
                    ),
                    const SizedBox(width: 8),
                    _FilterChip(
                      label: 'B/S ($tfCount)',
                      selected: filter == QuestionFilter.trueFalse,
                      onTap: () => ref
                          .read(questionFilterProvider.notifier)
                          .setFilter(QuestionFilter.trueFalse),
                    ),
                  ],
                ),
              ),
            ),
            if (questions.isEmpty)
              const Expanded(
                child: Center(
                  child: Text(
                    'Tidak ada soal di filter ini.',
                    style: TextStyle(color: Colors.grey),
                  ),
                ),
              )
            else
              Expanded(
                child: ListView.builder(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  itemCount: questions.length,
                  itemBuilder: (context, index) {
                    return _QuestionCard(
                      index: index,
                      question: questions[index],
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

// ==========================================
// QUESTION CARD (dengan edit + delete)
// ==========================================

class _QuestionCard extends ConsumerWidget {
  final int index;
  final Question question;
  const _QuestionCard({required this.index, required this.question});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final contentMap = jsonDecode(question.contentJson) as Map<String, dynamic>;
    final textBlock =
        (contentMap['blocks'] as List).first as Map<String, dynamic>;
    final options = (contentMap['options'] as List).cast<String>();
    final questionType =
        (contentMap['questionType'] as String?) ?? 'multipleChoice';
    final answerMap = jsonDecode(question.answerJson) as Map<String, dynamic>;
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
              children: [
                Text(
                  'Soal #${index + 1}',
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.grey,
                  ),
                ),
                const SizedBox(width: 8),
                Chip(
                  label: Text(typeLabel),
                  backgroundColor: typeColor,
                  labelStyle: const TextStyle(fontSize: 10),
                ),
                const Spacer(),
                IconButton(
                  icon: const Icon(Icons.edit, size: 20, color: Colors.blue),
                  tooltip: 'Edit soal',
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => QuestionEditScreen(question: question),
                      ),
                    );
                  },
                ),
                IconButton(
                  icon: const Icon(Icons.delete, size: 20, color: Colors.red),
                  tooltip: 'Hapus soal',
                  onPressed: () => _confirmDelete(context, ref),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Text(
              textBlock['text'] as String,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 12),
            ...List.generate(options.length, (i) {
              final isCorrect = i == correctIndex;
              return Padding(
                padding: const EdgeInsets.only(bottom: 6),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Icon(
                      isCorrect
                          ? Icons.check_circle
                          : Icons.radio_button_unchecked,
                      color: isCorrect ? Colors.green : Colors.grey,
                      size: 20,
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Text(
                        options[i],
                        style: TextStyle(
                          color: isCorrect ? Colors.green : Colors.black87,
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
  }

  void _confirmDelete(BuildContext context, WidgetRef ref) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('Hapus Soal?'),
        content: const Text(
          'Soal ini akan dihapus dari bank soal. '
          'Data asesmen historis yang sudah memakai soal ini TIDAK terpengaruh '
          '(karena memakai snapshot immutable).',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx),
            child: const Text('Batal'),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
            onPressed: () async {
              await ref
                  .read(questionRepositoryProvider)
                  .deleteQuestion(question.id);
              if (ctx.mounted) Navigator.pop(ctx);
            },
            child: const Text('Hapus', style: TextStyle(color: Colors.white)),
          ),
        ],
      ),
    );
  }
}
