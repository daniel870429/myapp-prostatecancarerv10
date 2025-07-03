import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ScaffoldWithNestedNavigation extends StatelessWidget {
  const ScaffoldWithNestedNavigation({
    required this.child,
    super.key,
  });

  final Widget child;

  void _goBranch(int index, BuildContext context) {
    switch (index) {
      case 0:
        GoRouter.of(context).go('/home');
        break;
      case 1:
        GoRouter.of(context).go('/symptom-tracker');
        break;
      case 2:
        GoRouter.of(context).go('/education');
        break;
      case 3:
        GoRouter.of(context).go('/profile');
        break;
    }
  }

  int _calculateSelectedIndex(BuildContext context) {
    final String location = GoRouterState.of(context).uri.toString();
    if (location.startsWith('/home')) {
      return 0;
    }
    if (location.startsWith('/symptom-tracker')) {
      return 1;
    }
    if (location.startsWith('/education')) {
      return 2;
    }
    if (location.startsWith('/profile')) {
      return 3;
    }
    return 0;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: child,
      bottomNavigationBar: NavigationBar(
        selectedIndex: _calculateSelectedIndex(context),
        destinations: [
          NavigationDestination(
            label: 'Home',
            icon: const Icon(Icons.home_outlined),
            selectedIcon:
                Icon(Icons.home, color: Theme.of(context).primaryColor),
          ),
          NavigationDestination(
            label: 'Symptoms',
            icon: const Icon(Icons.track_changes_outlined),
            selectedIcon: Icon(Icons.track_changes,
                color: Theme.of(context).primaryColor),
          ),
          NavigationDestination(
            label: 'Learn',
            icon: const Icon(Icons.school_outlined),
            selectedIcon:
                Icon(Icons.school, color: Theme.of(context).primaryColor),
          ),
          NavigationDestination(
            label: 'Profile',
            icon: const Icon(Icons.person_outline),
            selectedIcon:
                Icon(Icons.person, color: Theme.of(context).primaryColor),
          ),
        ],
        onDestinationSelected: (index) => _goBranch(index, context),
      ),
    );
  }
}
