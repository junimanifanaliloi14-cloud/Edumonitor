import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../infrastructure/database/app_database.dart';
import 'question_providers.dart';

class QuestionEditScreen extends ConsumerStatefulWidget {
  final Question question;
  const QuestionEditScreen({super.key, required this.question});

  @override
  ConsumerState<QuestionEditScreen> createState() => _QuestionEditScreenState();
}

class _QuestionEditScreenState extends ConsumerState<QuestionEditScreen> {
  late final TextEditingController _stemController;
  late final List<TextEditingController> _optionControllers;
  late int _correctIndex;
  late String _questionType;

  @override
  void initState() {
    super.initState();
    final contentMap =
        jsonDecode(widget.question.contentJson) as Map<String, dynamic>;
    final textBlock =
        (contentMap['blocks'] as List).first as Map<String, dynamic>;
    final options = (contentMap['options'] as List).cast<String>();
    final answerMap =
        jsonDecode(widget.question.answerJson) as Map<String, dynamic>;

    _questionType = (contentMap['questionType'] as String?) ?? 'multipleChoice';
    _stemController = TextEditingController(text: textBlock['text'] as String);
    _correctIndex = answerMap['correctIndex'] as int;

    if (_questionType == 'multipleChoice') {
      _optionControllers = options
          .map((o) => TextEditingController(text: o))
          .toList();
    } else {
      _optionControllers = [
        TextEditingController(text: 'Benar'),
        TextEditingController(text: 'Salah'),
      ];
    }
  }

  @override
  void dispose() {
    _stemController.dispose();
    for (final c in _optionControllers) {
      c.dispose();
    }
    super.dispose();
  }

  Future<void> _save() async {
    if (_stemController.text.trim().isEmpty) {
      _showError('Pertanyaan tidak boleh kosong');
      return;
    }
    for (final c in _optionControllers) {
      if (c.text.trim().isEmpty) {
        _showError('Semua opsi harus diisi');
        return;
      }
    }

    final content = {
      'blocks': [
        {'type': 'text', 'text': _stemController.text.trim()},
      ],
      'options': _optionControllers.map((c) => c.text.trim()).toList(),
      'questionType': _questionType,
    };
    final answer = {'correctIndex': _correctIndex};

    await ref
        .read(questionRepositoryProvider)
        .updateQuestion(
          id: widget.question.id,
          contentJson: jsonEncode(content),
          answerJson: jsonEncode(answer),
        );

    if (mounted) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('Soal berhasil diperbarui')));
      Navigator.pop(context);
    }
  }

  void _showError(String msg) {
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text(msg), backgroundColor: Colors.red));
  }

  @override
  Widget build(BuildContext context) {
    final isTrueFalse = _questionType == 'trueFalse';

    return Scaffold(
      appBar: AppBar(
        title: Text(
          isTrueFalse ? 'Edit Soal Benar/Salah' : 'Edit Soal Pilihan Ganda',
        ),
        backgroundColor: Colors.teal,
        foregroundColor: Colors.white,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          const Text(
            'Pertanyaan:',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          TextField(
            controller: _stemController,
            maxLines: 4,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              hintText: 'Tulis pertanyaan...',
            ),
          ),
          const SizedBox(height: 24),
          const Text(
            'Opsi Jawaban:',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 4),
          const Text(
            'Pilih radio di kiri untuk jawaban benar',
            style: TextStyle(fontSize: 12, color: Colors.grey),
          ),
          const SizedBox(height: 8),
          // PERBAIKAN: RadioGroup menggantikan groupValue/onChanged di Radio
          RadioGroup<int>(
            groupValue: _correctIndex,
            onChanged: (v) {
              if (v != null) setState(() => _correctIndex = v);
            },
            child: Column(
              children: List.generate(_optionControllers.length, (i) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 12),
                  child: Row(
                    children: [
                      Radio<int>(value: i),
                      Expanded(
                        child: TextField(
                          controller: _optionControllers[i],
                          enabled: !isTrueFalse,
                          decoration: InputDecoration(
                            border: const OutlineInputBorder(),
                            labelText: String.fromCharCode(65 + i),
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              }),
            ),
          ),
          const SizedBox(height: 24),
          ElevatedButton.icon(
            onPressed: _save,
            icon: const Icon(Icons.save),
            label: const Text('Simpan Perubahan'),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.teal,
              foregroundColor: Colors.white,
              minimumSize: const Size(double.infinity, 48),
            ),
          ),
        ],
      ),
    );
  }
}
