import 'package:flutter/gestures.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_ark/src/theme/data.dart';
import 'package:flutter_ark/src/theme/decorator.dart';
import 'package:flutter_ark/src/theme/theme.dart';
import 'package:flutter_ark/src/ui/button/theme/button.theme.dart';
import 'package:flutter_ark/src/components/focusable.dart';
import 'package:flutter_ark/src/utils/gesture_detector.dart';
import 'package:flutter_ark/src/utils/states_controller.dart';
import 'package:flutter_ark/src/utils/separated_iterable.dart';
import 'button_sizes.dart';

enum ArkButtonVariant {
  primary,
  destructive,
  outline,
  secondary,
  ghost,
  link
}

enum ArkButtonSize {
  regular,
  sm,
  lg
}

final class ArkButton extends StatefulWidget {
  const ArkButton({
    super.key,
    this.child,
    this.width,
    this.height,
    this.padding,
    this.backgroundColor,
    this.hoverBackgroundColor,
    this.foregroundColor,
    this.hoverForegroundColor,
    this.autoFocus = false,
    this.focusNode,
    this.onPressed,
    this.pressedBackgroundColor,
    this.pressedForegroundColor,
    this.gradient,
    this.cursor,
    this.textDecoration,
    this.hoverTextDecoration,
    this.decoration,
    this.enabled = true,
    this.onLongPress,
    this.statesController,
    this.mainAxisAlignment,
    this.crossAxisAlignment,
    this.hoverStrategies,
    this.onHoverChange,
    this.onTapDown,
    this.onTapUp,
    this.onTapCancel,
    this.onLongPressStart,
    this.onLongPressCancel,
    this.onLongPressUp,
    this.onLongPressDown,
    this.onLongPressEnd,
    this.onDoubleTap,
    this.onDoubleTapDown,
    this.onDoubleTapCancel,
    this.onSecondaryTapUp,
    this.onSecondaryTapDown,
    this.onSecondaryTapCancel,
    this.longPressDuration,
    this.textDirection,
    this.gap,
    this.size,
    this.leading,
    this.trailing,
    this.onFocusChange,
    this.expands,
    this.textStyle,
    this.canRequestFocus,
    this.shadows,
  }) : variant = ArkButtonVariant.primary;

  const ArkButton.raw({
    super.key,
    required this.variant,
    this.size,
    this.child,
    this.leading,
    this.trailing,
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
    this.textDecoration,
    this.hoverTextDecoration,
    this.decoration,
    this.enabled = true,
    this.onLongPress,
    this.statesController,
    this.mainAxisAlignment,
    this.crossAxisAlignment,
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
    this.textDirection,
    this.gap,
    this.onFocusChange,
    this.expands,
    this.textStyle,
    this.canRequestFocus,
  });

  final VoidCallback? onPressed;
  final VoidCallback? onLongPress;
  final Widget? child;
  final ArkButtonVariant variant;
  final double? width;
  final double? height;
  final EdgeInsetsGeometry? padding;

  final Color? backgroundColor;
  final Color? foregroundColor;
  final Color? hoverForegroundColor;
  final Color? hoverBackgroundColor;
  final Color? pressedBackgroundColor;
  final Color? pressedForegroundColor;

  final bool autoFocus;
  final FocusNode? focusNode;
  final MouseCursor? cursor;
  final ArkButtonSize? size;
  final Widget? leading;
  final Widget? trailing;

  final List<BoxShadow>? shadows;
  final Gradient? gradient;
  final TextDecoration? textDecoration;
  final TextDecoration? hoverTextDecoration;
  final ArkDecoration? decoration;
  final bool enabled;
  final ArkStatesController? statesController;

  final MainAxisAlignment? mainAxisAlignment;
  final CrossAxisAlignment? crossAxisAlignment;
  final ArkHoverStrategies? hoverStrategies;
  final ValueChanged<bool>? onHoverChange;
  final ValueChanged<TapDownDetails>? onTapDown;
  final ValueChanged<TapUpDetails>? onTapUp;
  final VoidCallback? onTapCancel;
  final ValueChanged<LongPressStartDetails>? onLongPressStart;
  final VoidCallback? onLongPressCancel;
  final VoidCallback? onLongPressUp;
  final ValueChanged<LongPressDownDetails>? onLongPressDown;
  final ValueChanged<LongPressEndDetails>? onLongPressEnd;
  final VoidCallback? onDoubleTap;
  final ValueChanged<TapDownDetails>? onDoubleTapDown;
  final ValueChanged<TapDownDetails>? onSecondaryTapDown;
  final ValueChanged<TapUpDetails>? onSecondaryTapUp;
  final VoidCallback? onSecondaryTapCancel;
  final VoidCallback? onDoubleTapCancel;
  final Duration? longPressDuration;
  final TextDirection? textDirection;
  final ValueChanged<bool>? onFocusChange;
  final bool? expands;
  final TextStyle? textStyle;
  final bool? canRequestFocus;
  final double? gap;

