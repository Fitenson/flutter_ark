import 'package:flutter/widgets.dart';
import 'package:theme_extensions_builder_annotation/theme_extensions_builder_annotation.dart';

part 'button_sizes.g.theme.dart';

@themeGen
@immutable
final class ArkButtonSizeTheme with _$ArkButtonSizeTheme {
  const ArkButtonSizeTheme({
    bool canMerge = true,
    required this.height,
    required this.padding,
    this.width,
  }) : _canMerge = canMerge;

  @ignore
  final bool _canMerge;

  @override
  bool get canMerge => _canMerge;

  final double height;
  final EdgeInsetsGeometry padding;
  final double? width;

  static ArkButtonSizeTheme? lerp(
      ArkButtonSizeTheme? a,
      ArkButtonSizeTheme? b,
      double t,
      ) {
    return ArkButtonSizeTheme.lerp(a, b, t);
  }
}

@themeGen
@immutable
final class ArkButtonSizesTheme with _$ArkButtonSizesTheme {
  const ArkButtonSizesTheme({
    bool canMerge = true,
    this.regular,
    this.sm,
    this.lg,
    this.icon,
  }) : _canMerge = canMerge;

  @ignore
  final bool _canMerge;

  @override
  bool get canMerge => _canMerge;

  final ArkButtonSizeTheme? regular;
  final ArkButtonSizeTheme? sm;
  final ArkButtonSizeTheme? lg;
  final ArkButtonSizeTheme? icon;

  static ArkButtonSizesTheme? lerp(
      ArkButtonSizesTheme? a,
      ArkButtonSizesTheme? b,
      double t,
      ) => ArkButtonSizesTheme.lerp(a, b, t);
}
