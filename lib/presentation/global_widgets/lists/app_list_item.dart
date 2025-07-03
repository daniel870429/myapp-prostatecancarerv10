import 'package:flutter/material.dart';
import '../../../core/theme/app_spacing.dart';

// A dedicated, reusable widget for list items across the app,
// enforcing consistency and accessibility standards.
class AppListItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final Color? textColor;
  final bool isLoading;
  final VoidCallback onTap;

  const AppListItem({
    required this.icon, required this.title, required this.onTap, super.key,
    this.textColor,
    this.isLoading = false,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final listTileTheme = theme.listTileTheme;

    // By wrapping with MergeSemantics, the screen reader will treat the entire
    // list item as a single, focused element, reading the label in one go.
    return MergeSemantics(
      child: Material(
        color: theme.colorScheme.surface,
        shape: listTileTheme.shape,
        child: InkWell(
          onTap: isLoading ? null : onTap, // Disable tap when loading
          customBorder: listTileTheme.shape,
          child: ConstrainedBox(
            constraints: const BoxConstraints(minHeight: 56), // Ensures large enough touch target
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: AppSpacing.large, vertical: AppSpacing.medium),
              child: Row(
                children: [
                  // Exclude the icon from semantics because its meaning is conveyed
                  // by the list item's overall label.
                  ExcludeSemantics(
                    child: Icon(icon, color: textColor ?? listTileTheme.iconColor),
                  ),
                  const SizedBox(width: AppSpacing.large),
                  Expanded(
                    child: Text(
                      title,
                      style: listTileTheme.titleTextStyle?.copyWith(color: textColor),
                    ),
                  ),
                  // Also exclude the decorative trailing widget.
                  ExcludeSemantics(
                    child: _buildTrailingWidget(context),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTrailingWidget(BuildContext context) {
    if (isLoading) {
      return const SizedBox(
        width: 24,
        height: 24,
        child: CircularProgressIndicator(strokeWidth: 2.5),
      );
    }
    if (textColor == null) {
      return Icon(
        Icons.arrow_forward_ios,
        size: 16,
        color: Theme.of(context).colorScheme.onSurface.withAlpha((0.4 * 255).round()),
      );
    }
    return const SizedBox.shrink(); // No trailing widget for items like 'Logout'
  }
}
