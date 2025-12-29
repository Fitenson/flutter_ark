import 'package:flutter/gestures.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_ark/src/ui/button/button.dart';
import 'package:flutter_ark/src/ui/button/theme/button.theme.dart';
import 'package:flutter_ark/src/theme/decorator.dart';
import 'package:flutter_ark/src/theme/data.dart';
import 'package:flutter_ark/src/theme/theme.dart';
import 'package:flutter_ark/src/utils/gesture_detector.dart';
import 'package:flutter_ark/src/utils/states_controller.dart';

/// A customizable icon-only button widget with variant styling.
///
/// The [ArkIconButton] widget is a specialized version of [ArkButton]
/// designed for icon-only use cases, offering multiple styling variants
/// (primary, destructive, outline, secondary, ghost). It supports rich
/// interaction states and integrates with [ArkTheme] for consistent
/// appearance. Use named constructors like [ArkIconButton.destructive] for
/// specific variants or [ArkIconButton.raw] for full control.
class ArkIconButton extends StatelessWidget {
  /// Creates a primary variant icon button widget.
  const ArkIconButton({
    super.key,
    required this.icon,
    this.iconSize,
    this.onPressed,
    this.cursor,
    this.width,
    this.height,
    this.padding,
    this.backgroundColor,
    this.hoverBackgroundColor,
    this.foregroundColor,
    this.hoverForegroundColor,
    this.autoFocus = false,
    this.focusNode,
    this.pressedBackgroundColor,
    this.pressedForegroundColor,
    this.shadows,
    this.gradient,
    this.decoration,
    this.enabled = true,
    this.onLongPress,
    this.statesController,
    this.hoverStrategies,
    this.onHoverChange,
    this.onTapDown,
    this.onTapUp,
    this.onTapCancel,
    this.onSecondaryTapDown,
    this.onSecondaryTapUp,
    this.onSecondaryTapCancel,
    this.onLongPressStart,
    this.onLongPressCancel,
    this.onLongPressUp,
    this.onLongPressDown,
    this.onLongPressEnd,
    this.onDoubleTap,
    this.onDoubleTapDown,
    this.onDoubleTapCancel,
    this.longPressDuration,
    this.onFocusChange,
  }) : variant = ArkButtonVariant.primary;

  /// Creates an icon button widget with a specified [variant], offering full
  /// customization.
  const ArkIconButton.raw({
    super.key,
    required this.variant,
    required this.icon,
    this.iconSize,
    this.onPressed,
    this.cursor,
    this.width,
    this.height,
    this.padding,
    this.backgroundColor,
    this.hoverBackgroundColor,
    this.foregroundColor,
    this.hoverForegroundColor,
    this.autoFocus = false,
    this.focusNode,
    this.onFocusChange,
    this.pressedBackgroundColor,
    this.pressedForegroundColor,
    this.shadows,
    this.gradient,
    this.decoration,
    this.enabled = true,
    this.onLongPress,
    this.statesController,
    this.hoverStrategies,
    this.onHoverChange,
    this.onTapDown,
    this.onTapUp,
    this.onTapCancel,
    this.onSecondaryTapDown,
    this.onSecondaryTapUp,
    this.onSecondaryTapCancel,
    this.onLongPressStart,
    this.onLongPressCancel,
    this.onLongPressUp,
    this.onLongPressDown,
    this.onLongPressEnd,
    this.onDoubleTap,
    this.onDoubleTapDown,
    this.onDoubleTapCancel,
    this.longPressDuration,
  }) : assert(
  variant != ArkButtonVariant.link,
  "ArkIconButton doesn't support the link variant",
  );

