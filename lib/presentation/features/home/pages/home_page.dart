import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/theme/app_spacing.dart';
import '../../../../data/data_providers.dart';
import '../widgets/psa_trend_card.dart';
import '../widgets/symptom_summary_card.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authState = ref.watch(authStateChangesProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Welcome, ${authState.asData?.value?.displayName ?? 'User'}',
        ),
      ),
      body: const SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(AppSpacing.medium),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              PsaTrendCard(),
              SizedBox(height: AppSpacing.medium),
              SymptomSummaryCard(),
            ],
          ),
        ),
      ),
    );
  }
}
