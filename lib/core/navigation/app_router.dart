import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../presentation/features/auth/notifiers/auth_notifier.dart';
import '../../presentation/features/auth/pages/login_page.dart';
import '../../presentation/features/education/pages/education_page.dart';
import '../../presentation/features/home/pages/home_page.dart';
import '../../presentation/features/profile/pages/profile_page.dart';
import '../../presentation/features/symptom_tracker/pages/symptom_tracker_page.dart';
import '../../presentation/global_widgets/scaffold_with_nested_navigation.dart';

// Private navigators for each branch
final _rootNavigatorKey = GlobalKey<NavigatorState>();
final _shellNavigatorAKey = GlobalKey<NavigatorState>(debugLabel: 'shellA');
final _shellNavigatorBKey = GlobalKey<NavigatorState>(debugLabel: 'shellB');
final _shellNavigatorCKey = GlobalKey<NavigatorState>(debugLabel: 'shellC');
final _shellNavigatorDKey = GlobalKey<NavigatorState>(debugLabel: 'shellD');

/// This notifier is meant to implement the `refreshListenable` of GoRouter.
/// It listens to the auth state and notifies the router to re-evaluate its redirects.
class RouterRefreshNotifier extends ChangeNotifier {
  final Ref _ref;
  RouterRefreshNotifier(this._ref) {
    _ref.listen<AsyncValue<User?>>(authNotifierProvider, (_, __) {
      notifyListeners();
    });
  }
}

final routerRefreshNotifierProvider = Provider(RouterRefreshNotifier.new);

final goRouterProvider = Provider<GoRouter>((ref) {
  final refreshNotifier = ref.watch(routerRefreshNotifierProvider);

  return GoRouter(
    initialLocation: '/login', // Start at the login page
    navigatorKey: _rootNavigatorKey,
    debugLogDiagnostics: true,
    refreshListenable: refreshNotifier,
    routes: [
      GoRoute(path: '/login', builder: (context, state) => const LoginPage()),
      StatefulShellRoute.indexedStack(
        builder: (context, state, navigationShell) {
          return ScaffoldWithNestedNavigation(navigationShell: navigationShell);
        },
        branches: [
          // Branch A: Home
          StatefulShellBranch(
            navigatorKey: _shellNavigatorAKey,
            routes: [
              GoRoute(
                path: '/home',
                pageBuilder:
                    (context, state) =>
                        const NoTransitionPage(child: HomePage()),
              ),
            ],
          ),
          // Branch B: Symptom Tracker
          StatefulShellBranch(
            navigatorKey: _shellNavigatorBKey,
            routes: [
              GoRoute(
                path: '/symptoms',
                pageBuilder:
                    (context, state) =>
                        const NoTransitionPage(child: SymptomTrackerPage()),
              ),
            ],
          ),
          // Branch C: Education
          StatefulShellBranch(
            navigatorKey: _shellNavigatorCKey,
            routes: [
              GoRoute(
                path: '/education',
                pageBuilder:
                    (context, state) =>
                        const NoTransitionPage(child: EducationPage()),
              ),
            ],
          ),
          // Branch D: Profile
          StatefulShellBranch(
            navigatorKey: _shellNavigatorDKey,
            routes: [
              GoRoute(
                path: '/profile',
                pageBuilder:
                    (context, state) =>
                        const NoTransitionPage(child: ProfilePage()),
              ),
            ],
          ),
        ],
      ),
    ],
    redirect: (context, state) {
      final authState = ref.read(authNotifierProvider);
      final isLoggedIn = authState.maybeWhen(
        data: (user) => user != null,
        orElse: () => false,
      );

      final isLoggingIn = state.matchedLocation == '/login';

      if (!isLoggedIn) {
        return isLoggingIn ? null : '/login';
      }

      if (isLoggingIn && isLoggedIn) {
        return '/home';
      }

      return null;
    },
  );
});