  /// Creates a destructive variant icon button widget, typically for warning or
  /// error actions.
  const ArkIconButton.destructive({
    super.key,
    required this.icon,
    this.iconSize,
    this.onPressed,
    this.cursor,
    this.width,
    this.height,
    this.padding,
    this.backgroundColor,
    this.hoverBackgroundColor,
    this.foregroundColor,
    this.hoverForegroundColor,
    this.autoFocus = false,
    this.focusNode,
    this.onFocusChange,
    this.pressedBackgroundColor,
    this.pressedForegroundColor,
    this.shadows,
    this.gradient,
    this.decoration,
    this.enabled = true,
    this.onLongPress,
    this.statesController,
    this.hoverStrategies,
    this.onHoverChange,
    this.onTapDown,
    this.onTapUp,
    this.onTapCancel,
    this.onSecondaryTapDown,
    this.onSecondaryTapUp,
    this.onSecondaryTapCancel,
    this.onLongPressStart,
    this.onLongPressCancel,
    this.onLongPressUp,
    this.onLongPressDown,
    this.onLongPressEnd,
    this.onDoubleTap,
    this.onDoubleTapDown,
    this.onDoubleTapCancel,
    this.longPressDuration,
  }) : variant = ArkButtonVariant.destructive;

  /// Creates an outline variant icon button widget, typically with a bordered
  /// appearance.
  const ArkIconButton.outline({
    super.key,
    required this.icon,
    this.iconSize,
    this.onPressed,
    this.cursor,
    this.width,
    this.height,
    this.padding,
    this.backgroundColor,
    this.hoverBackgroundColor,
    this.foregroundColor,
    this.hoverForegroundColor,
    this.autoFocus = false,
    this.focusNode,
    this.pressedBackgroundColor,
    this.pressedForegroundColor,
    this.shadows,
    this.gradient,
    this.decoration,
    this.enabled = true,
    this.onLongPress,
    this.statesController,
    this.hoverStrategies,
    this.onHoverChange,
    this.onTapDown,
    this.onTapUp,
    this.onTapCancel,
    this.onSecondaryTapDown,
    this.onSecondaryTapUp,
    this.onSecondaryTapCancel,
    this.onLongPressStart,
    this.onLongPressCancel,
    this.onLongPressUp,
    this.onLongPressDown,
    this.onLongPressEnd,
    this.onDoubleTap,
    this.onDoubleTapDown,
    this.onDoubleTapCancel,
    this.longPressDuration,
    this.onFocusChange,
  }) : variant = ArkButtonVariant.outline;

  /// Creates a secondary variant icon button widget, typically for less
  /// prominent actions.
  const ArkIconButton.secondary({
    super.key,
    required this.icon,
    this.iconSize,
    this.onPressed,
    this.cursor,
    this.width,
    this.height,
    this.padding,
    this.backgroundColor,
    this.hoverBackgroundColor,
    this.foregroundColor,
    this.hoverForegroundColor,
    this.autoFocus = false,
    this.focusNode,
    this.pressedBackgroundColor,
    this.pressedForegroundColor,
    this.shadows,
    this.gradient,
    this.decoration,
    this.enabled = true,
    this.onLongPress,
    this.statesController,
    this.hoverStrategies,
    this.onHoverChange,
    this.onTapDown,
    this.onTapUp,
    this.onTapCancel,
    this.onSecondaryTapDown,
    this.onSecondaryTapUp,
    this.onSecondaryTapCancel,
    this.onLongPressStart,
    this.onLongPressCancel,
    this.onLongPressUp,
    this.onLongPressDown,
    this.onLongPressEnd,
    this.onDoubleTap,
    this.onDoubleTapDown,
    this.onDoubleTapCancel,
    this.longPressDuration,
    this.onFocusChange,
  }) : variant = ArkButtonVariant.secondary;

