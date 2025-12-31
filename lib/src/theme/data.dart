import 'package:flutter/widgets.dart';
import 'package:flutter_ark/src/theme/default_keyboard_toolbar.dart';
import 'package:flutter_ark/src/theme/text_theme/theme.dart';
import 'package:flutter_ark/src/ui/card/theme/card.theme.dart';
import 'package:flutter_ark/src/ui/input/theme/input.theme.dart';
import 'package:flutter_ark/src/ui/sonner/theme/sonner.theme.dart';
import 'package:flutter_ark/src/ui/toast/theme/toast.theme.dart';
import 'package:theme_extensions_builder_annotation/theme_extensions_builder_annotation.dart';

import 'package:flutter_ark/src/theme/themes/base.dart';
import 'package:flutter_ark/src/theme/color_theme/color_scheme.dart';
import 'package:flutter_ark/src/theme/color_theme/slate.dart';
import 'package:flutter_ark/src/theme/decorator.dart';
import 'package:flutter_ark/src/theme/themes/default_theme_no_secondary_border_variant.dart';
import 'package:flutter_ark/src/theme/themes/default_theme_variant.dart';
import 'package:flutter_ark/src/ui/button/button_sizes.dart';
import 'package:flutter_ark/src/ui/button/theme/button.theme.dart';
import 'package:flutter_ark/src/utils/gesture_detector.dart';
import 'package:flutter_ark/src/utils/responsive.dart';

part 'data.g.theme.dart';

@immutable
@ThemeGen()
final class ArkThemeData extends ArkBaseTheme with _$ArkThemeData {
  factory ArkThemeData({
    ArkColorScheme? colorScheme,
    Brightness? brightness,
    ArkButtonTheme? primaryButtonTheme,
    ArkButtonTheme? secondaryButtonTheme,
    ArkButtonTheme? destructiveButtonTheme,
    ArkButtonTheme? outlineButtonTheme,
    ArkButtonTheme? ghostButtonTheme,
    ArkButtonTheme? linkButtonTheme,
    ArkToastTheme? primaryToastTheme,
    ArkToastTheme? destructiveToastTheme,
    ArkSonnerTheme? sonnerTheme,
    ArkTextTheme? textTheme,
    ArkCardTheme? cardTheme,
    ArkInputTheme? inputTheme,
    ArkButtonSizesTheme? buttonSizesTheme,
    ArkHoverStrategies? hoverStrategies,
    ArkBreakpoints? breakpoints,
    BorderRadius? radius,
    ArkDecoration? decoration,
    double? disabledOpacity,
    ArkThemeVariant? variant,
    bool? disableSecondaryBorder,
    ArkDefaultKeyboardToolbarTheme? defaultKeyboardToolbarTheme
  }) {
    final effectiveRadius = radius ?? const BorderRadius.all(Radius.circular(6));
    final effectiveDisableSecondaryBorder = disableSecondaryBorder ?? false;
    final effectiveBrightness = brightness ?? Brightness.light;
    final effectiveColorScheme = colorScheme ?? switch(effectiveBrightness) {
      Brightness.light => const ArkSlateColorScheme.light(),
      Brightness.dark => const ArkSlateColorScheme.dark()
    };
    final effectiveTextTheme = ArkDefaultThemeVariant.defaultTextTheme.merge(textTheme);

    final effectiveVariant = variant ?? switch(effectiveDisableSecondaryBorder) {
      false => ArkDefaultThemeVariant(
        colorScheme: effectiveColorScheme,
        radius: effectiveRadius,
        effectiveTextTheme: effectiveTextTheme
      ),
      true => ArkDefaultThemeNoSecondaryBorderVariant(
        colorScheme: effectiveColorScheme,
        radius: effectiveRadius,
        effectiveTextTheme: effectiveTextTheme
      )
    };

    return ArkThemeData._internal(
        colorScheme: effectiveColorScheme,
        brightness: effectiveBrightness,
        primaryButtonTheme: effectiveVariant.primaryButtonTheme().merge(primaryButtonTheme),
        secondaryButtonTheme: effectiveVariant.secondaryButtonTheme().merge(secondaryButtonTheme),
        destructiveButtonTheme: effectiveVariant.destructiveButtonTheme().merge(destructiveButtonTheme),
        outlineButtonTheme: effectiveVariant.outlineButtonTheme().merge(outlineButtonTheme),
        ghostButtonTheme: effectiveVariant.ghostButtonTheme().merge(ghostButtonTheme),
        primaryToastTheme: effectiveVariant.primaryToastTheme().merge(primaryToastTheme),
        destructiveToastTheme: effectiveVariant.destructiveToastTheme().merge(destructiveToastTheme),
        linkButtonTheme: effectiveVariant.linkButtonTheme().merge(linkButtonTheme),
        sonnerTheme: effectiveVariant.sonnerTheme().merge(sonnerTheme),
        cardTheme: effectiveVariant.cardTheme().merge(cardTheme),
        inputTheme: effectiveVariant.inputTheme().merge(inputTheme),
        hoverStrategies: hoverStrategies ?? effectiveVariant.hoverStrategies(),
        textTheme: effectiveTextTheme,
        radius: effectiveRadius,
        breakpoints: breakpoints ?? ArkBreakpoints(),
        buttonSizesTheme: effectiveVariant.buttonSizesTheme(),
        decoration: effectiveVariant.decorationTheme().merge(decoration),
        disabledOpacity: disabledOpacity ?? .5,
        disableSecondaryBorder: effectiveDisableSecondaryBorder,
        defaultKeyboardToolbarTheme: effectiveVariant.defaultKeyboardToolbarTheme().merge(
            defaultKeyboardToolbarTheme
        )
    );
  }

  const ArkThemeData._internal({
    required super.colorScheme,
    required super.decoration,
    required super.brightness,
    required super.primaryButtonTheme,
    required super.secondaryButtonTheme,
    required super.destructiveButtonTheme,
    required super.outlineButtonTheme,
    required super.ghostButtonTheme,
    required super.linkButtonTheme,
    required super.primaryToastTheme,
    required super.destructiveToastTheme,
    required super.sonnerTheme,
    required super.cardTheme,
    required super.textTheme,
    required super.inputTheme,
    required super.buttonSizesTheme,
    required super.hoverStrategies,
    required super.breakpoints,
    required super.radius,
    required super.disabledOpacity,
    required super.disableSecondaryBorder,
    required super.defaultKeyboardToolbarTheme
  });

  static ArkThemeData? lerp(
      ArkThemeData? a,
      ArkThemeData? b,
      double t
  ) => _$ArkThemeData.lerp(a, b, t);
}
