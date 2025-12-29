import 'package:flutter/gestures.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_ark/src/theme/text_theme/theme.dart';
import 'package:flutter_ark/src/ui/card/theme/card.theme.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

import 'package:flutter_ark/src/utils/border.dart';
import 'package:flutter_ark/src/utils/gesture_detector.dart';
import 'package:flutter_ark/src/theme/themes/base.dart';
import 'package:flutter_ark/src/theme/color_theme/color_scheme.dart';
import 'package:flutter_ark/src/theme/decorator.dart';
import 'package:flutter_ark/src/theme/themes/shadows.dart';
import 'package:flutter_ark/src/theme/text_theme/text_styles_default.dart';
import 'package:flutter_ark/src/theme/text_theme/theme.dart';

import 'package:flutter_ark/src/ui/button/button_sizes.dart';
import 'package:flutter_ark/src/ui/button/theme/button.theme.dart';
import 'package:flutter_ark/src/ui/toast/theme/toast.theme.dart';
import 'package:flutter_ark/src/ui/sonner/theme/sonner.theme.dart';

class ArkDefaultThemeVariant extends ArkThemeVariant {
  ArkDefaultThemeVariant({
    required this.colorScheme,
    required this.radius,
    required this.effectiveTextTheme
  });

  final ArkColorScheme colorScheme;
  final BorderRadius radius;
  final ArkTextTheme effectiveTextTheme;

  @override
  ArkButtonTheme primaryButtonTheme() {
    return ArkButtonTheme(
      backgroundColor: colorScheme.primary,
      hoverBackgroundColor: colorScheme.primary.withValues(alpha: .9),
      foregroundColor: colorScheme.primaryForeground,
      hoverForegroundColor: colorScheme.primaryForeground,
      decoration: ArkDecoration(
        border: ArkBorder.all(radius: radius, width: 0)
      ),gap: 8,
      expands: false
    );
  }

  @override
  ArkButtonTheme secondaryButtonTheme() {
    return ArkButtonTheme(
      backgroundColor: colorScheme.secondary,
      hoverBackgroundColor: colorScheme.secondary.withValues(alpha: .8),
      foregroundColor: colorScheme.secondaryForeground,
      hoverForegroundColor: colorScheme.secondaryForeground,
      decoration: ArkDecoration(
        border: ArkBorder.all(radius: radius, width: 0),
      ),
      gap: 8,
      expands: false,
    );
  }

  @override
  ArkButtonTheme destructiveButtonTheme() {
    return ArkButtonTheme(
      backgroundColor: colorScheme.destructive,
      hoverBackgroundColor: colorScheme.destructive.withValues(alpha: .9),
      foregroundColor: colorScheme.destructiveForeground,
      hoverForegroundColor: colorScheme.destructiveForeground,
      decoration: ArkDecoration(
        border: ArkBorder.all(radius: radius, width: 0),
      ),
      gap: 8,
      expands: false,
    );
  }

  @override
  ArkButtonTheme outlineButtonTheme() {
    return ArkButtonTheme(
      hoverBackgroundColor: colorScheme.accent,
      foregroundColor: colorScheme.primary,
      hoverForegroundColor: colorScheme.accentForeground,
      decoration: ArkDecoration(
        border: ArkBorder.all(
          radius: radius,
          color: colorScheme.input,
          width: 1,
        ),
      ),
      gap: 8,
      expands: false,
    );
  }

  @override
  ArkButtonTheme ghostButtonTheme() {
    return ArkButtonTheme(
      hoverBackgroundColor: colorScheme.accent,
      foregroundColor: colorScheme.primary,
      hoverForegroundColor: colorScheme.accentForeground,
      decoration: ArkDecoration(
        border: ArkBorder.all(radius: radius, width: 0),
      ),
      gap: 8,
      expands: false,
    );
  }

  @override
  ArkButtonTheme linkButtonTheme() {
    return ArkButtonTheme(
      foregroundColor: colorScheme.primary,
      hoverForegroundColor: colorScheme.primary,
      hoverTextDecoration: TextDecoration.underline,
      gap: 8,
      expands: false,
    );
  }

  @override
  ArkDecoration decorationTheme() {
    return ArkDecoration(
      secondaryBorder: ArkBorder.all(
        width: 0
      ),
      secondaryFocusedBorder: ArkBorder.all(
        width: 2,
        color: colorScheme.ring,
        radius: radius.add(radius / 2),
        offset: 4
      ),
      labelStyle: effectiveTextTheme.muted.copyWith(
        fontWeight: FontWeight.w500,
        color: colorScheme.foreground
      ),
      labelPadding: const EdgeInsets.only(bottom: 8),
      errorStyle: effectiveTextTheme.muted.copyWith(
        fontWeight: FontWeight.w500,
        color: colorScheme.destructive
      ),
      errorPadding: const EdgeInsets.only(top: 8),
      descriptionStyle: effectiveTextTheme.muted,
      descriptionPadding: const EdgeInsets.only(top: 8)
    );
  }

