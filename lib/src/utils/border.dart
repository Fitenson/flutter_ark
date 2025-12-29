import 'dart:ui';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';

extension ArkBorderSideToBorderSide on ArkBorderSide {
  BorderSide toBorderSide() {
    if (width == null || width == 0) return BorderSide.none;
    return BorderSide(
      color: color ?? const Color(0x00000000),
      width: width ?? 1,
      style: style ?? BorderStyle.solid,
      strokeAlign: strokeAlign ?? BorderSide.strokeAlignInside,
    );
  }
}

extension ArkBorderToBorder on ArkBorder {
  Border toBorder() {
    return Border(
      top: top?.toBorderSide() ?? BorderSide.none,
      right: right?.toBorderSide() ?? BorderSide.none,
      bottom: bottom?.toBorderSide() ?? BorderSide.none,
      left: left?.toBorderSide() ?? BorderSide.none,
    );
  }
}

class ArkBorder {
  const ArkBorder({
    this.canMerge = true,
    this.padding,
    this.radius,
    this.top,
    this.right,
    this.bottom,
    this.left,
    this.offset,
  });

  /// Creates a border whose sides are all the same.
  const ArkBorder.fromBorderSide(
      ArkBorderSide side, {
        this.canMerge = true,
        this.padding,
        this.radius,
        this.offset,
      }) : top = side,
        right = side,
        bottom = side,
        left = side;

  const ArkBorder.symmetric({
    ArkBorderSide? vertical,
    ArkBorderSide? horizontal,
    this.canMerge = true,
    this.padding,
    this.radius,
    this.offset,
  }) : left = vertical,
        top = horizontal,
        right = vertical,
        bottom = horizontal;

  factory ArkBorder.all({
    bool canMerge = true,
    Color? color,
    double? width,
    BorderStyle? style,
    double? strokeAlign,
    EdgeInsetsGeometry? padding,
    BorderRadiusGeometry? radius,
    double? offset,
  }) {
    final side = ArkBorderSide(
      color: color,
      width: width,
      style: style,
      strokeAlign: strokeAlign,
    );
    return ArkBorder.fromBorderSide(
      side,
      padding: padding,
      canMerge: canMerge,
      radius: radius,
      offset: offset,
    );
  }

  static ArkBorder? lerp(ArkBorder? a, ArkBorder? b, double t) {
    if (identical(a, b)) return a;
    return ArkBorder(
      canMerge: b?.canMerge ?? a?.canMerge ?? true,
      padding: EdgeInsetsGeometry.lerp(a?.padding, b?.padding, t),
      radius: BorderRadiusGeometry.lerp(a?.radius, b?.radius, t),
      top: ArkBorderSide.lerp(
        a?.top,
        b?.top,
        t,
      ),
      right: ArkBorderSide.lerp(
        a?.right,
        b?.right,
        t,
      ),
      bottom: ArkBorderSide.lerp(
        a?.bottom,
        b?.bottom,
        t,
      ),
      left: ArkBorderSide.lerp(
        a?.left,
        b?.left,
        t,
      ),
      offset: lerpDouble(a?.offset, b?.offset, t),
    );
  }

  bool get hasBorder =>
      (top?.width ?? 0) != 0 ||
          (right?.width ?? 0) != 0 ||
          (bottom?.width ?? 0) != 0 ||
          (left?.width ?? 0) != 0;

  static const ArkBorder none = ArkBorder(canMerge: false);

  ArkBorder merge(ArkBorder? other) {
    if (other == null) return this;
    if (!other.canMerge) return other;
    if (other is ArkRoundedSuperellipseBorder) {
      return ArkRoundedSuperellipseBorder(
        side: switch (this) {
          final ArkRoundedSuperellipseBorder border =>
          border.side?.merge(other.side) ?? other.side,
          _ => other.side,
        },
        radius: other.radius ?? radius,
      );
    }
    return copyWith(
      top: top?.merge(other.top) ?? other.top,
      right: right?.merge(other.right) ?? other.right,
      bottom: bottom?.merge(other.bottom) ?? other.bottom,
      left: left?.merge(other.left) ?? other.left,
      padding: other.padding,
      radius: other.radius,
      offset: other.offset,
    );
  }

  ArkBorder copyWith({
    EdgeInsetsGeometry? padding,
    ArkBorderSide? top,
    ArkBorderSide? right,
    ArkBorderSide? bottom,
    ArkBorderSide? left,
    BorderRadiusGeometry? radius,
    double? offset,
  }) {
    return ArkBorder(
      top: top ?? this.top,
      right: right ?? this.right,
      bottom: bottom ?? this.bottom,
      left: left ?? this.left,
      padding: padding ?? this.padding,
      radius: radius ?? this.radius,
      offset: offset ?? this.offset,
    );
  }

