// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_element

part of 'button_sizes.dart';

// **************************************************************************
// ThemeGenGenerator
// **************************************************************************

mixin _$ArkButtonSizeTheme {
  bool get canMerge => true;

  static ArkButtonSizeTheme? lerp(
      ArkButtonSizeTheme? a,
      ArkButtonSizeTheme? b,
      double t,
      ) {
    if (identical(a, b)) {
      return a;
    }

    if (a == null) {
      return t == 1.0 ? b : null;
    }

    if (b == null) {
      return t == 0.0 ? a : null;
    }

    return ArkButtonSizeTheme(
      height: lerpDouble$(a.height, b.height, t)!,
      padding: EdgeInsetsGeometry.lerp(a.padding, b.padding, t)!,
      width: lerpDouble$(a.width, b.width, t),
    );
  }

  ArkButtonSizeTheme copyWith({
    double? height,
    EdgeInsetsGeometry? padding,
    double? width,
  }) {
    final _this = (this as ArkButtonSizeTheme);

    return ArkButtonSizeTheme(
      height: height ?? _this.height,
      padding: padding ?? _this.padding,
      width: width ?? _this.width,
    );
  }

  ArkButtonSizeTheme merge(ArkButtonSizeTheme? other) {
    final _this = (this as ArkButtonSizeTheme);

    if (other == null || identical(_this, other)) {
      return _this;
    }

    if (!other.canMerge) {
      return other;
    }

    return copyWith(
      height: other.height,
      padding: other.padding,
      width: other.width,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }

    if (other.runtimeType != runtimeType) {
      return false;
    }

    final _this = (this as ArkButtonSizeTheme);
    final _other = (other as ArkButtonSizeTheme);

    return _other.height == _this.height &&
        _other.padding == _this.padding &&
        _other.width == _this.width;
  }

  @override
  int get hashCode {
    final _this = (this as ArkButtonSizeTheme);

    return Object.hash(runtimeType, _this.height, _this.padding, _this.width);
  }
}

mixin _$ArkButtonSizesTheme {
  bool get canMerge => true;

  static ArkButtonSizesTheme? lerp(
      ArkButtonSizesTheme? a,
      ArkButtonSizesTheme? b,
      double t,
      ) {
    if (identical(a, b)) {
      return a;
    }

    if (a == null) {
      return t == 1.0 ? b : null;
    }

    if (b == null) {
      return t == 0.0 ? a : null;
    }

    return ArkButtonSizesTheme(
      regular: ArkButtonSizeTheme.lerp(a.regular, b.regular, t),
      sm: ArkButtonSizeTheme.lerp(a.sm, b.sm, t),
      lg: ArkButtonSizeTheme.lerp(a.lg, b.lg, t),
      icon: ArkButtonSizeTheme.lerp(a.icon, b.icon, t),
    );
  }

  ArkButtonSizesTheme copyWith({
    ArkButtonSizeTheme? regular,
    ArkButtonSizeTheme? sm,
    ArkButtonSizeTheme? lg,
    ArkButtonSizeTheme? icon,
  }) {
    final _this = (this as ArkButtonSizesTheme);

    return ArkButtonSizesTheme(
      regular: regular ?? _this.regular,
      sm: sm ?? _this.sm,
      lg: lg ?? _this.lg,
      icon: icon ?? _this.icon,
    );
  }

  ArkButtonSizesTheme merge(ArkButtonSizesTheme? other) {
    final _this = (this as ArkButtonSizesTheme);

    if (other == null || identical(_this, other)) {
      return _this;
    }

    if (!other.canMerge) {
      return other;
    }

    return copyWith(
      regular: _this.regular?.merge(other.regular) ?? other.regular,
      sm: _this.sm?.merge(other.sm) ?? other.sm,
      lg: _this.lg?.merge(other.lg) ?? other.lg,
      icon: _this.icon?.merge(other.icon) ?? other.icon,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }

    if (other.runtimeType != runtimeType) {
      return false;
    }

    final _this = (this as ArkButtonSizesTheme);
    final _other = (other as ArkButtonSizesTheme);

    return _other.regular == _this.regular &&
        _other.sm == _this.sm &&
        _other.lg == _this.lg &&
        _other.icon == _this.icon;
  }

  @override
  int get hashCode {
    final _this = (this as ArkButtonSizesTheme);

    return Object.hash(
      runtimeType,
      _this.regular,
      _this.sm,
      _this.lg,
      _this.icon,
    );
  }
}
