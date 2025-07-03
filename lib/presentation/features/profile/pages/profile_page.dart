import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/theme/app_spacing.dart';
import '../../../../data/data_providers.dart';
import '../../auth/notifiers/auth_notifier.dart';
import '../../../global_widgets/buttons/primary_action_button.dart';
import '../../../global_widgets/dialogs/confirmation_dialog.dart';
import '../../../global_widgets/lists/app_list_item.dart';

class ProfilePage extends ConsumerWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authState = ref.watch(authStateChangesProvider);
    final profile = authState.asData?.value;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () async {
              final confirmed = await showDialog<bool>(
                context: context,
                builder: (context) => ConfirmationDialog(
                  title: 'Log Out',
                  content: 'Are you sure you want to log out?',
                  onConfirm: () => Navigator.of(context).pop(true),
                ),
              );
              if (confirmed == true) {
                await ref.read(authNotifierProvider.notifier).signOut();
                // TODO: Navigate to login page
              }
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(AppSpacing.medium),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (profile != null)
                Center(
                  child: Column(
                    children: [
                      CircleAvatar(
                        radius: 50,
                        backgroundImage: profile.photoURL != null
                            ? NetworkImage(profile.photoURL!)
                            : null,
                        child: profile.photoURL == null
                            ? const Icon(Icons.person, size: 50)
                            : null,
                      ),
                      const SizedBox(height: AppSpacing.medium),
                      Text(
                        profile.displayName ?? 'N/A',
                        style: Theme.of(context).textTheme.headlineSmall,
                      ),
                      Text(
                        profile.email ?? 'N/A',
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                    ],
                  ),
                ),
              const SizedBox(height: AppSpacing.large),
              Text(
                'General Settings',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).primaryColor,
                ),
              ),
              const SizedBox(height: AppSpacing.medium),
              AppListItem(
                label: 'Notification Settings',
                leadingIcon: Icons.notifications,
                onTap: () {
                  // TODO: Navigate to notification settings page
                },
              ),
              AppListItem(
                label: 'Data & Privacy',
                leadingIcon: Icons.privacy_tip,
                onTap: () {
                  // TODO: Navigate to data & privacy page
                },
              ),
              const SizedBox(height: AppSpacing.large),
              Center(
                child: PrimaryActionButton(
                  onPressed: () async {
                    final confirmed = await showDialog<bool>(
                      context: context,
                      builder: (context) => ConfirmationDialog(
                        title: 'Delete Account',
                        content:
                            'Are you sure you want to delete your account? This action cannot be undone.',
                        onConfirm: () => Navigator.of(context).pop(true),
                      ),
                    );
                    if (confirmed == true) {
                      // TODO: Implement account deletion
                    }
                  },
                  label: 'Delete Account',
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
