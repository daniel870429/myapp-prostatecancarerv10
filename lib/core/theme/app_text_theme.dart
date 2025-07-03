// lib/core/theme/app_text_theme.dart

import 'package:flutter/material.dart';
import 'app_colors.dart';

/// Defines the application's text theme, ensuring consistency and readability.
/// All text styles are based on the Noto Sans TC font family.
class AppTextTheme {
  AppTextTheme._();

  static const String _fontFamily = 'Noto Sans TC';

  static final TextTheme textTheme = TextTheme(
    // Display
    displayLarge: const TextStyle(fontFamily: _fontFamily, fontWeight: FontWeight.bold, fontSize: 57, color: AppColors.textPrimary),
    displayMedium: const TextStyle(fontFamily: _fontFamily, fontWeight: FontWeight.bold, fontSize: 45, color: AppColors.textPrimary),
    displaySmall: const TextStyle(fontFamily: _fontFamily, fontWeight: FontWeight.bold, fontSize: 36, color: AppColors.textPrimary),

    // Headline
    headlineLarge: const TextStyle(fontFamily: _fontFamily, fontWeight: FontWeight.bold, fontSize: 32, color: AppColors.textPrimary),
    headlineMedium: const TextStyle(fontFamily: _fontFamily, fontWeight: FontWeight.bold, fontSize: 28, color: AppColors.textPrimary),
    headlineSmall: const TextStyle(fontFamily: _fontFamily, fontWeight: FontWeight.bold, fontSize: 24, color: AppColors.textPrimary),

    // Title
    titleLarge: const TextStyle(fontFamily: _fontFamily, fontWeight: FontWeight.w600, fontSize: 22, color: AppColors.textPrimary),
    titleMedium: const TextStyle(fontFamily: _fontFamily, fontWeight: FontWeight.w600, fontSize: 16, color: AppColors.textPrimary),
    titleSmall: const TextStyle(fontFamily: _fontFamily, fontWeight: FontWeight.w600, fontSize: 14, color: AppColors.textPrimary),

    // Body
    bodyLarge: const TextStyle(fontFamily: _fontFamily, fontSize: 16, height: 1.5, color: AppColors.textPrimary),
    bodyMedium: const TextStyle(fontFamily: _fontFamily, fontSize: 14, height: 1.5, color: AppColors.textSecondary),
    bodySmall: const TextStyle(fontFamily: _fontFamily, fontSize: 12, height: 1.5, color: AppColors.textSecondary),

    // Label
    labelLarge: const TextStyle(fontFamily: _fontFamily, fontWeight: FontWeight.w500, fontSize: 14, color: AppColors.onPrimary),
    labelMedium: const TextStyle(fontFamily: _fontFamily, fontWeight: FontWeight.w500, fontSize: 12, color: AppColors.textSecondary),
    labelSmall: const TextStyle(fontFamily: _fontFamily, fontWeight: FontWeight.w500, fontSize: 11, color: AppColors.textSecondary),
  );
}
