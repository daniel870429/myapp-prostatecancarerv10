// lib/core/navigation/app_router.dart

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../presentation/features/education/pages/education_page.dart';
import '../../presentation/features/home/pages/home_page.dart';
import '../../presentation/features/profile/pages/profile_page.dart';
import '../../presentation/features/auth/notifiers/auth_notifier.dart';
import '../../presentation/features/auth/pages/login_page.dart';
import '../../presentation/features/symptom_tracker/pages/symptom_tracker_page.dart';
import '../../presentation/global_widgets/scaffold_with_nested_navigation.dart';

part 'app_router.g.dart';

// This enum will be used to define the paths for the routes
enum AppRoute {
  login,
  home,
  symptoms,
  education,
  profile,
}

@Riverpod(keepAlive: true)
GoRouter goRouter(Ref ref) {
  final authState = ref.watch(authNotifierProvider);

  return GoRouter(
    initialLocation: '/symptoms',
    debugLogDiagnostics: true,
    redirect: (context, state) {
      final isLoggedIn = authState.hasValue && authState.value != null;
      final isLoggingIn = state.matchedLocation == '/login';

      if (!isLoggedIn) {
        return isLoggingIn ? null : '/login';
      }

      if (isLoggingIn) {
        return '/home';
      }

      return null;
    },
    routes: [
      GoRoute(
        path: '/login',
        name: AppRoute.login.name,
        builder: (context, state) => const LoginPage(),
      ),
      StatefulShellRoute.indexedStack(
        builder: (context, state, navigationShell) {
          return ScaffoldWithNestedNavigation(navigationShell: navigationShell);
        },
        branches: [
          // Home Branch
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/home',
                name: AppRoute.home.name,
                builder: (context, state) => const HomePage(),
              ),
            ],
          ),
          // Symptoms Branch
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/symptoms',
                name: AppRoute.symptoms.name,
                builder: (context, state) => const SymptomTrackerPage(),
              ),
            ],
          ),
          // Education Branch
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/education',
                name: AppRoute.education.name,
                builder: (context, state) => const EducationPage(),
              ),
            ],
          ),
          // Profile Branch
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/profile',
                name: AppRoute.profile.name,
                builder: (context, state) => const ProfilePage(),
              ),
            ],
          ),
        ],
      ),
    ],
  );
}
