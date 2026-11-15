import 'package:flutter/material.dart';

import '../../dashboard/presentation/dashboard_screen.dart';
import '../../students/presentation/student_list_screen.dart';
import '../../curriculum/presentation/subject_list_screen.dart';
import '../../documents/presentation/document_list_screen.dart';
import '../../assessments/presentation/assessment_list_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  static const List<Widget> _screens = [
    DashboardScreen(), // Tab 1: Dashboard (Baru)
    StudentListScreen(), // Tab 2
    SubjectListScreen(), // Tab 3
    DocumentListScreen(), // Tab 4
    AssessmentListScreen(), // Tab 5
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_selectedIndex],
      bottomNavigationBar: NavigationBar(
        selectedIndex: _selectedIndex,
        onDestinationSelected: (int index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.dashboard_outlined),
            selectedIcon: Icon(Icons.dashboard),
            label: 'Beranda',
          ),
          NavigationDestination(
            icon: Icon(Icons.people_outline),
            selectedIcon: Icon(Icons.people),
            label: 'Siswa',
          ),
          NavigationDestination(
            icon: Icon(Icons.menu_book_outlined),
            selectedIcon: Icon(Icons.menu_book),
            label: 'Kurikulum',
          ),
          NavigationDestination(
            icon: Icon(Icons.folder_copy_outlined),
            selectedIcon: Icon(Icons.folder_copy),
            label: 'Materi',
          ),
          NavigationDestination(
            icon: Icon(Icons.assignment_outlined),
            selectedIcon: Icon(Icons.assignment),
            label: 'Asesmen',
          ),
        ],
      ),
    );
  }
}
