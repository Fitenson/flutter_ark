import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_ark/src/theme/color_theme/blue.dart';
import 'package:flutter_ark/src/theme/color_theme/gray.dart';
import 'package:flutter_ark/src/theme/color_theme/red.dart';
import 'package:flutter_ark/src/theme/color_theme/rose.dart';
import 'package:flutter_ark/src/theme/color_theme/slate.dart';
import 'package:flutter_ark/src/theme/color_theme/stone.dart';
import 'package:flutter_ark/src/theme/color_theme/violet.dart';
import 'package:flutter_ark/src/theme/color_theme/yellow.dart';
import 'package:flutter_ark/src/theme/color_theme/zinc.dart';

import 'green.dart';
import 'neutral.dart';
import 'orange.dart';

@immutable
base class ArkColorScheme {
  const ArkColorScheme({
    required this.background,
    required this.foreground,
    required this.card,
    required this.cardForeground,
    required this.popover,
    required this.popoverForeground,
    required this.primary,
    required this.primaryForeground,
    required this.secondary,
    required this.secondaryForeground,
    required this.muted,
    required this.mutedForeground,
    required this.accent,
    required this.accentForeground,
    required this.destructive,
    required this.destructiveForeground,
    required this.border,
    required this.input,
    required this.ring,
    required this.selection,
    this.custom
  });

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
  final Color selection;
  final Map<String, Color>? custom;

  static ArkColorScheme lerp(
    ArkColorScheme a,
    ArkColorScheme b,
    double t
  ) {
    return ArkColorScheme(
      background: Color.lerp(a.background, b.background, t)!,
      foreground: Color.lerp(a.foreground, b.foreground, t)!,
      card: Color.lerp(a.card, b.card, t)!,
      cardForeground: Color.lerp(a.cardForeground, b.cardForeground, t)!,
      popover: Color.lerp(a.popover, b.popover, t)!,
      popoverForeground: Color.lerp(a.popoverForeground, b.popoverForeground, t)!,
      primary: Color.lerp(a.primary, b.primary, t)!,
      primaryForeground: Color.lerp(a.primaryForeground, b.primaryForeground, t)!,
      secondary: Color.lerp(a.secondary, b.secondary, t)!,
      secondaryForeground: Color.lerp(a.secondaryForeground, b.secondaryForeground, t)!,
      muted: Color.lerp(a.muted, b.muted, t)!,
      mutedForeground: Color.lerp(a.mutedForeground, b.mutedForeground, t)!,
      accent: Color.lerp(a.accent, b.accent, t)!,
      accentForeground: Color.lerp(a.accentForeground, b.accentForeground, t)!,
      destructive: Color.lerp(a.destructive, b.destructive, t)!,
      destructiveForeground: Color.lerp(a.destructiveForeground, b.destructiveForeground, t)!,
      border: Color.lerp(a.border, b.border, t)!,
      input: Color.lerp(a.input, b.input, t)!,
      ring: Color.lerp(a.ring, b.ring, t)!,
      selection: Color.lerp(a.selection, b.selection, t)!,
      custom: {
        for(final key in {...?a.custom?.keys, ...?b.custom?.keys})
          key: Color.lerp(
              a.custom?[key] ?? a.foreground,
              b.custom?[key] ?? b.foreground,
              t
          )!
      }
    );
  }

  factory ArkColorScheme.fromName(
      String name, {
        Brightness brightness = Brightness.light,
      }) {
    return switch (name) {
      'blue' =>
      brightness == Brightness.light
          ? const ArkBlueColorScheme.light()
          : const ArkBlueColorScheme.dark(),
      'gray' =>
      brightness == Brightness.light
          ? const ArkGrayColorScheme.light()
          : const ArkGrayColorScheme.dark(),
      'green' =>
      brightness == Brightness.light
          ? const ArkGreenColorScheme.light()
          : const ArkGreenColorScheme.dark(),
      'neutral' =>
      brightness == Brightness.light
          ? const ArkNeutralColorScheme.light()
          : const ArkNeutralColorScheme.dark(),
      'orange' =>
      brightness == Brightness.light
          ? const ArkOrangeColorScheme.light()
          : const ArkOrangeColorScheme.dark(),
      'red' =>
      brightness == Brightness.light
          ? const ArkRedColorScheme.light()
          : const ArkRedColorScheme.dark(),
      'rose' =>
      brightness == Brightness.light
          ? const ArkRoseColorScheme.light()
          : const ArkRoseColorScheme.dark(),
      'slate' =>
      brightness == Brightness.light
          ? const ArkSlateColorScheme.light()
          : const ArkSlateColorScheme.dark(),
      'stone' =>
      brightness == Brightness.light
          ? const ArkStoneColorScheme.light()
          : const ArkStoneColorScheme.dark(),
      'violet' =>
      brightness == Brightness.light
          ? const ArkVioletColorScheme.light()
          : const ArkVioletColorScheme.dark(),
      'yellow' =>
      brightness == Brightness.light
          ? const ArkYellowColorScheme.light()
          : const ArkYellowColorScheme.dark(),
      'zinc' =>
      brightness == Brightness.light
          ? const ArkZincColorScheme.light()
          : const ArkZincColorScheme.dark(),
      _ => throw Exception('Invalid color scheme name'),
    };
  }

  ArkColorScheme copyWith({
    Color? background,
    Color? foreground,
    Color? card,
    Color? cardForeground,
    Color? popover,
    Color? popoverForeground,
    Color? primary,
    Color? primaryForeground,
    Color? secondary,
    Color? secondaryForeground,
    Color? muted,
    Color? mutedForeground,
    Color? accent,
    Color? accentForeground,
    Color? destructive,
    Color? destructiveForeground,
    Color? border,
    Color? input,
    Color? ring,
    Color? selection,
    Map<String, Color>? custom
  }) {
    return ArkColorScheme(
        background: background ?? this.background,
        foreground: foreground ?? this.foreground,
        card: card ?? this.card,
        cardForeground: cardForeground ?? this.cardForeground,
        popover: popover ?? this.popover,
        popoverForeground: popoverForeground ?? this.popoverForeground,
        primary: primary ?? this.primary,
        primaryForeground: primaryForeground ?? this.primaryForeground,
        secondary: secondary ?? this.secondary,
        secondaryForeground: secondaryForeground ?? this.secondaryForeground,
        muted: muted ?? this.muted,
        mutedForeground: mutedForeground ?? this.mutedForeground,
        accent: accent ?? this.accent,
        accentForeground: accentForeground ?? this.accentForeground,
        destructive: destructive ?? this.destructive,
        destructiveForeground: destructiveForeground ?? this.destructiveForeground,
        border: border ?? this.border,
        input: input ?? this.input,
        ring: ring ?? this.ring,
        selection: selection ?? this.selection,
        custom: custom ?? this.custom
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ArkColorScheme &&
        other.background == background &&
        other.foreground == foreground &&
        other.card == card &&
        other.cardForeground == cardForeground &&
        other.popover == popover &&
        other.popoverForeground == popoverForeground &&
        other.primary == primary &&
        other.primaryForeground == primaryForeground &&
        other.secondary == secondary &&
        other.secondaryForeground == secondaryForeground &&
        other.muted == muted &&
        other.mutedForeground == mutedForeground &&
        other.accent == accent &&
        other.accentForeground == accentForeground &&
        other.destructive == destructive &&
        other.destructiveForeground == destructiveForeground &&
        other.border == border &&
        other.input == input &&
        other.ring == ring &&
        other.selection == selection &&
        mapEquals(other.custom, custom);
  }

  @override
  int get hashCode {
    return background.hashCode ^
    foreground.hashCode ^
    card.hashCode ^
    cardForeground.hashCode ^
    popover.hashCode ^
    popoverForeground.hashCode ^
    primary.hashCode ^
    primaryForeground.hashCode ^
    secondary.hashCode ^
    secondaryForeground.hashCode ^
    muted.hashCode ^
    mutedForeground.hashCode ^
    accent.hashCode ^
    accentForeground.hashCode ^
    destructive.hashCode ^
    destructiveForeground.hashCode ^
    border.hashCode ^
    input.hashCode ^
    ring.hashCode ^
    selection.hashCode ^
    Object.hashAllUnordered(custom!.entries);
  }
}
