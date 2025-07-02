import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:myapp/presentation/features/auth/notifiers/auth_notifier.dart';

class ProfilePage extends ConsumerWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authState = ref.watch(authNotifierProvider);
    final user = authState.value;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (user != null) ...[
              Text('Logged in as: ${user.email}'),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  ref.read(authNotifierProvider.notifier).signOut();
                },
                child: const Text('Sign Out'),
              ),
            ] else ...[
              const Text('Not logged in.'),
            ],
          ],
        ),
      ),
    );
  }
}
