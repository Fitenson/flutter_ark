import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_ark/src/theme/theme.dart';

/// {@template ArkKeyboardToolbar}
/// Renders a toolbar above the keyboard fully customizable.
/// {@endtemplate}
class ArkKeyboardToolbar extends StatefulWidget {
  /// {@macro ArkKeyboardToolbar}
  const ArkKeyboardToolbar({
    super.key,
    this.toolbarBuilder,
    required this.child,
    required this.focusNode,
    this.hideThreshold,
  });

  /// {@template ArkKeyboardToolbar.child}
  /// The child widget that will trigger the keyboard toolbar, typically and
  /// input field.
  /// {@endtemplate}
  final Widget child;

  /// {@template ArkKeyboardToolbar.toolbarBuilder}
  /// A builder function that returns the toolbar widget.
  /// {@endtemplate}
  final WidgetBuilder? toolbarBuilder;

  /// {@template ArkKeyboardToolbar.focusNode}
  /// The focus node of the child widget that will trigger the keyboard toolbar.
  /// {@endtemplate}
  final FocusNode focusNode;

  /// {@template ArkKeyboardToolbar.hideThreshold}
  /// The threshold in pixels for hiding the toolbar when the keyboard is
  /// dismissed. Defaults to 20 pixels.
  /// {@endtemplate}
  final double? hideThreshold;

  @override
  State<ArkKeyboardToolbar> createState() => _ArkKeyboardToolbarState();
}

class _ArkKeyboardToolbarState extends State<ArkKeyboardToolbar>
    with WidgetsBindingObserver {
  final controller = OverlayPortalController();
  final keyboardHeight = ValueNotifier<double>(0);

  @override
  void initState() {
    super.initState();
    if (keyboardSupported) {
      WidgetsBinding.instance.addObserver(this);
    }
  }

  @override
  void dispose() {
    if (keyboardSupported) {
      WidgetsBinding.instance.removeObserver(this);
    }
    keyboardHeight.dispose();
    super.dispose();
  }

  @override
  void didChangeMetrics() {
    super.didChangeMetrics();
    if (!keyboardSupported) return;
    final bottomInset =
        PlatformDispatcher.instance.implicitView?.viewInsets.bottom ?? 0.0;
    final devicePixelRatio =
        PlatformDispatcher.instance.implicitView?.devicePixelRatio ?? 1.0;

    // Convert from physical pixels to logical pixels
    final logicalBottomInset = bottomInset / devicePixelRatio;
    keyboardHeight.value = logicalBottomInset;
  }

  /// Checks if the current platform supports virtual keyboard.
  bool get keyboardSupported {
    if (widget.toolbarBuilder == null ||
        defaultTargetPlatform != TargetPlatform.iOS &&
            defaultTargetPlatform != TargetPlatform.android) {
      return false;
    }
    return true;
  }

  @override
  Widget build(BuildContext context) {
    if (!keyboardSupported) return widget.child;

    final theme = ArkTheme.of(context);

    final effectiveHideThreshold =
        widget.hideThreshold ??
            theme.defaultKeyboardToolbarTheme.hideThreshold ??
            20.0;

    return ValueListenableBuilder(
      valueListenable: keyboardHeight,
      builder: (context, height, child) {
        return ListenableBuilder(
          listenable: widget.focusNode,
          builder: (context, child) {
            // Shows or hides the toolbar based on the keyboard height and focus
            // state.
            WidgetsBinding.instance.addPostFrameCallback((_) {
              if (!mounted) return;
              if (height > effectiveHideThreshold &&
                  widget.focusNode.hasFocus) {
                controller.show();
              } else {
                controller.hide();
              }
            });
            return OverlayPortal(
              overlayChildBuilder: (context) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    widget.toolbarBuilder!(context),
                    SizedBox(height: height),
                  ],
                );
              },
              controller: controller,
              child: widget.child,
            );
          },
        );
      },
    );
  }
}
