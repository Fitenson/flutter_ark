// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_element

part of 'card.theme.dart';

// **************************************************************************
// ThemeGenGenerator
// **************************************************************************

mixin _$ArkCardTheme {
  bool get canMerge => true;

  static ArkCardTheme? lerp(ArkCardTheme? a, ArkCardTheme? b, double t) {
    if (identical(a, b)) {
      return a;
    }

    if (a == null) {
      return t == 1.0 ? b : null;
    }

    if (b == null) {
      return t == 0.0 ? a : null;
    }

    return ArkCardTheme(
      padding: EdgeInsetsGeometry.lerp(a.padding, b.padding, t),
      backgroundColor: Color.lerp(a.backgroundColor, b.backgroundColor, t),
      radius: BorderRadius.lerp(a.radius, b.radius, t),
      border: ArkBorder.lerp(a.border, b.border, t),
      shadows: t < 0.5 ? a.shadows : b.shadows,
      width: lerpDouble$(a.width, b.width, t),
      height: lerpDouble$(a.height, b.height, t),
      rowMainAxisAlignment: t < 0.5
          ? a.rowMainAxisAlignment
          : b.rowMainAxisAlignment,
      rowCrossAxisAlignment: t < 0.5
          ? a.rowCrossAxisAlignment
          : b.rowCrossAxisAlignment,
      columnMainAxisAlignment: t < 0.5
          ? a.columnMainAxisAlignment
          : b.columnMainAxisAlignment,
      columnCrossAxisAlignment: t < 0.5
          ? a.columnCrossAxisAlignment
          : b.columnCrossAxisAlignment,
      rowMainAxisSize: t < 0.5 ? a.rowMainAxisSize : b.rowMainAxisSize,
      columnMainAxisSize: t < 0.5 ? a.columnMainAxisSize : b.columnMainAxisSize,
      clipBehavior: t < 0.5 ? a.clipBehavior : b.clipBehavior,
    );
  }

  ArkCardTheme copyWith({
    EdgeInsetsGeometry? padding,
    Color? backgroundColor,
    BorderRadius? radius,
    ArkBorder? border,
    List<BoxShadow>? shadows,
    double? width,
    double? height,
    MainAxisAlignment? rowMainAxisAlignment,
    CrossAxisAlignment? rowCrossAxisAlignment,
    MainAxisAlignment? columnMainAxisAlignment,
    CrossAxisAlignment? columnCrossAxisAlignment,
    MainAxisSize? rowMainAxisSize,
    MainAxisSize? columnMainAxisSize,
    Clip? clipBehavior,
  }) {
    final _this = (this as ArkCardTheme);

    return ArkCardTheme(
      padding: padding ?? _this.padding,
      backgroundColor: backgroundColor ?? _this.backgroundColor,
      radius: radius ?? _this.radius,
      border: border ?? _this.border,
      shadows: shadows ?? _this.shadows,
      width: width ?? _this.width,
      height: height ?? _this.height,
      rowMainAxisAlignment: rowMainAxisAlignment ?? _this.rowMainAxisAlignment,
      rowCrossAxisAlignment:
      rowCrossAxisAlignment ?? _this.rowCrossAxisAlignment,
      columnMainAxisAlignment:
      columnMainAxisAlignment ?? _this.columnMainAxisAlignment,
      columnCrossAxisAlignment:
      columnCrossAxisAlignment ?? _this.columnCrossAxisAlignment,
      rowMainAxisSize: rowMainAxisSize ?? _this.rowMainAxisSize,
      columnMainAxisSize: columnMainAxisSize ?? _this.columnMainAxisSize,
      clipBehavior: clipBehavior ?? _this.clipBehavior,
    );
  }

  ArkCardTheme merge(ArkCardTheme? other) {
    final _this = (this as ArkCardTheme);

    if (other == null || identical(_this, other)) {
      return _this;
    }

    if (!other.canMerge) {
      return other;
    }

    return copyWith(
      padding: other.padding,
      backgroundColor: other.backgroundColor,
      radius: other.radius,
      border: _this.border?.merge(other.border) ?? other.border,
      shadows: other.shadows,
      width: other.width,
      height: other.height,
      rowMainAxisAlignment: other.rowMainAxisAlignment,
      rowCrossAxisAlignment: other.rowCrossAxisAlignment,
      columnMainAxisAlignment: other.columnMainAxisAlignment,
      columnCrossAxisAlignment: other.columnCrossAxisAlignment,
      rowMainAxisSize: other.rowMainAxisSize,
      columnMainAxisSize: other.columnMainAxisSize,
      clipBehavior: other.clipBehavior,
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

    final _this = (this as ArkCardTheme);
    final _other = (other as ArkCardTheme);

    return _other.padding == _this.padding &&
        _other.backgroundColor == _this.backgroundColor &&
        _other.radius == _this.radius &&
        _other.border == _this.border &&
        _other.shadows == _this.shadows &&
        _other.width == _this.width &&
        _other.height == _this.height &&
        _other.rowMainAxisAlignment == _this.rowMainAxisAlignment &&
        _other.rowCrossAxisAlignment == _this.rowCrossAxisAlignment &&
        _other.columnMainAxisAlignment == _this.columnMainAxisAlignment &&
        _other.columnCrossAxisAlignment == _this.columnCrossAxisAlignment &&
        _other.rowMainAxisSize == _this.rowMainAxisSize &&
        _other.columnMainAxisSize == _this.columnMainAxisSize &&
        _other.clipBehavior == _this.clipBehavior;
  }

  @override
  int get hashCode {
    final _this = (this as ArkCardTheme);

    return Object.hash(
      runtimeType,
      _this.padding,
      _this.backgroundColor,
      _this.radius,
      _this.border,
      _this.shadows,
      _this.width,
      _this.height,
      _this.rowMainAxisAlignment,
      _this.rowCrossAxisAlignment,
      _this.columnMainAxisAlignment,
      _this.columnCrossAxisAlignment,
      _this.rowMainAxisSize,
      _this.columnMainAxisSize,
      _this.clipBehavior,
    );
  }
}
