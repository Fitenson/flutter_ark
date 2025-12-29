import 'package:flutter/widgets.dart';
import 'package:flutter_ark/src/utils/border.dart';
import 'package:theme_extensions_builder_annotation/theme_extensions_builder_annotation.dart';

part 'card.g.theme.dart';

@themeGen
@immutable
final class ArkCardTheme with _$ArkCardTheme {
  const ArkCardTheme({
    bool canMerge = true,
    this.backgroundColor,
    this.padding,
    this.radius,
    this.border,
    this.shadows,
    this.width,
    this.height,
    this.rowMainAxisAlignment,
    this.rowCrossAxisAlignment,
    this.columnMainAxisAlignment,
    this.columnCrossAxisAlignment,
    this.rowMainAxisSize,
    this.columnMainAxisSize,
    this.clipBehavior,
  }) : _canMerge = canMerge;

  @ignore
  final bool _canMerge;

  @override
  bool get canMerge => _canMerge;

  /// {@macro ArkCard.padding}
  final EdgeInsetsGeometry? padding;

  /// {@macro ArkCard.backgroundColor}
  final Color? backgroundColor;

  /// {@macro ArkCard.radius}
  final BorderRadius? radius;

  /// {@macro ArkCard.border}
  final ArkBorder? border;

  /// {@macro ArkCard.shadows}
  final List<BoxShadow>? shadows;

  /// {@macro ArkCard.width}
  final double? width;

  /// {@macro ArkCard.height}
  final double? height;

  /// {@macro ArkCard.rowMainAxisAlignment}
  final MainAxisAlignment? rowMainAxisAlignment;

  /// {@macro ArkCard.rowCrossAxisAlignment}
  final CrossAxisAlignment? rowCrossAxisAlignment;

  /// {@macro ArkCard.columnMainAxisAlignment}
  final MainAxisAlignment? columnMainAxisAlignment;

  /// {@macro ArkCard.columnCrossAxisAlignment}
  final CrossAxisAlignment? columnCrossAxisAlignment;

  /// {@macro ArkCard.rowMainAxisSize}
  final MainAxisSize? rowMainAxisSize;

  /// {@macro ArkCard.columnMainAxisSize}
  final MainAxisSize? columnMainAxisSize;

  /// {@macro ArkCard.clipBehavior}
  final Clip? clipBehavior;

  static ArkCardTheme? lerp(
      ArkCardTheme? a,
      ArkCardTheme? b,
      double t,
      ) => _$ArkCardTheme.lerp(a, b, t);
}