  @override
  ArkButtonSizesTheme buttonSizesTheme() {
    return const ArkButtonSizesTheme(
      regular: ArkButtonSizeTheme(
          height: 40,
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8)
      ),
      sm: ArkButtonSizeTheme(
          height: 36,
          padding: EdgeInsets.symmetric(horizontal: 12)
      ),
      lg: ArkButtonSizeTheme(
          height: 44,
          padding: EdgeInsets.symmetric(horizontal: 32, vertical: 8)
      ),
      icon: ArkButtonSizeTheme(
          height: 40,
          width: 40,
          padding: EdgeInsets.zero
      )
    );
  }

  @override
  ArkHoverStrategies hoverStrategies() {
    return const ArkHoverStrategies(
      hover: {
        ArkHoverStrategy.onTapDown,
        ArkHoverStrategy.onLongPressDown,
        ArkHoverStrategy.onLongPressStart
      },
      unhover: {
        ArkHoverStrategy.onTapUp,
        ArkHoverStrategy.onTapOutside,
        ArkHoverStrategy.onTapCancel,
        ArkHoverStrategy.onLongPressUp,
        ArkHoverStrategy.onLongPressEnd,
        ArkHoverStrategy.onLongPressCancel
      },
      longPressDuration: kLongPressTimeout
    );
  }

  @override
  ArkToastTheme primaryToastTheme() {
    return ArkToastTheme(
      alignment: Alignment.bottomRight,
      closeIconData: LucideIcons.x,
      titleStyle: effectiveTextTheme.muted.copyWith(
        fontWeight: FontWeight.w500,
        color: colorScheme.foreground,
      ),
      descriptionStyle: effectiveTextTheme.muted.copyWith(
        color: colorScheme.foreground.withValues(alpha: .9),
      ),
      actionPadding: const EdgeInsetsDirectional.only(start: 16),
      border: ArkBorder.all(color: colorScheme.border, width: 1),
      shadows: ArkShadows.lg,
      backgroundColor: colorScheme.background,
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      showCloseIconOnlyWhenHovered: true,
      padding: const EdgeInsetsGeometry.fromSTEB(24, 24, 32, 24),
      mainAxisSize: MainAxisSize.max,
    );
  }

  @override
  ArkToastTheme destructiveToastTheme() {
    return ArkToastTheme(
      alignment: Alignment.bottomRight,
      closeIconData: LucideIcons.x,
      titleStyle: effectiveTextTheme.muted.copyWith(
        fontWeight: FontWeight.w500,
        color: colorScheme.destructiveForeground,
      ),
      descriptionStyle: effectiveTextTheme.muted.copyWith(
        color: colorScheme.destructiveForeground.withValues(alpha: .9),
      ),
      actionPadding: const EdgeInsetsDirectional.only(start: 16),
      border: ArkBorder.all(color: colorScheme.border, width: 1),
      shadows: ArkShadows.lg,
      backgroundColor: colorScheme.destructive,
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      showCloseIconOnlyWhenHovered: true,
      padding: const EdgeInsetsDirectional.fromSTEB(24, 24, 32, 24),
      mainAxisSize: MainAxisSize.max,
    );
  }

  @override
  ArkTextTheme textTheme() {
    return effectiveTextTheme;
  }

  static ArkTextTheme get defaultTextTheme {
    return ArkTextTheme.custom(
      h1Large: ArkTextDefaultTheme.h1Large(family: kDefaultFontFamily),
      h1: ArkTextDefaultTheme.h1(family: kDefaultFontFamily),
      h2: ArkTextDefaultTheme.h2(family: kDefaultFontFamily),
      h3: ArkTextDefaultTheme.h3(family: kDefaultFontFamily),
      h4: ArkTextDefaultTheme.h4(family: kDefaultFontFamily),
      p: ArkTextDefaultTheme.p(family: kDefaultFontFamily),
      blockquote: ArkTextDefaultTheme.blockquote(family: kDefaultFontFamily),
      table: ArkTextDefaultTheme.table(family: kDefaultFontFamily),
      list: ArkTextDefaultTheme.list(family: kDefaultFontFamily),
      lead: ArkTextDefaultTheme.lead(family: kDefaultFontFamily),
      large: ArkTextDefaultTheme.large(family: kDefaultFontFamily),
      small: ArkTextDefaultTheme.small(family: kDefaultFontFamily),
      muted: ArkTextDefaultTheme.muted(family: kDefaultFontFamily),
      family: kDefaultFontFamily,
    );
  }

  @override
  ArkSonnerTheme sonnerTheme() {
    return const ArkSonnerTheme(
      alignment: Alignment.bottomRight,
      padding: EdgeInsets.all(16),
      collapsedGap: 16,
      expandedGap: 8,
      scaleFactor: 0.05,
      animationDuration: Duration(milliseconds: 300),
      animationCurve: Cubic(0.215, 0.61, 0.355, 1),
    );
  }

  @override
  ArkCardTheme cardTheme() {
    return ArkCardTheme(
      backgroundColor: colorScheme.card,
      padding: const EdgeInsets.all(24),
      border: ArkBorder.all(color: colorScheme.border, width: 1),
      radius: const BorderRadius.all(Radius.circular(8)),
      shadows: ArkShadows.sm,
      rowMainAxisSize: MainAxisSize.min,
      rowCrossAxisAlignment: CrossAxisAlignment.start,
      rowMainAxisAlignment: MainAxisAlignment.spaceBetween,
      columnMainAxisSize: MainAxisSize.min,
      columnCrossAxisAlignment: CrossAxisAlignment.start,
      columnMainAxisAlignment: MainAxisAlignment.start,
    );
  }
}
