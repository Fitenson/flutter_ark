import 'package:flutter/material.dart';

final class ArkColors {
  final Color background;
  final Color foreground;
  final Color card;
  final Color cardForeground;
  final Color popover;
  final Color popoverForeground;
  final Color primary;
  final Color primaryForeground;
  final Color secondary;
  final Color secondaryForeground;
  final Color muted;
  final Color mutedForeground;
  final Color accent;
  final Color accentForeground;
  final Color destructive;
  final Color destructiveForeground;
  final Color border;
  final Color input;
  final Color ring;
  final Color success;
  final Color warning;
  final Color info;
  final Brightness brightness;

  // Default light theme
  static final ArkColors light = ArkColors._light();

  // Default dark theme
  static final ArkColors dark = ArkColors._dark();

  // Predefined color schemes
  static final ArkColors blue = ArkColors._blue();
  static final ArkColors green = ArkColors._green();
  static final ArkColors orange = ArkColors._orange();
  static final ArkColors pink = ArkColors._pink();
  static final ArkColors purple = ArkColors._purple();
  static final ArkColors red = ArkColors._red();

  /// Factory constructor for custom colors
  factory ArkColors.custom({
    required Color primary,
    required Color background,
    required Color foreground,
    Color? secondary,
    Color? muted,
    Color? accent,
    Color? destructive,
    Color? border,
    Color? input,
    Color? ring,
    Brightness brightness = Brightness.light,
  }) {
    final isDark = brightness == Brightness.dark;

    return ArkColors._(
      brightness: brightness,
      background: background,
      foreground: foreground,
      primary: primary,
      secondary: secondary ?? (isDark ? const Color(0xFF334155) : const Color(0xFFF1F5F9)),
      muted: muted ?? (isDark ? const Color(0xFF1E293B) : const Color(0xFFF1F5F9)),
      accent: accent ?? (isDark ? const Color(0xFF334155) : const Color(0xFFF1F5F9)),
      destructive: destructive ?? (isDark ? const Color(0xFF7F1D1D) : const Color(0xFFEF4444)),
      border: border ?? (isDark ? const Color(0xFF334155) : const Color(0xFFE2E8F0)),
      input: input ?? (isDark ? const Color(0xFF1E293B) : const Color(0xFFF8FAFC)),
      ring: ring ?? (isDark ? const Color(0xFFCBD5E1) : const Color(0xFF020817)),
    );
  }

  // Private constructors
  ArkColors._light()
      : brightness = Brightness.light,
        background = const Color(0xFFFFFFFF),
        foreground = const Color(0xFF020817),
        card = const Color(0xFFFFFFFF),
        cardForeground = const Color(0xFF020817),
        popover = const Color(0xFFFFFFFF),
        popoverForeground = const Color(0xFF020817),
        primary = const Color(0xFF0F172A),
        primaryForeground = const Color(0xFFF8FAFC),
        secondary = const Color(0xFFF1F5F9),
        secondaryForeground = const Color(0xFF0F172A),
        muted = const Color(0xFFF1F5F9),
        mutedForeground = const Color(0xFF64748B),
        accent = const Color(0xFFF1F5F9),
        accentForeground = const Color(0xFF0F172A),
        destructive = const Color(0xFFEF4444),
        destructiveForeground = const Color(0xFFF8FAFC),
        border = const Color(0xFFE2E8F0),
        input = const Color(0xFFF8FAFC),
        ring = const Color(0xFF020817),
        success = const Color(0xFF22C55E),
        warning = const Color(0xFFF59E0B),
        info = const Color(0xFF3B82F6);

  ArkColors._dark()
      : brightness = Brightness.dark,
        background = const Color(0xFF0F172A),
        foreground = const Color(0xFFF8FAFC),
        card = const Color(0xFF1E293B),
        cardForeground = const Color(0xFFF8FAFC),
        popover = const Color(0xFF1E293B),
        popoverForeground = const Color(0xFFF8FAFC),
        primary = const Color(0xFFF8FAFC),
        primaryForeground = const Color(0xFF0F172A),
        secondary = const Color(0xFF334155),
        secondaryForeground = const Color(0xFFF8FAFC),
        muted = const Color(0xFF1E293B),
        mutedForeground = const Color(0xFF94A3B8),
        accent = const Color(0xFF334155),
        accentForeground = const Color(0xFFF8FAFC),
        destructive = const Color(0xFF7F1D1D),
        destructiveForeground = const Color(0xFFF8FAFC),
        border = const Color(0xFF334155),
        input = const Color(0xFF1E293B),
        ring = const Color(0xFFCBD5E1),
        success = const Color(0xFF16A34A),
        warning = const Color(0xFFD97706),
        info = const Color(0xFF2563EB);