  /// Creates a ghost variant icon button widget, typically with minimal
  /// styling.
  const ArkIconButton.ghost({
    super.key,
    required this.icon,
    this.iconSize,
    this.onPressed,
    this.cursor,
    this.width,
    this.height,
    this.padding,
    this.backgroundColor,
    this.hoverBackgroundColor,
    this.foregroundColor,
    this.hoverForegroundColor,
    this.autoFocus = false,
    this.focusNode,
    this.pressedBackgroundColor,
    this.pressedForegroundColor,
    this.shadows,
    this.gradient,
    this.decoration,
    this.enabled = true,
    this.onLongPress,
    this.statesController,
    this.hoverStrategies,
    this.onHoverChange,
    this.onTapDown,
    this.onTapUp,
    this.onTapCancel,
    this.onSecondaryTapDown,
    this.onSecondaryTapUp,
    this.onSecondaryTapCancel,
    this.onLongPressStart,
    this.onLongPressCancel,
    this.onLongPressUp,
    this.onLongPressDown,
    this.onLongPressEnd,
    this.onDoubleTap,
    this.onDoubleTapDown,
    this.onDoubleTapCancel,
    this.longPressDuration,
    this.onFocusChange,
  }) : variant = ArkButtonVariant.ghost;

  /// {@macro ArkButton.variant}
  final ArkButtonVariant variant;

  /// {@macro ArkButton.onPressed}
  final VoidCallback? onPressed;

  /// {@macro ArkButton.onLongPress}
  final VoidCallback? onLongPress;

  /// {@template ArkIconButton.icon}
  /// The icon widget displayed within the button.
  /// Typically an [Icon], required to define the button’s content.
  /// {@endtemplate}
  final Widget icon;

  /// {@template ArkIconButton.iconSize}
  /// The size of the icon within the button.
  /// Defaults to the [IconThemeData.size] if not specified.
  /// {@endtemplate}
  final double? iconSize;

  /// {@macro ArkButton.cursor}
  final MouseCursor? cursor;

  /// {@macro ArkButton.width}
  final double? width;

  /// {@macro ArkButton.height}
  final double? height;

  /// {@macro ArkButton.padding}
  final EdgeInsetsGeometry? padding;

  /// {@macro ArkButton.backgroundColor}
  final Color? backgroundColor;

  /// {@macro ArkButton.hoverBackgroundColor}
  final Color? hoverBackgroundColor;

  /// {@macro ArkButton.foregroundColor}
  final Color? foregroundColor;

  /// {@macro ArkButton.hoverForegroundColor}
  final Color? hoverForegroundColor;

  /// {@macro ArkButton.autofocus}
  final bool autoFocus;

  /// {@macro ArkButton.focusNode}
  final FocusNode? focusNode;

  /// {@macro ArkButton.pressedBackgroundColor}
  final Color? pressedBackgroundColor;

  /// {@macro ArkButton.pressedForegroundColor}
  final Color? pressedForegroundColor;

  /// {@macro ArkButton.shadows}
  final List<BoxShadow>? shadows;

  /// {@macro ArkButton.gradient}
  final Gradient? gradient;

  /// {@macro ArkButton.decoration}
  final ArkDecoration? decoration;

  /// {@macro ArkButton.enabled}
  final bool enabled;

  /// {@macro ArkButton.statesController}
  final ArkStatesController? statesController;

  /// {@macro ArkButton.hoverStrategies}
  final ArkHoverStrategies? hoverStrategies;

  /// {@macro ArkButton.onHoverChange}
  final ValueChanged<bool>? onHoverChange;

  /// {@macro ArkButton.onTapDown}
  final ValueChanged<TapDownDetails>? onTapDown;

  /// {@macro ArkButton.onTapUp}
  final ValueChanged<TapUpDetails>? onTapUp;

  /// {@macro ArkButton.onTapCancel}
  final VoidCallback? onTapCancel;

  /// {@macro ArkButton.onSecondaryTapDown}
  final ValueChanged<TapDownDetails>? onSecondaryTapDown;

  /// {@macro ArkButton.onSecondaryTapUp}
  final ValueChanged<TapUpDetails>? onSecondaryTapUp;

