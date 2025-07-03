import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/theme/app_spacing.dart';
import '../notifiers/auth_notifier.dart';
import '../../../global_widgets/buttons/primary_action_button.dart';

class LoginPage extends ConsumerWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authState = ref.watch(authNotifierProvider);
    final authNotifier = ref.read(authNotifierProvider.notifier);

    return Scaffold(
      appBar: AppBar(title: const Text('Login')),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(AppSpacing.medium),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (authState.isLoading)
                const CircularProgressIndicator()
              else
                PrimaryActionButton(
                  onPressed: authNotifier.signInWithGoogle,
                  label: 'Sign in with Google',
                ),
              if (authState.hasError)
                Padding(
                  padding: const EdgeInsets.only(top: AppSpacing.medium),
                  child: Text(
                    'Error: ${authState.error}',
                    style: const TextStyle(color: Colors.red),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