  ArkColors._blue()
      : brightness = Brightness.light,
        background = const Color(0xFFFFFFFF),
        foreground = const Color(0xFF0C4A6E),
        card = const Color(0xFFFFFFFF),
        cardForeground = const Color(0xFF0C4A6E),
        popover = const Color(0xFFFFFFFF),
        popoverForeground = const Color(0xFF0C4A6E),
        primary = const Color(0xFF0369A1),
        primaryForeground = const Color(0xFFF0F9FF),
        secondary = const Color(0xFFE0F2FE),
        secondaryForeground = const Color(0xFF0C4A6E),
        muted = const Color(0xFFF0F9FF),
        mutedForeground = const Color(0xFF0C4A6E),
        accent = const Color(0xFFE0F2FE),
        accentForeground = const Color(0xFF0C4A6E),
        destructive = const Color(0xFFEF4444),
        destructiveForeground = const Color(0xFFF8FAFC),
        border = const Color(0xFFBAE6FD),
        input = const Color(0xFFF0F9FF),
        ring = const Color(0xFF0369A1),
        success = const Color(0xFF22C55E),
        warning = const Color(0xFFF59E0B),
        info = const Color(0xFF3B82F6);

  ArkColors._green()
      : brightness = Brightness.light,
        background = const Color(0xFFFFFFFF),
        foreground = const Color(0xFF052E16),
        card = const Color(0xFFFFFFFF),
        cardForeground = const Color(0xFF052E16),
        popover = const Color(0xFFFFFFFF),
        popoverForeground = const Color(0xFF052E16),
        primary = const Color(0xFF15803D),
        primaryForeground = const Color(0xFFF0FDF4),
        secondary = const Color(0xFFDCFCE7),
        secondaryForeground = const Color(0xFF052E16),
        muted = const Color(0xFFF0FDF4),
        mutedForeground = const Color(0xFF052E16),
        accent = const Color(0xFFDCFCE7),
        accentForeground = const Color(0xFF052E16),
        destructive = const Color(0xFFEF4444),
        destructiveForeground = const Color(0xFFF8FAFC),
        border = const Color(0xFFBBF7D0),
        input = const Color(0xFFF0FDF4),
        ring = const Color(0xFF15803D),
        success = const Color(0xFF22C55E),
        warning = const Color(0xFFF59E0B),
        info = const Color(0xFF3B82F6);

  ArkColors._orange()
      : brightness = Brightness.light,
        background = const Color(0xFFFFFFFF),
        foreground = const Color(0xFF7C2D12),
        card = const Color(0xFFFFFFFF),
        cardForeground = const Color(0xFF7C2D12),
        popover = const Color(0xFFFFFFFF),
        popoverForeground = const Color(0xFF7C2D12),
        primary = const Color(0xFFEA580C),
        primaryForeground = const Color(0xFFFFFBEB),
        secondary = const Color(0xFFFFEDD5),
        secondaryForeground = const Color(0xFF7C2D12),
        muted = const Color(0xFFFFFBEB),
        mutedForeground = const Color(0xFF7C2D12),
        accent = const Color(0xFFFFEDD5),
        accentForeground = const Color(0xFF7C2D12),
        destructive = const Color(0xFFEF4444),
        destructiveForeground = const Color(0xFFF8FAFC),
        border = const Color(0xFFFED7AA),
        input = const Color(0xFFFFFBEB),
        ring = const Color(0xFFEA580C),
        success = const Color(0xFF22C55E),
        warning = const Color(0xFFF59E0B),
        info = const Color(0xFF3B82F6);

