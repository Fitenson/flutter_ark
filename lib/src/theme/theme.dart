import 'package:flutter/widgets.dart';
import 'package:flutter_ark/src/theme/data.dart';

final class ArkTheme extends StatelessWidget {
  const ArkTheme({
    super.key,
    required this.data,
    required this.child,
  });

  final ArkThemeData data;
  final Widget child;

  static ArkThemeData of(BuildContext context, {bool listen = true}) {
    final provider = maybeOf(context, listen: listen);
    if (provider == null) {
      throw FlutterError(
        '''
        ArkTheme.of() called with a context that does not contain a ArkTheme.\n
        No ArkTheme ancestor could be found starting from the context that was passed to ArkTheme.of(). 
        This can happen because you do not have a ArkApp widget (which introduces a ArkTheme), 
        or it can happen if the context you use comes from a widget above this widget.\n
        The context used was: $context''',
      );
    }
    return provider;
  }

  static Widget merge({
    Key? key,
    ArkThemeData? data,
    required Widget child,
  }) {
    return Builder(
      builder: (BuildContext context) {
        final parent = ArkTheme.of(context);
        return ArkTheme(data: parent.merge(data), child: child);
      },
    );
  }

  static ArkThemeData? maybeOf(
      BuildContext context, {
        bool listen = true,
      }) {
    if (listen) {
      return context
          .dependOnInheritedWidgetOfExactType<ArkInheritedTheme>()
          ?.theme
          .data;
    }
    final provider = context
        .getElementForInheritedWidgetOfExactType<ArkInheritedTheme>()
        ?.widget;

    return (provider as ArkInheritedTheme?)?.theme.data;
  }

  @override
  Widget build(BuildContext context) {
    return ArkInheritedTheme(
      theme: this,
      child: child,
    );
  }
}

class ArkInheritedTheme extends InheritedTheme {
  const ArkInheritedTheme({
    super.key,
    required this.theme,
    required super.child,
  });

  final ArkTheme theme;

  @override
  Widget wrap(BuildContext context, Widget child) {
    return ArkTheme(data: theme.data, child: child);
  }

  @override
  bool updateShouldNotify(ArkInheritedTheme oldWidget) =>
      theme.data != oldWidget.theme.data;
}

class ArkThemeDataTween extends Tween<ArkThemeData> {
  ArkThemeDataTween({ super.begin, super.end });

  @override
  ArkThemeData lerp(double t) => ArkThemeData.lerp(begin, end, t)!;
}

class ArkAnimatedTheme extends ImplicitlyAnimatedWidget {
  const ArkAnimatedTheme({
    super.key,
    required this.data,
    required this.child,
    super.curve,
    super.duration = const Duration(milliseconds: 200),
    super.onEnd,
  });

  final ArkThemeData data;
  final Widget child;

  @override
  AnimatedWidgetBaseState<ArkAnimatedTheme> createState() =>
      _ArkAnimatedThemeState();
}

class _ArkAnimatedThemeState
    extends AnimatedWidgetBaseState<ArkAnimatedTheme> {
  ArkThemeDataTween? _data;

  @override
  void forEachTween(TweenVisitor<dynamic> visitor) {
    _data =
    visitor(
      _data,
      widget.data,
          (dynamic value) =>
          ArkThemeDataTween(begin: value as ArkThemeData),
    )!
    as ArkThemeDataTween;
  }

  @override
  Widget build(BuildContext context) {
    return ArkTheme(
      data: _data!.evaluate(animation),
      child: widget.child,
    );
  }
}
