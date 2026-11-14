import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'features/home/presentation/home_screen.dart';
import 'features/students/presentation/student_providers.dart';
import 'infrastructure/database/app_database.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final dbExecutor = await openAppDatabase();
  final appDatabase = AppDatabase(dbExecutor);

  runApp(
    ProviderScope(
      overrides: [databaseProvider.overrideWithValue(appDatabase)],
      child: const EduMonitorApp(),
    ),
  );
}

class EduMonitorApp extends StatelessWidget {
  const EduMonitorApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'EduMonitor',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(useMaterial3: true, colorSchemeSeed: Colors.teal),
      home: const HomeScreen(),
    );
  }
}
