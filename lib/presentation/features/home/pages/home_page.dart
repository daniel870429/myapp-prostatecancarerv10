import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/theme/app_spacing.dart';
import '../../auth/notifiers/auth_notifier.dart';
import '../widgets/dashboard_card.dart';
import '../widgets/psa_trend_card.dart';
import '../widgets/symptom_summary_card.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final textTheme = Theme.of(context).textTheme;
    final user = ref.watch(authNotifierProvider).value;

    return Scaffold(
      appBar: AppBar(title: const Text('守護之光儀表板')),
      body: ListView(
        padding: const EdgeInsets.all(AppSpacing.medium),
        children: [
          Text(
            '歡迎回來, ${user?.displayName ?? '戰士'}!',
            style: textTheme.headlineMedium,
          ),
          const SizedBox(height: AppSpacing.large),

          // This is the "Today's Focus" card mentioned in the guide.
          // For now, it's a placeholder. AI logic can be added later.
          const DashboardCard(
            title: '今日焦點',
            child: Text('今天記得保持心情愉快，並按時記錄您的狀況。'),
          ),

          // The independent, modular symptom summary card.
          const SymptomSummaryCard(),

          // The new PSA trend chart card.
          const PsaTrendCard(),

          // Other cards can be added here in the future.
        ],
      ),
    );
  }
}
