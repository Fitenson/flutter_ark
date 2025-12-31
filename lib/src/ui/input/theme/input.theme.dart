import 'package:flutter/widgets.dart';

import 'package:flutter_ark/src/theme/decorator.dart';
import 'package:theme_extensions_builder_annotation/theme_extensions_builder_annotation.dart';

part 'input.g.theme.dart';

@themeGen
@immutable
class ArkInputTheme with _$ArkInputTheme {
  const ArkInputTheme({
    bool canMerge = true,
    this.decoration,
    this.padding,
    this.style,
    this.cursorColor,
    this.cursorWidth,
    this.cursorHeight,
    this.cursorRadius,
    this.cursorOpacityAnimates,
    this.placeholderStyle,
    this.alignment,
    this.placeholderAlignment,
    this.inputPadding,
    this.mainAxisAlignment,
    this.crossAxisAlignment,
    this.gap,
    this.constraints,
    this.scrollbarPadding,
    this.verticalGap,
  }) : _canMerge = canMerge;

  @ignore
  final bool _canMerge;

  @override
  bool get canMerge => _canMerge;

  /// {@macro ArkInput.decoration}
  final ArkDecoration? decoration;

  /// {@macro ArkInput.padding}
  final EdgeInsetsGeometry? padding;

  /// {@macro ArkInput.style}
  final TextStyle? style;

  /// {@macro ArkInput.cursorColor}
  final Color? cursorColor;

  /// {@macro ArkInput.cursorWidth}
  final double? cursorWidth;

  /// {@macro ArkInput.cursorHeight}
  final double? cursorHeight;

  /// {@macro ArkInput.cursorRadius}
  final Radius? cursorRadius;

  /// {@macro ArkInput.cursorOpacityAnimates}
  final bool? cursorOpacityAnimates;

  /// {@macro ArkInput.placeholderStyle}
  final TextStyle? placeholderStyle;

  /// {@macro ArkInput.alignment}
  final AlignmentGeometry? alignment;

  /// {@macro ArkInput.placeholderAlignment}
  final AlignmentGeometry? placeholderAlignment;

  /// {@macro ArkInput.inputPadding}
  final EdgeInsetsGeometry? inputPadding;

  /// {@macro ArkInput.mainAxisAlignment}
  final MainAxisAlignment? mainAxisAlignment;

  /// {@macro ArkInput.crossAxisAlignment}
  final CrossAxisAlignment? crossAxisAlignment;

  /// {@macro ArkInput.gap}
  final double? gap;

  /// {@macro ArkInput.constraints}
  final BoxConstraints? constraints;

  /// {@macro ArkInput.scrollbarPadding}
  final EdgeInsetsGeometry? scrollbarPadding;

  /// {@macro ArkInput.verticalGap}
  final double? verticalGap;

  static ArkInputTheme? lerp(
      ArkInputTheme? a,
      ArkInputTheme? b,
      double t,
      ) => _$ArkInputTheme.lerp(a, b, t);
}
