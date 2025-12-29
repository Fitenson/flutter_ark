import 'package:flutter/widgets.dart';

extension ProviderReadExt on BuildContext {
  T read<T>() => ArkProvider.of<T>(this, listen: false);
  T? maybeRead<T>() => ArkProvider.maybeOf<T>(this, listen: false);
}

extension ProviderWatchExt on BuildContext {
  T watch<T>() => ArkProvider.of<T>(this);
  T? maybeWatch<T>() => ArkProvider.maybeOf<T>(this);
}

class ArkProvider<T> extends InheritedWidget {
  const ArkProvider({
    super.key,
    required super.child,
    required this.data,
    this.notifyUpdate,
  });

  /// The data to be provided
  final T data;

  /// Whether to notify the update of the provider, defaults to false
  final bool Function(ArkProvider<T> oldWidget)? notifyUpdate;

  static T of<T>(BuildContext context, {bool listen = true}) {
    final inherited = maybeOf<T>(context, listen: listen);
    if (inherited == null) {
      throw FlutterError(
        'Could not find $T InheritedWidget in the ancestor widget tree.',
      );
    }
    return inherited;
  }

  static T? maybeOf<T>(BuildContext context, {bool listen = true}) {
    if (listen) {
      return context
          .dependOnInheritedWidgetOfExactType<ArkProvider<T>>()
          ?.data;
    }
    final provider = context
        .getElementForInheritedWidgetOfExactType<ArkProvider<T>>()
        ?.widget;
    return (provider as ArkProvider<T>?)?.data;
  }

  @override
  bool updateShouldNotify(covariant ArkProvider<T> oldWidget) {
    return notifyUpdate?.call(oldWidget) ?? false;
  }
}
