import 'package:flutter/material.dart';

void main() {
  runApp(const EduMonitorApp());
}

class EduMonitorApp extends StatelessWidget {
  const EduMonitorApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'EduMonitor',
      theme: ThemeData(useMaterial3: true, colorSchemeSeed: Colors.teal),
      home: const Scaffold(
        body: Center(
          child: Text(
            'EduMonitor\nPhase 1A — Foundation',
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
