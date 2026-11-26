import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../infrastructure/database/app_database.dart';
import 'journal_detail_screen.dart';
import 'journal_form_screen.dart';
import 'journal_providers.dart';

class JournalListTab extends ConsumerWidget {
  final Classroom classroom;
  const JournalListTab({super.key, required this.classroom});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final journalsAsync = ref.watch(journalEntryListProvider(classroom.id));

    return Scaffold(
      body: journalsAsync.when(
        data: (journals) {
          if (journals.isEmpty) {
            return _EmptyState(onCreate: () => _openForm(context));
          }
          return ListView.builder(
            padding: const EdgeInsets.all(12),
            itemCount: journals.length,
            itemBuilder: (context, index) {
              return _JournalCard(
                classroom: classroom,
                journal: journals[index],
              );
            },
          );
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (e, _) => Center(child: Text('Error: $e')),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => _openForm(context),
        backgroundColor: Colors.teal,
        icon: const Icon(Icons.add),
        label: const Text('Jurnal'),
      ),
    );
  }

  void _openForm(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => JournalFormScreen(classroom: classroom),
      ),
    );
  }
}

class _EmptyState extends StatelessWidget {
  final VoidCallback onCreate;
  const _EmptyState({required this.onCreate});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(32),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                color: Colors.teal.shade50,
                shape: BoxShape.circle,
              ),
              child: const Icon(Icons.book, size: 64, color: Colors.teal),
            ),
            const SizedBox(height: 24),
            const Text(
              'Belum Ada Jurnal Mengajar',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            const Text(
              'Catat kegiatan mengajar dan presensi siswa per pertemuan.',
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.grey, height: 1.5),
            ),
            const SizedBox(height: 24),
            ElevatedButton.icon(
              onPressed: onCreate,
              icon: const Icon(Icons.add),
              label: const Text('Tambah Jurnal Pertama'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.teal,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(
                  horizontal: 24,
                  vertical: 12,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _JournalCard extends ConsumerWidget {
  final Classroom classroom;
  final JournalEntry journal;
  const _JournalCard({required this.classroom, required this.journal});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final attendanceAsync = ref.watch(journalAttendancesProvider(journal.id));

    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => JournalDetailScreen(
                classroom: classroom,
                journalEntry: journal,
              ),
            ),
          );
        },
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  const Icon(
                    Icons.calendar_today,
                    size: 16,
                    color: Colors.teal,
                  ),
                  const SizedBox(width: 6),
                  Text(
                    _formatDate(journal.date),
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.teal,
                    ),
                  ),
                  const Spacer(),
                  if (journal.title != null && journal.title!.isNotEmpty)
                    Chip(
                      label: Text(journal.title!),
                      backgroundColor: Colors.teal.shade50,
                      labelStyle: const TextStyle(fontSize: 11),
                    ),
                ],
              ),
              const SizedBox(height: 8),
              Text(
                journal.activity,
                style: const TextStyle(fontSize: 14, height: 1.4),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(height: 8),
              attendanceAsync.when(
                data: (attendances) {
                  final hadir = attendances
                      .where((a) => a.status == 'hadir')
                      .length;
                  final izinSakit = attendances
                      .where((a) => a.status == 'izin' || a.status == 'sakit')
                      .length;
                  final alpha = attendances
                      .where((a) => a.status == 'alpha')
                      .length;

                  return Wrap(
                    spacing: 6,
                    children: [
                      _MiniBadge(label: 'Hadir $hadir', color: Colors.green),
                      if (izinSakit > 0)
                        _MiniBadge(
                          label: 'Izin/Sakit $izinSakit',
                          color: Colors.orange,
                        ),
                      if (alpha > 0)
                        _MiniBadge(label: 'Alpha $alpha', color: Colors.red),
                    ],
                  );
                },
                loading: () => const SizedBox.shrink(),
                error: (_, _) => const SizedBox.shrink(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  String _formatDate(DateTime date) {
    const months = [
      'Jan',
      'Feb',
      'Mar',
      'Apr',
      'Mei',
      'Jun',
      'Jul',
      'Agu',
      'Sep',
      'Okt',
      'Nov',
      'Des',
    ];
    return '${date.day} ${months[date.month - 1]} ${date.year}';
  }
}

class _MiniBadge extends StatelessWidget {
  final String label;
  final MaterialColor color;
  const _MiniBadge({required this.label, required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Text(
        label,
        style: TextStyle(
          fontSize: 11,
          color: color.shade700,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
