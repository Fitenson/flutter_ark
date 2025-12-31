import 'package:flutter/widgets.dart';
import 'package:theme_extensions_builder_annotation/theme_extensions_builder_annotation.dart';

part 'default_keyboard_toolbar.g.theme.dart';

@themeGen
@immutable
class ArkDefaultKeyboardToolbarTheme with _$ArkDefaultKeyboardToolbarTheme {
  const ArkDefaultKeyboardToolbarTheme({
    bool canMerge = true,
    this.backgroundColor,
    this.doneText,
    this.showPreviousButton,
    this.showNextButton,
    this.showDoneButton,
    this.hideThreshold,
  }) : _canMerge = canMerge;

  @ignore
  final bool _canMerge;

  @override
  bool get canMerge => _canMerge;

  /// {@macro ArkDefaultKeyboardToolbar.backgroundColor}
  final Color? backgroundColor;

  /// {@macro ArkDefaultKeyboardToolbar.doneText}
  final String? doneText;

  /// {@macro ArkDefaultKeyboardToolbar.showPreviousButton}
  final bool? showPreviousButton;

  /// {@macro ArkDefaultKeyboardToolbar.showNextButton}
  final bool? showNextButton;

  /// {@macro ArkDefaultKeyboardToolbar.showDoneButton}
  final bool? showDoneButton;

  /// {@macro ArkKeyboardToolbar.hideThreshold}
  final double? hideThreshold;

  static ArkDefaultKeyboardToolbarTheme? lerp(
      ArkDefaultKeyboardToolbarTheme? a,
      ArkDefaultKeyboardToolbarTheme? b,
      double t,
      ) => _$ArkDefaultKeyboardToolbarTheme.lerp(a, b, t);
}
