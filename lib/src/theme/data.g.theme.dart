part of 'data.dart';

mixin _$ArkThemeData {
  bool get canMerge => true;

  static ArkThemeData? lerp(ArkThemeData? a, ArkThemeData? b, double t) {
    if(identical(a, b)) return a;
    if(a == null) return t == 1.0 ? b : null;
    if(b == null) return t == 0.0 ? a : null;

    return ArkThemeData(
      colorScheme: ArkColorScheme.lerp(a.colorScheme, b.colorScheme, t),
      brightness: t < 0.5 ? a.brightness : b.brightness,
      primaryButtonTheme: ArkButtonTheme.lerp(a.primaryButtonTheme, b.primaryButtonTheme, t),
      secondaryButtonTheme: ArkButtonTheme.lerp(a.secondaryButtonTheme, b.secondaryButtonTheme, t),
      destructiveButtonTheme: ArkButtonTheme.lerp(a.destructiveButtonTheme, b.destructiveButtonTheme, t),
      outlineButtonTheme: ArkButtonTheme.lerp(a.outlineButtonTheme, b.outlineButtonTheme, t),
      ghostButtonTheme: ArkButtonTheme.lerp(a.ghostButtonTheme, b.ghostButtonTheme, t),
      linkButtonTheme: ArkButtonTheme.lerp(a.linkButtonTheme, b.linkButtonTheme, t),
      primaryToastTheme: ArkToastTheme.lerp(a.primaryToastTheme, b.primaryToastTheme, t),
      destructiveToastTheme: ArkToastTheme.lerp(a.destructiveToastTheme, b.destructiveToastTheme, t),
      cardTheme: ArkCardTheme.lerp(a.cardTheme, b.cardTheme, t),
      radius: BorderRadius.lerp(a.radius, b.radius, t),
      buttonSizesTheme: ArkButtonSizesTheme.lerp(a.buttonSizesTheme, b.buttonSizesTheme, t),
      decoration: ArkDecoration.lerp(a.decoration, b.decoration, t),
      disabledOpacity: lerpDouble$(a.disabledOpacity, b.disabledOpacity, t),
      textTheme: ArkTextTheme.lerp(a.textTheme, b.textTheme, t),
      disableSecondaryBorder: t < 0.5 ? a.disableSecondaryBorder : b.disableSecondaryBorder,
      breakpoints: ArkBreakpoints.lerp(a.breakpoints, b.breakpoints, t),
      sonnerTheme: ArkSonnerTheme.lerp(a.sonnerTheme, b.sonnerTheme, t),
      hoverStrategies: t < 0.5 ? a.hoverStrategies : b.hoverStrategies,
      defaultKeyboardToolbarTheme: ArkDefaultKeyboardToolbarTheme.lerp(
          a.defaultKeyboardToolbarTheme,
          b.defaultKeyboardToolbarTheme,
          t
      )
    );
  }

  ArkThemeData copyWith({
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
    BorderRadius? radius,
    ArkHoverStrategies? hoverStrategies,
    double? disabledOpacity,
    bool? disableSecondaryBorder,
    ArkBreakpoints? breakpoints,
    ArkDecoration? decoration,
    ArkTextTheme? textTheme,
    ArkSonnerTheme? sonnerTheme,
    ArkCardTheme? cardTheme,
    ArkDefaultKeyboardToolbarTheme? defaultKeyboardToolbarTheme
}) {
    final _this = (this as ArkThemeData);

    return ArkThemeData(
      colorScheme: colorScheme ?? _this.colorScheme,
      brightness: brightness ?? _this.brightness,
      primaryButtonTheme: primaryButtonTheme ?? _this.primaryButtonTheme,
      secondaryButtonTheme: secondaryButtonTheme ?? _this.secondaryButtonTheme,
      destructiveButtonTheme: destructiveButtonTheme ?? _this.destructiveButtonTheme,
      outlineButtonTheme: outlineButtonTheme ?? _this.outlineButtonTheme,
      ghostButtonTheme: ghostButtonTheme ?? _this.ghostButtonTheme,
      linkButtonTheme: linkButtonTheme ?? _this.linkButtonTheme,
      primaryToastTheme: primaryToastTheme ?? _this.primaryToastTheme,
      destructiveToastTheme: destructiveToastTheme ?? _this.destructiveToastTheme,
      cardTheme: cardTheme ?? _this.cardTheme,
      radius: radius ?? _this.radius,
      disabledOpacity: disabledOpacity ?? _this.disabledOpacity,
      hoverStrategies: hoverStrategies ?? _this.hoverStrategies,
      disableSecondaryBorder: disableSecondaryBorder ?? _this.disableSecondaryBorder,
      defaultKeyboardToolbarTheme: defaultKeyboardToolbarTheme ?? _this.defaultKeyboardToolbarTheme,
    );
  }

  ArkThemeData merge(ArkThemeData? other) {
    final _this = (this as ArkThemeData);
    if(other == null || identical(_this, other)) return _this;
    if(!other.canMerge) return other;

    return copyWith(
        colorScheme: other.colorScheme,
        brightness: other.brightness,
        primaryButtonTheme: _this.primaryButtonTheme.merge(other.primaryButtonTheme),
        secondaryButtonTheme: _this.secondaryButtonTheme.merge(other.secondaryButtonTheme),
        destructiveButtonTheme: _this.destructiveButtonTheme.merge(other.destructiveButtonTheme),
        outlineButtonTheme: _this.outlineButtonTheme.merge(other.outlineButtonTheme),
        ghostButtonTheme: _this.ghostButtonTheme.merge(other.ghostButtonTheme),
        linkButtonTheme: _this.linkButtonTheme.merge(other.linkButtonTheme),
        primaryToastTheme: _this.primaryToastTheme.merge(other.primaryToastTheme),
        destructiveToastTheme: _this.destructiveToastTheme.merge(other.destructiveToastTheme),
        radius: other.radius,
        disabledOpacity: other.disabledOpacity,
        textTheme: _this.textTheme.merge(other.textTheme),
        sonnerTheme: _this.sonnerTheme.merge(other.sonnerTheme),
        hoverStrategies: other.hoverStrategies,
        decoration: _this.decoration.merge(other.decoration),
        breakpoints: other.breakpoints,
        disableSecondaryBorder: other.disableSecondaryBorder,
        cardTheme: _this.cardTheme.merge(other.cardTheme),
        defaultKeyboardToolbarTheme: _this.defaultKeyboardToolbarTheme.merge(other.defaultKeyboardToolbarTheme)
    );
  }
}
