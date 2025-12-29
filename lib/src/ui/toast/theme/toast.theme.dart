import 'package:flutter/widgets.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_ark/src/utils/position.dart';
import 'package:flutter_ark/src/utils/border.dart';
import 'package:theme_extensions_builder_annotation/theme_extensions_builder_annotation.dart';

part 'toast.g.theme.dart';

@themeGen
@immutable
class ArkToastTheme with _$ArkToastTheme {
  const ArkToastTheme({
    bool canMerge = true,
    this.backgroundColor,
    this.closeIconData,
    this.alignment,
    this.offset,
    this.duration,
    this.animateIn,
    this.animateOut,
    this.textDirection,
    this.crossAxisAlignment,
    this.showCloseIconOnlyWhenHovered,
    this.titleStyle,
    this.descriptionStyle,
    this.actionPadding,
    this.border,
    this.radius,
    this.shadows,
    this.padding,
    this.closeIconPosition,
    this.constraints,
    this.closeIcon,
    this.mainAxisAlignment,
    this.mainAxisSize,
  }) : _canMerge = canMerge;

  @ignore
  final bool _canMerge;

  @override
  bool get canMerge => _canMerge;

  /// {@macro ArkToast.backgroundColor}
  final Color? backgroundColor;

  /// {@macro ArkToast.closeIconData}
  final IconData? closeIconData;

  /// {@macro ArkToast.alignment}
  final Alignment? alignment;

  /// {@macro ArkToast.offset}
  final Offset? offset;

  /// {@macro ArkToast.duration}
  final Duration? duration;

  /// {@macro ArkToast.animateIn}
  final List<Effect<dynamic>>? animateIn;

  /// {@macro ArkToast.animateOut}
  final List<Effect<dynamic>>? animateOut;

  /// {@macro ArkToast.textDirection}
  final TextDirection? textDirection;

  /// {@macro ArkToast.crossAxisAlignment}
  final CrossAxisAlignment? crossAxisAlignment;

  /// {@macro ArkToast.showCloseIconOnlyWhenHovered}
  final bool? showCloseIconOnlyWhenHovered;

  /// {@macro ArkToast.titleStyle}
  final TextStyle? titleStyle;

  /// {@macro ArkToast.descriptionStyle}
  final TextStyle? descriptionStyle;

  /// {@macro ArkToast.actionPadding}
  final EdgeInsetsGeometry? actionPadding;

  /// {@macro ArkToast.border}
  final ArkBorder? border;

  /// {@macro ArkToast.radius}
  final BorderRadius? radius;

  /// {@macro ArkToast.shadows}
  final List<BoxShadow>? shadows;

  /// {@macro ArkToast.padding}
  final EdgeInsetsGeometry? padding;

  /// {@macro ArkToast.closeIconPosition}
  final ArkPosition? closeIconPosition;

  /// {@macro ArkToast.constraints}
  final BoxConstraints? constraints;

  /// {@macro ArkToast.closeIcon}
  final Widget? closeIcon;

  /// {@macro ArkToast.mainAxisAlignment}
  final MainAxisAlignment? mainAxisAlignment;

  /// {@macro ArkToast.mainAxisSize}
  final MainAxisSize? mainAxisSize;

  static ArkToastTheme? lerp(
      ArkToastTheme? a,
      ArkToastTheme? b,
      double t,
      ) => _$ArkToastTheme.lerp(a, b, t);
}