  final bool canMerge;
  final EdgeInsetsGeometry? padding;
  final BorderRadiusGeometry? radius;
  final ArkBorderSide? top;
  final ArkBorderSide? right;
  final ArkBorderSide? bottom;
  final ArkBorderSide? left;
  final double? offset;

  @override
  String toString() {
    return '''ArkBorder(merge: $merge, padding: $padding, radius: $radius, top: $top, right: $right, bottom: $bottom, left: $left, offset: $offset)''';
  }
}

@immutable
class ArkBorderSide with Diagnosticable {
  const ArkBorderSide({
    this.canMerge = true,
    this.color,
    this.width,
    this.style,
    this.strokeAlign,
  }) : assert(width == null || width >= 0.0);

  ArkBorderSide merge(ArkBorderSide? other) {
    if (other == null) return this;
    if (!other.canMerge) return other;
    return copyWith(
      color: other.color,
      width: other.width,
      style: other.style,
      strokeAlign: other.strokeAlign,
    );
  }

  final bool canMerge;
  final Color? color;
  final double? width;
  final BorderStyle? style;
  static const ArkBorderSide none = ArkBorderSide(canMerge: false);
  final double? strokeAlign;

  ArkBorderSide copyWith({
    bool? canMerge,
    Color? color,
    double? width,
    BorderStyle? style,
    double? strokeAlign,
  }) {
    return ArkBorderSide(
      canMerge: canMerge ?? this.canMerge,
      color: color ?? this.color,
      width: width ?? this.width,
      style: style ?? this.style,
      strokeAlign: strokeAlign ?? this.strokeAlign,
    );
  }

  static ArkBorderSide? lerp(ArkBorderSide? a, ArkBorderSide? b, double t) {
    if (identical(a, b)) return a;
    return ArkBorderSide(
      canMerge: b?.canMerge ?? a?.canMerge ?? true,
      color: Color.lerp(a?.color, b?.color, t),
      width: lerpDouble(a?.width, b?.width, t),
      style: t < 0.5 ? a?.style : b?.style,
      strokeAlign: lerpDouble(a?.strokeAlign, b?.strokeAlign, t),
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
    return other is ArkBorderSide &&
        other.merge == merge &&
        other.color == color &&
        other.width == width &&
        other.style == style &&
        other.strokeAlign == strokeAlign;
  }

  @override
  int get hashCode => Object.hash(merge, color, width, style, strokeAlign);

  @override
  String toStringShort() => 'ArkBorderSide';

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(
        DiagnosticsProperty<Color>(
          'color',
          color,
          defaultValue: const Color(0xFF000000),
        ),
      )
      ..add(
        DiagnosticsProperty<bool>(
          'canMerge',
          canMerge,
          defaultValue: true,
        ),
      );

    properties
      ..add(DoubleProperty('width', width, defaultValue: 1.0))
      ..add(
        DoubleProperty(
          'strokeAlign',
          strokeAlign,
          defaultValue: BorderSide.strokeAlignInside,
        ),
      )
      ..add(
        EnumProperty<BorderStyle>(
          'style',
          style,
          defaultValue: BorderStyle.solid,
        ),
      );
  }
}

extension ArkRoundedSuperellipseBorderExt on ArkRoundedSuperellipseBorder {
  ShapeBorder toBorder({
    TextDirection? textDirection,
    BorderRadius defaultRadius = BorderRadius.zero,
  }) {
    final effectiveTextDirection = textDirection ?? TextDirection.ltr;
    return RoundedSuperellipseBorder(
      side: side?.toBorderSide() ?? BorderSide.none,
      borderRadius: radius?.resolve(effectiveTextDirection) ?? defaultRadius,
    );
  }
}

@immutable
class ArkRoundedSuperellipseBorder extends ArkBorder {
  const ArkRoundedSuperellipseBorder({
    super.canMerge,
    this.side,
    super.radius,
  });

  final ArkBorderSide? side;

  @override
  String toString() {
    return '''ArkRoundedSuperellipseBorder(merge: $merge, side: $side, radius: $radius)''';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is ArkRoundedSuperellipseBorder &&
        other.merge == merge &&
        other.side == side &&
        other.radius == radius;
  }

  @override
  int get hashCode => side.hashCode;
}