  @override
  State<StatefulWidget> createState() => _ArkButtonState();
}

class _ArkButtonState extends State<ArkButton> {
  ArkStatesController? _statesController;
  FocusNode? _focusNode;

  ArkStatesController get statesController => widget.statesController ?? _statesController!;
  FocusNode get focusNode => widget.focusNode ?? _focusNode!;

  void onFocusChange() {
    _statesController?.update(ArkState.focused, focusNode.hasFocus);
  }

  @override
  void initState() {
    super.initState();
    if(widget.statesController == null) _statesController = ArkStatesController();
    if(widget.focusNode == null) _focusNode = FocusNode();
    _statesController?.update(ArkState.disabled, !widget.enabled);
    focusNode.addListener(onFocusChange);
  }

  @override
  void didUpdateWidget(covariant ArkButton oldWidget) {
    super.didUpdateWidget(oldWidget);
    if(oldWidget.enabled != widget.enabled) statesController.update(ArkState.disabled, !widget.enabled);

    if(oldWidget.focusNode != null && widget.focusNode == null) {
      oldWidget.focusNode!.removeListener(onFocusChange);
      _focusNode?.dispose();
      _focusNode = FocusNode();
      focusNode.addListener(onFocusChange);
    }
  }

  @override
  void dispose() {
    super.dispose();
    _statesController?.dispose();
    focusNode.removeListener(onFocusChange);
    _focusNode?.dispose();
  }

  ArkButtonTheme buttonTheme(ArkThemeData theme) {
    return switch(widget.variant) {
      ArkButtonVariant.primary => theme.primaryButtonTheme,
      ArkButtonVariant.secondary => theme.secondaryButtonTheme,
      ArkButtonVariant.destructive => theme.destructiveButtonTheme,
      ArkButtonVariant.ghost => theme.ghostButtonTheme,
      ArkButtonVariant.outline => theme.outlineButtonTheme,
      ArkButtonVariant.link => theme.linkButtonTheme
    };
  }

  ArkButtonSizeTheme sizeTheme(ArkThemeData theme, ArkButtonSize size) {
    switch(size) {
      case ArkButtonSize.sm:
        return buttonTheme(theme).sizesTheme?.sm ?? theme.buttonSizesTheme.sm!;
      case ArkButtonSize.lg:
        return buttonTheme(theme).sizesTheme?.lg ?? theme.buttonSizesTheme.lg!;
      case ArkButtonSize.regular:
        return buttonTheme(theme).sizesTheme?.regular ?? theme.buttonSizesTheme.regular!;
    }
  }

  EdgeInsetsGeometry defaultPaddingForSize(ArkThemeData theme, ArkButtonSize size) {
    return sizeTheme(theme, size).padding;
  }

  EdgeInsetsGeometry padding(ArkThemeData theme) {
    if (widget.padding != null) return widget.padding!;
    if (widget.size != null) {
      return defaultPaddingForSize(theme, widget.size!);
    }
    return defaultPaddingForSize(
      theme,
      buttonTheme(theme).size ?? ArkButtonSize.regular,
    );
  }

  Color? background(ArkThemeData theme) {
    return widget.backgroundColor ?? buttonTheme(theme).backgroundColor;
  }

  Color? hoverBackground(ArkThemeData theme) {
    return widget.hoverBackgroundColor ?? buttonTheme(theme).hoverBackgroundColor;
  }

  Color foreground(ArkThemeData theme) {
    if(widget.foregroundColor != null) return widget.foregroundColor!;
    return buttonTheme(theme).hoverForegroundColor!;
  }

  Color hoverForeground(ArkThemeData theme) {
    if(widget.hoverForegroundColor != null) return widget.hoverForegroundColor!;
    return buttonTheme(theme).hoverForegroundColor!;
  }

  Color pressedBackgroundColor(ArkThemeData theme) {
    return widget.pressedBackgroundColor ?? buttonTheme(theme).pressedBackgroundColor!;
  }

