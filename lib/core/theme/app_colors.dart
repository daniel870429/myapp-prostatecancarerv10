// lib/core/theme/app_colors.dart

import 'package:flutter/material.dart';

/// A class that holds the application's semantic color palette.
/// This approach enforces design-by-purpose, ensuring that colors are used
/// consistently and meaningfully throughout the app.
class AppColors {
  // This class is not meant to be instantiated.
  AppColors._();

  // --- Core Palette ---
  static const Color primary = Color(0xFF005A9C); // Clinical Trust Blue
  static const Color onPrimary = Color(0xFFFFFFFF);
  static const Color secondary = Color(0xFFFDB813); // Hopeful Amber

  // --- Feedback Palette ---
  static const Color error = Color(0xFFB00020);
  static const Color success = Color(0xFF2E7D32);
  static const Color warning = Color(0xFFFFC107);

  // --- Surface Palette ---
  static const Color background = Color(0xFFF5F5F5);
  static const Color surface = Color(0xFFFFFFFF);

  // --- Text Palette ---
  static const Color textPrimary = Color(0xFF1A1A1A);
  static const Color textSecondary = Color(0xFF4A4A4A);
}
