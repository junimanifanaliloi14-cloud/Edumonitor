import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/widgets/empty_state.dart';
import '../../progress/presentation/record_result_screen.dart';
import 'assessment_providers.dart';

class AssessmentListScreen extends ConsumerWidget {
  const AssessmentListScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final assessmentsAsync = ref.watch(assessmentListProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Daftar Asesmen'),
        backgroundColor: Colors.teal,
        foregroundColor: Colors.white,
      ),
      body: assessmentsAsync.when(
        data: (assessments) {
          if (assessments.isEmpty) {
            return const EmptyState(
              icon: Icons.assignment_outlined,
              title: 'Belum Ada Asesmen',
              description: 'Buat asesmen dari menu Bank Soal: masuk ke Kurikulum > Topik > Bank Soal, lalu klik "Jadikan Paket Ujian".',
            );
          }
          return ListView.builder(
            itemCount: assessments.length,
            itemBuilder: (context, index) {
              final a = assessments[index];
              return ListTile(
                leading: const Icon(
                  Icons.assignment,
                  color: Colors.teal,
                  size: 32,
                ),
                title: Text(
                  a.title,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                subtitle: Text('Status: ${a.status}'),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => RecordResultScreen(assessment: a),
                    ),
                  );
                },
                trailing: IconButton(
                  icon: const Icon(Icons.delete, color: Colors.red),
                  onPressed: () async {
                    await ref
                        .read(assessmentRepositoryProvider)
                        .deleteAssessment(a.id);
                  },
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