  Color pressedForegroundColor(ArkThemeData theme) {
    return widget.pressedForegroundColor ?? buttonTheme(theme).pressedForegroundColor!;
  }

  TextDecoration? textDecoration(ArkThemeData theme, { required bool hovered }) {
    if(hovered) return widget.hoverTextDecoration ?? buttonTheme(theme).textDecoration;
    return widget.textDecoration ?? buttonTheme(theme).textDecoration;
  }

  MouseCursor cursor(ArkThemeData theme) {
    if(widget.cursor != null) return widget.cursor!;
    return (widget.enabled ? buttonTheme(theme).cursor ?? SystemMouseCursors.click : MouseCursor.defer);
  }

  Gradient? gradient(ArkThemeData theme) {
    return widget.gradient ?? buttonTheme(theme).gradient;
  }

  List<BoxShadow>? shadows(ArkThemeData theme) {
    return widget.shadows ?? buttonTheme(theme).shadows;
  }

  double defaultHeightForSize(ArkThemeData theme, ArkButtonSize size) {
    return sizeTheme(theme, size).height;
  }

  double height(ArkThemeData theme) {
    if(widget.height != null) return widget.height!;
    if(buttonTheme(theme).height != null) return buttonTheme(theme).height!;
    if(widget.size != null) return defaultHeightForSize(theme, widget.size!);

    return defaultHeightForSize(
        theme,
        buttonTheme(theme).size ?? ArkButtonSize.regular
    );
  }

  double? defaultWidthForSize(ArkThemeData theme, ArkButtonSize size) {
    return sizeTheme(theme, size).width;
  }

  double? width(ArkThemeData theme) {
    if (widget.width != null) return widget.width!;
    if (buttonTheme(theme).width != null) {
      return buttonTheme(theme).width!;
    }
    if (widget.size != null) {
      return defaultWidthForSize(theme, widget.size!);
    }
    return defaultWidthForSize(
      theme,
      buttonTheme(theme).size ?? ArkButtonSize.regular,
    );
  }

  void onTap() {
    if(widget.onPressed == null) return;
    widget.onPressed!();
  }

