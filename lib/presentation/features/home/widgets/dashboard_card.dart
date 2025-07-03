import 'package:flutter/material.dart';
import '../../../../core/theme/app_spacing.dart';

/// A reusable card widget for the dashboard.
///
/// Provides a consistent frame with a title for various dashboard modules.
class DashboardCard extends StatelessWidget {
  final String title;
  final Widget child;
  final Widget? headerTrailing;

  const DashboardCard(
      {required this.title,
      required this.child,
      this.headerTrailing,
      super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Card(
      // The appearance of this card is defined by the CardTheme in app_theme.dart
      child: Padding(
        padding: const EdgeInsets.all(AppSpacing.medium),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(title, style: textTheme.titleLarge),
                if (headerTrailing != null) headerTrailing!,
              ],
            ),
            const SizedBox(height: AppSpacing.medium),
            child,
          ],
        ),
      ),
    );
  }
}
