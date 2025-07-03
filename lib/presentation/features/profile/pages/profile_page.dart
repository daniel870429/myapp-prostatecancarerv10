import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/theme/app_spacing.dart';

import '../../../../core/theme/app_colors.dart';
import '../../auth/notifiers/auth_notifier.dart';
import '../../../global_widgets/dialogs/delayed_confirmation_dialog.dart';
import '../../../global_widgets/lists/app_list_item.dart';
import '../notifiers/profile_notifier.dart';

class ProfilePage extends ConsumerWidget {
  const ProfilePage({super.key});

  void _generateReport(BuildContext context, WidgetRef ref) {
    // Prevent action if already loading
    if (ref.read(profileNotifierProvider).isLoading) return;

    final box = context.findRenderObject() as RenderBox?;
    final sharePositionOrigin =
        box != null ? box.localToGlobal(Offset.zero) & box.size : null;

    // The onStart/onDone/onError callbacks are now simplified as the
    // primary loading/error state is handled by the UI listening to the provider.
    // The dialog is now a secondary feedback mechanism.
    ref.read(profileNotifierProvider.notifier).generateAndShareReport(
          sharePositionOrigin: sharePositionOrigin,
          onStart: () => showDialog(
            context: context,
            barrierDismissible: false,
            builder: (_) => const Center(child: CircularProgressIndicator()),
          ),
          onDone: () => Navigator.of(context, rootNavigator: true).pop(),
          onError: (message) {
            // The main listener already handles showing the snackbar.
            // This callback is now mostly for logging or specific UI changes if needed.
          },
        );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final colors = theme.brightness == Brightness.light ? AppColors.light : AppColors.dark;
    final authState = ref.watch(authNotifierProvider);

    // Listen to the notifier for side effects like showing dialogs or snackbars.
    ref.listen<AsyncValue<void>>(profileNotifierProvider, (_, state) {
      state.whenOrNull(
        error: (error, stackTrace) {
          // Ensure loading dialog is closed before showing snackbar
          if (Navigator.of(context, rootNavigator: true).canPop()) {
            Navigator.of(context, rootNavigator: true).pop();
          }
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('發生錯誤: $error')),
          );
        },
      );
    });

    return Scaffold(
      appBar: AppBar(
        title: const Text('個人中心'),
        centerTitle: true,
        elevation: 0,
        backgroundColor: theme.scaffoldBackgroundColor,
      ),
      body: ListView(
        padding: const EdgeInsets.all(AppSpacing.medium),
        children: [
          // Section: User Info
          authState.when(
            data: (user) {
              if (user == null) {
                return AppListItem(
                  icon: Icons.login,
                  title: '登入/註冊',
                  onTap: () {
                    // TODO: Navigate to login page
                  },
                );
              }
              return Container(
                padding: const EdgeInsets.all(AppSpacing.large),
                decoration: BoxDecoration(
                  color: theme.colorScheme.surface,
                  borderRadius: BorderRadius.circular(AppSpacing.medium),
                ),
                child: Row(
                  children: [
                    CircleAvatar(
                      radius: 32,
                      backgroundColor: theme.colorScheme.primary.withAlpha((0.1 * 255).round()),
                      child: Text(
                        user.email?.substring(0, 1).toUpperCase() ?? '?',
                        style: theme.textTheme.headlineLarge?.copyWith(
                          color: theme.colorScheme.primary,
                        ),
                      ),
                    ),
                    const SizedBox(width: AppSpacing.medium),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            user.displayName ?? '使用者',
                            style: theme.textTheme.titleLarge,
                            overflow: TextOverflow.ellipsis,
                          ),
                          const SizedBox(height: AppSpacing.xsmall),
                          Text(
                            user.email ?? '無 Email 資訊',
                            style: theme.textTheme.bodyMedium?.copyWith(
                              color: theme.colorScheme.onSurface.withAlpha((0.7 * 255).round()),
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            },
            loading: () => const Center(child: CircularProgressIndicator()),
            error: (err, st) => Center(child: Text('無法載入使用者資訊: $err')),
          ),
          const SizedBox(height: AppSpacing.large),

          // Section: Actions
          _buildSectionTitle(context, '功能'),
          Builder(builder: (context) {
            return AppListItem(
              icon: Icons.picture_as_pdf_outlined,
              title: '產生就診摘要',
              isLoading: ref.watch(profileNotifierProvider).isLoading,
              onTap: () => _generateReport(context, ref),
            );
          }),
          AppListItem(
            icon: Icons.notifications_none_outlined,
            title: '通知設定',
            onTap: () {
              // TODO: Navigate to notification settings page
            },
          ),
          AppListItem(
            icon: Icons.shield_outlined,
            title: '資料與隱私',
            onTap: () {
              // TODO: Navigate to data & privacy page
            },
          ),
          const SizedBox(height: AppSpacing.large),

          // Section: Danger Zone
          if (authState.valueOrNull != null) ...[
            _buildSectionTitle(context, '帳戶'),
            AppListItem(
              icon: Icons.logout,
              title: '登出',
              textColor: colors.error,
              onTap: () async {
                final confirmed = await showDialog<bool>(
                  context: context,
                  builder: (context) => const DelayedConfirmationDialog(
                    title: '確認登出',
                    content: '此為重要操作，請再次確認您是否要登出目前帳戶。',
                    confirmText: '確認登出',
                  ),
                );
                if (confirmed ?? false) {
                  await ref.read(authNotifierProvider.notifier).signOut();
                }
              },
            ),
          ]
        ],
      ),
    );
  }

  Widget _buildSectionTitle(BuildContext context, String title) {
    return Padding(
      padding: const EdgeInsets.only(
        left: AppSpacing.medium,
        right: AppSpacing.medium,
        top: AppSpacing.small,
        bottom: AppSpacing.small,
      ),
      child: Text(
        title,
        style: Theme.of(context).textTheme.titleSmall?.copyWith(
              color: Theme.of(context).colorScheme.onSurface.withAlpha((0.6 * 255).round()),
            ),
      ),
    );
  }
}
