import 'package:flutter/widgets.dart';
import 'package:flutter_ark/src/ui/button/button.dart';
import 'package:flutter_ark/src/ui/button/button_sizes.dart';
import 'package:flutter_ark/src/theme/decorator.dart';
import 'package:flutter_ark/src/utils/gesture_detector.dart';
import 'package:theme_extensions_builder_annotation/theme_extensions_builder_annotation.dart';

part 'button.g.theme.dart';

/// The theme for ArkButton.
///
/// Use this class to override some properties to all buttons in just one place.
@themeGen
@immutable
final class ArkButtonTheme with _$ArkButtonTheme {
  const ArkButtonTheme({
    bool canMerge = true,
    this.cursor,
    this.size,
    this.sizesTheme,
    this.backgroundColor,
    this.hoverBackgroundColor,
    this.foregroundColor,
    this.hoverForegroundColor,
    this.pressedBackgroundColor,
    this.pressedForegroundColor,
    this.shadows,
    this.gradient,
    this.textDecoration,
    this.hoverTextDecoration,
    this.decoration,
    this.width,
    this.height,
    this.mainAxisAlignment,
    this.crossAxisAlignment,
    this.longPressDuration,
    this.hoverStrategies,
    this.textDirection,
    this.gap,
    this.expands,
    this.textStyle,
  }) : _canMerge = canMerge;

  @ignore
  final bool _canMerge;

  @override
  bool get canMerge => _canMerge;

  /// {@macro ArkButton.cursor}
  final MouseCursor? cursor;

  /// {@macro ArkButton.size}
  final ArkButtonSize? size;

  /// {@macro ArkButtonSizesTheme}
  final ArkButtonSizesTheme? sizesTheme;

  /// {@macro ArkButton.backgroundColor}
  final Color? backgroundColor;

  /// {@macro ArkButton.hoverBackgroundColor}
  final Color? hoverBackgroundColor;

  /// {@macro ArkButton.foregroundColor}
  final Color? foregroundColor;

  /// {@macro ArkButton.hoverForegroundColor}
  final Color? hoverForegroundColor;

  /// {@macro ArkButton.pressedBackgroundColor}
  final Color? pressedBackgroundColor;

  /// {@macro ArkButton.pressedForegroundColor}
  final Color? pressedForegroundColor;

  /// {@macro ArkButton.shadows}
  final List<BoxShadow>? shadows;

  /// {@macro ArkButton.gradient}
  final Gradient? gradient;

  /// {@macro ArkButton.textDecoration}
  final TextDecoration? textDecoration;

  /// {@macro ArkButton.hoverTextDecoration}
  final TextDecoration? hoverTextDecoration;

  /// {@macro ArkButton.decoration}
  final ArkDecoration? decoration;

  /// {@macro ArkButton.width}
  final double? width;

  /// {@macro ArkButton.height}
  final double? height;

  /// {@macro ArkButton.longPressDuration}
  final Duration? longPressDuration;

  /// {@macro ArkButton.hoverStrategies}
  final ArkHoverStrategies? hoverStrategies;

  /// {@macro ArkButton.mainAxisAlignment}
  final MainAxisAlignment? mainAxisAlignment;

  /// {@macro ArkButton.crossAxisAlignment}
  final CrossAxisAlignment? crossAxisAlignment;

  /// {@macro ArkButton.textDirection}
  final TextDirection? textDirection;

  /// {@macro ArkButton.gap}
  final double? gap;

  /// {@macro ArkButton.expands}
  final bool? expands;

  /// {@macro ArkButton.textStyle}
  final TextStyle? textStyle;

  static ArkButtonTheme? lerp(
      ArkButtonTheme? a,
      ArkButtonTheme? b,
      double t,
      ) {
    return _$ArkButtonTheme.lerp(a, b, t);
  }
}
