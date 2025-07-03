import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ScaffoldWithNestedNavigation extends StatelessWidget {
  const ScaffoldWithNestedNavigation({
    required this.navigationShell,
    super.key,
  });

  final StatefulNavigationShell navigationShell;

  void _goBranch(int index) {
    navigationShell.goBranch(
      index,
      initialLocation: index == navigationShell.currentIndex,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: navigationShell,
      bottomNavigationBar: NavigationBar(
        selectedIndex: navigationShell.currentIndex,
        destinations: const [
          NavigationDestination(
            label: 'Home',
            icon: Icon(Icons.home_outlined),
            selectedIcon: Icon(Icons.home),
          ),
          NavigationDestination(
            label: 'Symptoms',
            icon: Icon(Icons.track_changes_outlined),
            selectedIcon: Icon(Icons.track_changes),
          ),
          NavigationDestination(
            label: 'Learn',
            icon: Icon(Icons.school_outlined),
            selectedIcon: Icon(Icons.school),
          ),
          NavigationDestination(
            label: 'Profile',
            icon: Icon(Icons.person_outline),
            selectedIcon: Icon(Icons.person),
          ),
        ],
        onDestinationSelected: _goBranch,
      ),
    );
  }
}