  @override
  Widget build(BuildContext context) {
    final theme = ArkTheme.of(context);
    final iconTheme = IconTheme.of(context);

    final hasPressedBackgroundColor = widget.pressedBackgroundColor != null ||
    buttonTheme(theme).pressedBackgroundColor != null;
    final hasPressedForegroundColor = widget.pressedForegroundColor != null ||
    buttonTheme(theme).pressedForegroundColor != null;

    final effectiveDecoration = (buttonTheme(theme).decoration ?? const ArkDecoration().merge(
      widget.decoration
    ));
    final effectiveMainAxisAlignment = widget.mainAxisAlignment ?? buttonTheme(theme).mainAxisAlignment ?? MainAxisAlignment.center;
    final effectiveCrossAxisAlignment = widget.crossAxisAlignment ?? buttonTheme(theme).crossAxisAlignment ?? CrossAxisAlignment.center;
    final effectiveLongPressDuration = widget.longPressDuration ?? buttonTheme(theme).longPressDuration;
    final effectiveTextDirection = widget.textDirection ?? buttonTheme(theme).textDirection;
    final effectiveGap = widget.gap ?? buttonTheme(theme).gap ?? 8;
    final effectiveExpands = widget.expands ?? buttonTheme(theme).expands ?? false;
    final effectiveCanRequestFocus = widget.canRequestFocus ?? widget.enabled;
    final effectiveTextStyle = widget.textStyle ?? buttonTheme(theme).textStyle;

    final keyboardTriggers = <ShortcutActivator>[
      const SingleActivator(LogicalKeyboardKey.enter),
      const SingleActivator(LogicalKeyboardKey.space)
    ];

    return CallbackShortcuts(
        bindings: Map.fromIterable(
          keyboardTriggers,
          key: (trigger) => trigger,
          value: (trigger) {
            return () {
              if(!widget.enabled) return;
              onTap();
            };
          },
        ),
        child: ValueListenableBuilder(
            valueListenable: statesController,
            builder: (context, states, _) {
              final pressed = states.contains(ArkState.pressed);
              final hovered = states.contains(ArkState.hovered);
              final enabled = !states.contains(ArkState.disabled);

              final effectiveBackgroundColor = hasPressedBackgroundColor && pressed
                  ? pressedBackgroundColor(theme)
                  : hovered
                  ? hoverBackground(theme)
                  : background(theme);

              final effectiveForegroundColor = hasPressedForegroundColor && pressed
                  ? pressedForegroundColor(theme)
                  : hovered
                  ? hoverForeground(theme)
                  : foreground(theme);

              final updatedDecoration = effectiveDecoration.copyWith(
                color: effectiveBackgroundColor,
                gradient: gradient(theme),
                shadows: shadows(theme),
              );

              final effectiveWidth = width(theme) ?? 0;
              final effectiveHeight = height(theme);

              var child = widget.child;

              if(widget.child != null && effectiveExpands) {
                child = Expanded(child: widget.child!);
              }

              return IconTheme(
                  data: iconTheme.copyWith(color: effectiveForegroundColor),
                  child: DefaultTextStyle(
                      style: effectiveTextStyle!.copyWith(
                        color: effectiveForegroundColor,
                        decoration: textDecoration(theme, hovered: hovered)
                      ),
                      textAlign: TextAlign.center,
                      child: Semantics(
                        container: true,
                        button: true,
                        focusable: enabled,
                        enabled: enabled,
                        child: Opacity(
                            opacity: enabled ? 1 : .5,
                          child: AbsorbPointer(
                            absorbing: !enabled,
                            child: ArkFocusable(
                                canRequestFocus: effectiveCanRequestFocus,
                                autofocus: widget.autoFocus,
                                focusNode: focusNode,
                                onFocusChange: widget.onFocusChange,
                                builder: (context, focused, child) => ArkDecorator(
                                  decoration: updatedDecoration,
                                  focused: focused,
                                  child: child,
                                ),
                                child: ArkGestureDetector(
                                    behavior: HitTestBehavior.opaque,
                                    onHoverChange: (value) {
                                      statesController.update(ArkState.hovered, value);
                                      widget.onHoverChange?.call(value);
                                    },
                                    cursor: cursor(theme),
                                    onLongPress: widget.onLongPress,
                                    onTap: widget.onPressed == null ? null : onTap,

                                    onTapDown: (details) {
                                      statesController.update(ArkState.pressed, true);
                                      widget.onTapDown?.call(details);
                                    },
                                    onTapUp: (details) {
                                      statesController.update(ArkState.pressed, false);
                                      widget.onTapUp?.call(details);
                                    },
                                    onTapCancel: () {
                                      statesController.update(ArkState.pressed, false);
                                      widget.onTapCancel?.call();
                                    },
                                    onSecondaryTapDown: (details) {
                                      widget.onSecondaryTapDown?.call(details);
                                    },
                                    onSecondaryTapUp: (details) {
                                      widget.onSecondaryTapUp?.call(details);
                                    },
                                    onSecondaryTapCancel: () {
                                      widget.onSecondaryTapCancel?.call();
                                    },
                                    onDoubleTap: widget.onDoubleTap,
                                    onDoubleTapDown: widget.onDoubleTapDown,
                                    onDoubleTapCancel: widget.onDoubleTapCancel,
                                    onLongPressCancel: widget.onLongPressCancel,
                                    onLongPressEnd: widget.onLongPressEnd,
                                    onLongPressUp: widget.onLongPressUp,
                                    onLongPressDown: widget.onLongPressDown,
                                    onLongPressStart: widget.onLongPressStart,
                                    longPressDuration: effectiveLongPressDuration,

                                    child: SelectionContainer.disabled(
                                        child: ConstrainedBox(
                                            constraints: BoxConstraints(
                                              minWidth: effectiveWidth,
                                              maxWidth: effectiveWidth != 0 ? effectiveWidth : double.infinity,
                                              minHeight: effectiveHeight,
                                              maxHeight: effectiveHeight != 0 ? effectiveHeight : double.infinity
                                            ),
                                          child: Padding(
                                              padding: padding(theme),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.min,
                                                crossAxisAlignment: effectiveCrossAxisAlignment,
                                                mainAxisAlignment: effectiveMainAxisAlignment,
                                                textDirection: effectiveTextDirection,
                                                children: [
                                                  if (widget.leading != null) widget.leading!,
                                                  if (widget.child != null) child!,
                                                  if (widget.trailing != null) widget.trailing!,
                                                ].separatedBy(SizedBox(width: effectiveGap)),
                                              ),
                                          ),
                                        )
                                    )
                                ),
                            ),
                          ),
                        ),
                      )
                  )
              );
            }
        )
    );
  }
}