  /// {@macro ArkButton.onSecondaryTapCancel}
  final VoidCallback? onSecondaryTapCancel;

  /// {@macro ArkButton.onLongPressStart}
  final ValueChanged<LongPressStartDetails>? onLongPressStart;

  /// {@macro ArkButton.onLongPressCancel}
  final VoidCallback? onLongPressCancel;

  /// {@macro ArkButton.onLongPressUp}
  final VoidCallback? onLongPressUp;

  /// {@macro ArkButton.onLongPressDown}
  final ValueChanged<LongPressDownDetails>? onLongPressDown;

  /// {@macro ArkButton.onLongPressEnd}
  final ValueChanged<LongPressEndDetails>? onLongPressEnd;

  /// {@macro ArkButton.onDoubleTap}
  final VoidCallback? onDoubleTap;

  /// {@macro ArkButton.onDoubleTapDown}
  final ValueChanged<TapDownDetails>? onDoubleTapDown;

  /// {@macro ArkButton.onDoubleTapCancel}
  final VoidCallback? onDoubleTapCancel;

  /// {@macro ArkButton.longPressDuration}
  final Duration? longPressDuration;

  /// {@macro ArkButton.onFocusChange}
  final ValueChanged<bool>? onFocusChange;

  ArkButtonTheme buttonTheme(ArkThemeData theme) {
    return switch (variant) {
      ArkButtonVariant.primary => theme.primaryButtonTheme,
      ArkButtonVariant.destructive => theme.destructiveButtonTheme,
      ArkButtonVariant.secondary => theme.secondaryButtonTheme,
      ArkButtonVariant.ghost => theme.ghostButtonTheme,
      ArkButtonVariant.outline => theme.outlineButtonTheme,
      ArkButtonVariant.link => theme.linkButtonTheme,
    };
  }

  @override
  Widget build(BuildContext context) {
    final theme = ArkTheme.of(context);

    final defaultSize =
        buttonTheme(theme).sizesTheme?.icon ?? theme.buttonSizesTheme.icon!;

    final effectivePadding = padding ?? defaultSize.padding;

    final effectiveWidth = width ?? defaultSize.width;
    final effectiveHeight = height ?? defaultSize.height;

    return IconTheme(
      data: IconThemeData(size: iconSize),
      child: ArkButton.raw(
        variant: variant,
        width: effectiveWidth,
        height: effectiveHeight,
        padding: effectivePadding,
        onPressed: onPressed,
        onLongPress: onLongPress,
        cursor: cursor,
        backgroundColor: backgroundColor,
        hoverBackgroundColor: hoverBackgroundColor,
        foregroundColor: foregroundColor,
        hoverForegroundColor: hoverForegroundColor,
        autoFocus: autoFocus,
        focusNode: focusNode,
        pressedBackgroundColor: pressedBackgroundColor,
        pressedForegroundColor: pressedForegroundColor,
        shadows: shadows,
        gradient: gradient,
        decoration: decoration,
        enabled: enabled,
        statesController: statesController,
        hoverStrategies: hoverStrategies,
        onHoverChange: onHoverChange,
        onTapDown: onTapDown,
        onTapUp: onTapUp,
        onTapCancel: onTapCancel,
        onSecondaryTapDown: onSecondaryTapDown,
        onSecondaryTapUp: onSecondaryTapUp,
        onSecondaryTapCancel: onSecondaryTapCancel,
        onLongPressStart: onLongPressStart,
        onLongPressCancel: onLongPressCancel,
        onLongPressUp: onLongPressUp,
        onLongPressDown: onLongPressDown,
        onLongPressEnd: onLongPressEnd,
        onDoubleTap: onDoubleTap,
        onDoubleTapDown: onDoubleTapDown,
        onDoubleTapCancel: onDoubleTapCancel,
        longPressDuration: longPressDuration,
        onFocusChange: onFocusChange,
        child: icon,
      ),
    );
  }
}
