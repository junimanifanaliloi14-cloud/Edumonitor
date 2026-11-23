import 'package:flutter/material.dart';

import '../../assessments/presentation/assessment_list_screen.dart';
import '../../classrooms/presentation/classroom_list_screen.dart';
import '../../curriculum/presentation/subject_list_screen.dart';
import '../../dashboard/presentation/dashboard_screen.dart';
import '../../documents/presentation/document_list_screen.dart';
import '../../students/presentation/student_list_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  void _navigateToTab(int index) {
    if (index < 0 || index > 5) return;
    setState(() => _selectedIndex = index);
  }

  List<Widget> _buildScreens() {
    return [
      DashboardScreen(onNavigateToTab: _navigateToTab),
      const ClassroomListScreen(),
      const StudentListScreen(),
      const SubjectListScreen(),
      const DocumentListScreen(),
      const AssessmentListScreen(),
    ];
  }

  static const List<NavigationDestination> _destinations = [
    NavigationDestination(
      icon: Icon(Icons.dashboard_outlined),
      selectedIcon: Icon(Icons.dashboard),
      label: 'Beranda',
    ),
    NavigationDestination(
      icon: Icon(Icons.groups_outlined),
      selectedIcon: Icon(Icons.groups),
      label: 'Kelas',
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
    return LayoutBuilder(
      builder: (context, constraints) {
        final isLandscape = constraints.maxWidth > constraints.maxHeight;
        final isWide = constraints.maxWidth >= 900;
        final useRail = isLandscape && isWide;

        final screens = _buildScreens();

        if (useRail) {
          return Scaffold(
            body: Row(
              children: [
                NavigationRail(
                  selectedIndex: _selectedIndex,
                  onDestinationSelected: _navigateToTab,
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
                Expanded(child: screens[_selectedIndex]),
              ],
            ),
          );
        }

        return Scaffold(
          body: screens[_selectedIndex],
          bottomNavigationBar: NavigationBar(
            selectedIndex: _selectedIndex,
            onDestinationSelected: _navigateToTab,
            destinations: _destinations,
          ),
        );
      },
    );
  }
}
