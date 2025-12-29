import 'package:flutter/widgets.dart';
import 'package:flutter_ark/src/theme/color_theme/color_scheme.dart';
import 'package:flutter_ark/src/theme/decorator.dart';
import 'package:flutter_ark/src/theme/text_theme/theme.dart';
import 'package:flutter_ark/src/ui/button/button_sizes.dart';
import 'package:flutter_ark/src/ui/button/theme/button.theme.dart';
import 'package:flutter_ark/src/ui/card/theme/card.theme.dart';
import 'package:flutter_ark/src/ui/sonner/theme/sonner.theme.dart';
import 'package:flutter_ark/src/ui/toast/theme/toast.theme.dart';
import 'package:flutter_ark/src/utils/gesture_detector.dart';
import 'package:flutter_ark/src/utils/responsive.dart';

@immutable
abstract base class ArkBaseTheme {
  const ArkBaseTheme({
    required this.colorScheme,
    required this.decoration,
    required this.brightness,
    required this.primaryButtonTheme,
    required this.secondaryButtonTheme,
    required this.destructiveButtonTheme,
    required this.ghostButtonTheme,
    required this.outlineButtonTheme,
    required this.primaryToastTheme,
    required this.destructiveToastTheme,
    required this.sonnerTheme,
    required this.cardTheme,
    required this.textTheme,
    required this.linkButtonTheme,
    required this.buttonSizesTheme,
    required this.hoverStrategies,
    required this.breakpoints,
    required this.radius,
    required this.disabledOpacity,
    required this.disableSecondaryBorder
  });

  final ArkColorScheme colorScheme;
  final ArkDecoration decoration;
  final Brightness brightness;
  final ArkButtonTheme primaryButtonTheme;
  final ArkButtonTheme secondaryButtonTheme;
  final ArkButtonTheme destructiveButtonTheme;
  final ArkButtonTheme outlineButtonTheme;
  final ArkButtonTheme ghostButtonTheme;
  final ArkButtonTheme linkButtonTheme;
  final ArkToastTheme primaryToastTheme;
  final ArkToastTheme destructiveToastTheme;
  final ArkSonnerTheme sonnerTheme;
  final ArkCardTheme cardTheme;
  final ArkTextTheme textTheme;
  final ArkButtonSizesTheme buttonSizesTheme;
  final ArkHoverStrategies hoverStrategies;
  final ArkBreakpoints breakpoints;
  final BorderRadius radius;
  final double disabledOpacity;
  final bool disableSecondaryBorder;
}

@immutable
abstract class ArkThemeVariant {
  ArkButtonTheme primaryButtonTheme();
  ArkButtonTheme secondaryButtonTheme();
  ArkButtonTheme destructiveButtonTheme();
  ArkButtonTheme outlineButtonTheme();
  ArkButtonTheme ghostButtonTheme();
  ArkButtonTheme linkButtonTheme();
  ArkTextTheme textTheme();
  ArkDecoration decorationTheme();
  ArkToastTheme primaryToastTheme();
  ArkToastTheme destructiveToastTheme();
  ArkSonnerTheme sonnerTheme();
  ArkCardTheme cardTheme();
  ArkHoverStrategies hoverStrategies();
  ArkButtonSizesTheme buttonSizesTheme();
}
