import 'package:flutter/widgets.dart';

@immutable
final class ArkPosition {
  const ArkPosition({
    this.top,
    this.left,
    this.right,
    this.bottom,
  });

  factory ArkPosition.directional({
    double? top,
    double? bottom,
    double? start,
    double? end,
    required TextDirection textDirection,
  }) {
    final (double? left, double? right) = switch (textDirection) {
      TextDirection.rtl => (end, start),
      TextDirection.ltr => (start, end),
    };
    return ArkPosition(
      top: top,
      bottom: bottom,
      left: left,
      right: right,
    );
  }

  final double? top;
  final double? left;
  final double? right;
  final double? bottom;

  ArkPosition copyWith({
    double? top,
    double? left,
    double? right,
    double? bottom,
  }) {
    return ArkPosition(
      top: top ?? this.top,
      left: left ?? this.left,
      right: right ?? this.right,
      bottom: bottom ?? this.bottom,
    );
  }

  static ArkPosition? lerp(
      ArkPosition? a,
      ArkPosition? b,
      double t,
      ) {
    if (identical(a, b)) return a;
    return ArkPosition(
      top: b?.top,
      left: b?.left,
      right: b?.right,
      bottom: b?.bottom,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ArkPosition &&
        other.top == top &&
        other.left == left &&
        other.right == right &&
        other.bottom == bottom;
  }

  @override
  String toString() {
    return 'ArkPosition(top: $top, left: $left, '
        'right: $right, bottom: $bottom)';
  }

  @override
  int get hashCode => Object.hashAll([top, left, right, bottom]);
}

extension PositionedExt on Widget {
  Widget positionedWith(ArkPosition position) {
    return Positioned(
      top: position.top,
      left: position.left,
      right: position.right,
      bottom: position.bottom,
      child: this,
    );
  }
}
