import 'package:flutter/material.dart';

// As per the design specification, this class provides a semantic, purpose-driven
// way to access colors, rather than using the raw ColorScheme directly.
// This enforces the "Calm Design System" and its clinical/emotional intent at the code level.

@immutable
class AppColors {
  // --- Core Semantic Roles ---
  final Color
      primary; // For primary actions, key information. Trustworthy and calm.
  final Color onPrimary; // Text/icons on primary color.
  final Color
      secondary; // For secondary actions, accents. Hopeful and encouraging.
  final Color
      error; // For critical alerts, destructive actions. Clear but not jarring.
  final Color background; // Overall page background.
  final Color surface; // Card backgrounds, dialogs.
  final Color onSurface; // Primary text color on surface/background.
  final Color onSurfaceVariant; // Secondary text, subtitles, disabled text.
  final Color success; // For positive feedback.
  final Color warning; // For non-critical warnings.
  final Color outline; // For borders, dividers.

  // --- Extended Palette for Specific Use Cases ---
  final Color healingBlue;
  final Color hopefulAmber;
  final Color gentleTeal;
  final Color calmGray;
  final Color softTerracotta; // The semantic alert color.

  const AppColors({
    required this.primary,
    required this.onPrimary,
    required this.secondary,
    required this.error,
    required this.background,
    required this.surface,
    required this.onSurface,
    required this.onSurfaceVariant,
    required this.success,
    required this.warning,
    required this.outline,
    required this.healingBlue,
    required this.hopefulAmber,
    required this.gentleTeal,
    required this.calmGray,
    required this.softTerracotta,
  });

  static const light = AppColors(
    // Define the specific palette
    healingBlue: Color(0xFF3B82F6), // A softer, more approachable blue
    hopefulAmber: Color(0xFFF59E0B), // A warm, encouraging amber
    gentleTeal: Color(0xFF14B8A6),
    calmGray: Color(0xFF6B7280),
    softTerracotta: Color(0xFFE07A5F), // A gentle, warm alert color
    // Map palette to semantic roles
    primary: Color(0xFF3B82F6), // healingBlue
    onPrimary: Color(0xFFFFFFFF),
    secondary: Color(0xFFF59E0B), // hopefulAmber
    error: Color(0xFFE07A5F), // softTerracotta
    background: Color(0xFFF9FAFB), // Lighter, softer gray
    surface: Color(0xFFFFFFFF),
    onSurface: Color(0xFF1F2937), // Darker gray for better contrast
    onSurfaceVariant: Color(0xFF6B7280), // calmGray
    success: Color(0xFF10B981), // A gentle green
    warning: Color(0xFFFBBF24), // A softer yellow
    outline: Color(0xFFE5E7EB),
  );

  static const dark = AppColors(
    // Define the specific palette for dark mode
    healingBlue: Color(0xFF60A5FA), // Lighter blue for dark background
    hopefulAmber: Color(0xFFFBBF24), // Lighter amber
    gentleTeal: Color(0xFF2DD4BF),
    calmGray: Color(0xFF9CA3AF),
    softTerracotta: Color(0xFFF28B6F), // Lighter terracotta
    // Map palette to semantic roles for dark mode
    primary: Color(0xFF60A5FA), // healingBlue
    onPrimary: Color(0xFF000000),
    secondary: Color(0xFFFBBF24), // hopefulAmber
    error: Color(0xFFF28B6F), // softTerracotta
    background: Color(0xFF111827), // Deep, dark blue-gray
    surface: Color(0xFF1F2937),
    onSurface: Color(0xFFF9FAFB), // Off-white for text
    onSurfaceVariant: Color(0xFF9CA3AF), // calmGray
    success: Color(0xFF34D399),
    warning: Color(0xFFFCD34D),
    outline: Color(0xFF374151),
  );
}
