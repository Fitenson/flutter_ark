import 'package:flutter/widgets.dart';
import 'package:theme_extensions_builder_annotation/theme_extensions_builder_annotation.dart';

part 'sonner.g.theme.dart';

@themeGen
@immutable
final class ArkSonnerTheme with _$ArkSonnerTheme {
  const ArkSonnerTheme({
    bool canMerge = true,
    this.visibleToastsAmount,
    this.alignment,
    this.padding,
    this.expandedGap,
    this.collapsedGap,
    this.scaleFactor,
    this.animationDuration,
    this.animationCurve,
  }) : _canMerge = canMerge;

  @ignore
  final bool _canMerge;

  @override
  bool get canMerge => _canMerge;

  /// {@macro ArkSonner.visible_toasts_amount}
  final int? visibleToastsAmount;

  /// {@macro ArkSonner.alignment}
  final AlignmentGeometry? alignment;

  /// {@macro ArkSonner.padding}
  final EdgeInsetsGeometry? padding;

  /// {@macro ArkSonner.expandedGap}
  final double? expandedGap;

  /// {@macro ArkSonner.collapsedGap}
  final double? collapsedGap;

  /// {@macro ArkSonner.scaleFactor}
  final double? scaleFactor;

  /// {@macro ArkSonner.animationDuration}
  final Duration? animationDuration;

  /// {@macro ArkSonner.animationCurve}
  final Curve? animationCurve;

  static ArkSonnerTheme? lerp(
      ArkSonnerTheme? a,
      ArkSonnerTheme? b,
      double t,
      ) => _$ArkSonnerTheme.lerp(a, b, t);
}