  // Additional predefined schemes...
  ArkColors._pink()
      : brightness = Brightness.light,
        background = const Color(0xFFFFFFFF),
        foreground = const Color(0xFF831843),
        card = const Color(0xFFFFFFFF),
        cardForeground = const Color(0xFF831843),
        popover = const Color(0xFFFFFFFF),
        popoverForeground = const Color(0xFF831843),
        primary = const Color(0xFFDB2777),
        primaryForeground = const Color(0xFFFDF2F8),
        secondary = const Color(0xFFFCE7F3),
        secondaryForeground = const Color(0xFF831843),
        muted = const Color(0xFFFDF2F8),
        mutedForeground = const Color(0xFF831843),
        accent = const Color(0xFFFCE7F3),
        accentForeground = const Color(0xFF831843),
        destructive = const Color(0xFFEF4444),
        destructiveForeground = const Color(0xFFF8FAFC),
        border = const Color(0xFFFBCFE8),
        input = const Color(0xFFFDF2F8),
        ring = const Color(0xFFDB2777),
        success = const Color(0xFF22C55E),
        warning = const Color(0xFFF59E0B),
        info = const Color(0xFF3B82F6);

  ArkColors._purple()
      : brightness = Brightness.light,
        background = const Color(0xFFFFFFFF),
        foreground = const Color(0xFF581C87),
        card = const Color(0xFFFFFFFF),
        cardForeground = const Color(0xFF581C87),
        popover = const Color(0xFFFFFFFF),
        popoverForeground = const Color(0xFF581C87),
        primary = const Color(0xFF9333EA),
        primaryForeground = const Color(0xFFFAF5FF),
        secondary = const Color(0xFFF3E8FF),
        secondaryForeground = const Color(0xFF581C87),
        muted = const Color(0xFFFAF5FF),
        mutedForeground = const Color(0xFF581C87),
        accent = const Color(0xFFF3E8FF),
        accentForeground = const Color(0xFF581C87),
        destructive = const Color(0xFFEF4444),
        destructiveForeground = const Color(0xFFF8FAFC),
        border = const Color(0xFFE9D5FF),
        input = const Color(0xFFFAF5FF),
        ring = const Color(0xFF9333EA),
        success = const Color(0xFF22C55E),
        warning = const Color(0xFFF59E0B),
        info = const Color(0xFF3B82F6);

  ArkColors._red()
      : brightness = Brightness.light,
        background = const Color(0xFFFFFFFF),
        foreground = const Color(0xFF7F1D1D),
        card = const Color(0xFFFFFFFF),
        cardForeground = const Color(0xFF7F1D1D),
        popover = const Color(0xFFFFFFFF),
        popoverForeground = const Color(0xFF7F1D1D),
        primary = const Color(0xFFDC2626),
        primaryForeground = const Color(0xFFFEF2F2),
        secondary = const Color(0xFFFEE2E2),
        secondaryForeground = const Color(0xFF7F1D1D),
        muted = const Color(0xFFFEF2F2),
        mutedForeground = const Color(0xFF7F1D1D),
        accent = const Color(0xFFFEE2E2),
        accentForeground = const Color(0xFF7F1D1D),
        destructive = const Color(0xFFEF4444),
        destructiveForeground = const Color(0xFFF8FAFC),
        border = const Color(0xFFFECACA),
        input = const Color(0xFFFEF2F2),
        ring = const Color(0xFFDC2626),
        success = const Color(0xFF22C55E),
        warning = const Color(0xFFF59E0B),
        info = const Color(0xFF3B82F6);

  // Private constructor for custom colors
  ArkColors._({
    required this.brightness,
    required this.background,
    required this.foreground,
    required this.primary,
    required this.secondary,
    required this.muted,
    required this.accent,
    required this.destructive,
    required this.border,
    required this.input,
    required this.ring,
  })  : card = background,
        cardForeground = foreground,
        popover = background,
        popoverForeground = foreground,
        primaryForeground = brightness == Brightness.dark ? const Color(0xFF0F172A) : const Color(0xFFF8FAFC),
        secondaryForeground = brightness == Brightness.dark ? const Color(0xFFF8FAFC) : const Color(0xFF0F172A),
        mutedForeground = brightness == Brightness.dark ? const Color(0xFF94A3B8) : const Color(0xFF64748B),
        accentForeground = brightness == Brightness.dark ? const Color(0xFFF8FAFC) : const Color(0xFF0F172A),
        destructiveForeground = const Color(0xFFF8FAFC),
        success = brightness == Brightness.dark ? const Color(0xFF16A34A) : const Color(0xFF22C55E),
        warning = brightness == Brightness.dark ? const Color(0xFFD97706) : const Color(0xFFF59E0B),
        info = brightness == Brightness.dark ? const Color(0xFF2563EB) : const Color(0xFF3B82F6);
}
