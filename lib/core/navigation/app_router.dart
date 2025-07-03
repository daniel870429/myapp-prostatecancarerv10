import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../data/repositories/auth_repository_impl.dart';
import '../../presentation/features/auth/pages/login_page.dart';
import '../../presentation/features/home/pages/home_page.dart';
import '../../presentation/features/symptom_tracker/pages/symptom_tracker_page.dart';
import '../../presentation/features/education/pages/education_page.dart';
import '../../presentation/features/profile/pages/profile_page.dart';
import '../../presentation/global_widgets/scaffold_with_nested_navigation.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>();

final goRouterProvider = Provider<GoRouter>((ref) {
  final authState = ref.watch(authStateChangesProvider);

  return GoRouter(
    navigatorKey: _rootNavigatorKey,
    initialLocation: '/login',
    redirect: (BuildContext context, GoRouterState state) {
      final bool loggedIn = authState.asData?.value != null;
      final bool loggingIn = state.matchedLocation == '/login';

      if (!loggedIn) {
        return loggingIn ? null : '/login';
      }

      if (loggingIn) {
        return '/home';
      }

      return null;
    },
    routes: [
      GoRoute(
        path: '/login',
        builder: (context, state) => const LoginPage(),
      ),
      ShellRoute(
        builder: (context, state, child) {
          return ScaffoldWithNestedNavigation(child: child);
        },
        routes: [
          GoRoute(
            path: '/home',
            builder: (context, state) => const HomePage(),
          ),
          GoRoute(
            path: '/symptom-tracker',
            builder: (context, state) => const SymptomTrackerPage(),
          ),
          GoRoute(
            path: '/education',
            builder: (context, state) => const EducationPage(),
          ),
          GoRoute(
            path: '/profile',
            builder: (context, state) => const ProfilePage(),
          ),
        ],
      ),
    ],
  );
});
