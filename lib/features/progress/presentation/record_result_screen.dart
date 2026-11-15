import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../infrastructure/database/app_database.dart';
import '../../students/presentation/student_providers.dart';
import 'progress_providers.dart';

class RecordResultScreen extends ConsumerStatefulWidget {
  final Assessment assessment;
  const RecordResultScreen({super.key, required this.assessment});

  @override
  ConsumerState<RecordResultScreen> createState() => _RecordResultScreenState();
}

class _RecordResultScreenState extends ConsumerState<RecordResultScreen> {
  String? _selectedStudentId;
  final _scoreController = TextEditingController(text: '85');

  @override
  Widget build(BuildContext context) {
    final studentsAsync = ref.watch(studentListProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text('Catat Nilai: ${widget.assessment.title}'),
        backgroundColor: Colors.teal,
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              'Pilih Siswa:',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            studentsAsync.when(
              data: (students) {
                if (students.isEmpty) return const Text('Belum ada siswa.');
                return DropdownButtonFormField<String>(
                  initialValue: _selectedStudentId,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                  ),
                  items: students.map((s) {
                    return DropdownMenuItem(
                      value: s.id,
                      child: Text(s.displayName),
                    );
                  }).toList(),
                  onChanged: (val) => setState(() => _selectedStudentId = val),
                );
              },
              loading: () => const CircularProgressIndicator(),
              error: (err, _) => Text('Error: $err'),
            ),
            const SizedBox(height: 24),
            const Text(
              'Nilai (0-100):',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            TextField(
              controller: _scoreController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(border: OutlineInputBorder()),
            ),
            const SizedBox(height: 32),
            ElevatedButton.icon(
              onPressed: _selectedStudentId == null
                  ? null
                  : () async {
                      final score =
                          double.tryParse(_scoreController.text) ?? 0.0;
                      if (score < 0 || score > 100) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Nilai harus antara 0-100'),
                          ),
                        );
                        return;
                      }

                      await ref
                          .read(progressRepositoryProvider)
                          .recordAttempt(
                            studentId: _selectedStudentId!,
                            assessmentId: widget.assessment.id,
                            score: score,
                          );

                      if (context.mounted) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Nilai berhasil dicatat!'),
                          ),
                        );
                        Navigator.pop(context);
                      }
                    },
              icon: const Icon(Icons.save),
              label: const Text('Simpan Nilai'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.teal,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(vertical: 16),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
