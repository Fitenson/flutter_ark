import 'dart:ui';

import 'package:flutter/widgets.dart';
import 'package:flutter_ark/src/theme/theme.dart';

class ArkBreakpoints {
  ArkBreakpoints({
    double tn = 0,
    double sm = 640,
    double md = 768,
    double lg = 1024,
    double xl = 1280,
    double xxl = 1536,
  }) : tn = ArkBreakpointTN(tn),
        sm = ArkBreakpointSM(sm),
        md = ArkBreakpointMD(md),
        lg = ArkBreakpointLG(lg),
        xl = ArkBreakpointXL(xl),
        xxl = ArkBreakpointXXL(xxl);

  final ArkBreakpoint tn;
  final ArkBreakpoint sm;
  final ArkBreakpoint md;
  final ArkBreakpoint lg;
  final ArkBreakpoint xl;
  final ArkBreakpoint xxl;

  ArkBreakpoint fromWidth(double width) {
    if (width < sm.value) return tn;
    if (width < md.value) return sm;
    if (width < lg.value) return md;
    if (width < xl.value) return lg;
    if (width < xxl.value) return xl;
    return xxl;
  }

  static ArkBreakpoints? lerp(
      ArkBreakpoints? a,
      ArkBreakpoints? b,
      double t,
      ) {
    return ArkBreakpoints(
      tn: ArkBreakpoint.lerp(a!.tn, b!.tn, t),
      sm: ArkBreakpoint.lerp(a.sm, b.sm, t),
      md: ArkBreakpoint.lerp(a.md, b.md, t),
      lg: ArkBreakpoint.lerp(a.lg, b.lg, t),
      xl: ArkBreakpoint.lerp(a.xl, b.xl, t),
      xxl: ArkBreakpoint.lerp(a.xxl, b.xxl, t),
    );
  }
}

sealed class ArkBreakpoint {
  const ArkBreakpoint(this.value);

  final double value;

  bool operator <(ArkBreakpoint other) {
    return value < other.value;
  }

  bool operator >(ArkBreakpoint other) {
    return value > other.value;
  }

  bool operator <=(ArkBreakpoint other) {
    return value <= other.value;
  }

  bool operator >=(ArkBreakpoint other) {
    return value >= other.value;
  }

  static double lerp(ArkBreakpoint a, ArkBreakpoint b, double t) {
    return lerpDouble(a.value, b.value, t)!;
  }
}

class ArkBreakpointTN extends ArkBreakpoint {
  const ArkBreakpointTN(super.value);
}

class ArkBreakpointSM extends ArkBreakpoint {
  const ArkBreakpointSM(super.value);
}

class ArkBreakpointMD extends ArkBreakpoint {
  const ArkBreakpointMD(super.value);
}

class ArkBreakpointLG extends ArkBreakpoint {
  const ArkBreakpointLG(super.value);
}

class ArkBreakpointXL extends ArkBreakpoint {
  const ArkBreakpointXL(super.value);
}

class ArkBreakpointXXL extends ArkBreakpoint {
  const ArkBreakpointXXL(super.value);
}

typedef ResponsiveWidgetBuilder =
Widget Function(
    BuildContext context,
    ArkBreakpoint breakpoint,
    );

class ArkResponsiveBuilder extends StatelessWidget {
  const ArkResponsiveBuilder({
    super.key,
    required this.builder,
  });

  final ResponsiveWidgetBuilder builder;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    final breakpoints = ArkTheme.of(context).breakpoints;
    final breakpoint = breakpoints.fromWidth(width);
    return builder(context, breakpoint);
  }
}
