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
    DashboardScreen(),
    StudentListScreen(),
    SubjectListScreen(),
    DocumentListScreen(),
    AssessmentListScreen(),
  ];

  static const List<NavigationDestination> _destinations = [
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
  ];

  @override
  Widget build(BuildContext context) {
    // LayoutBuilder mendeteksi lebar layar
    return LayoutBuilder(
      builder: (context, constraints) {
        // Jika lebar > 800 (PC/Desktop), gunakan NavigationRail (menu samping)
        final isDesktop = constraints.maxWidth >= 800;

        if (isDesktop) {
          return Scaffold(
            body: Row(
              children: [
                NavigationRail(
                  selectedIndex: _selectedIndex,
                  onDestinationSelected: (int index) {
                    setState(() {
                      _selectedIndex = index;
                    });
                  },
                  labelType: NavigationRailLabelType.all,
                  backgroundColor: Colors.grey.shade100,
                  destinations: _destinations.map((dest) {
                    return NavigationRailDestination(
                      icon: dest.icon,
                      selectedIcon: dest.selectedIcon,
                      label: Text(dest.label),
                    );
                  }).toList(),
                ),
                const VerticalDivider(thickness: 1, width: 1),
                // Konten utama
                Expanded(child: _screens[_selectedIndex]),
              ],
            ),
          );
        }

        // Jika layar kecil (Tablet/HP), gunakan Bottom Navigation Bar
        return Scaffold(
          body: _screens[_selectedIndex],
          bottomNavigationBar: NavigationBar(
            selectedIndex: _selectedIndex,
            onDestinationSelected: (int index) {
              setState(() {
                _selectedIndex = index;
              });
            },
            destinations: _destinations,
          ),
        );
      },
    );
  }
}
