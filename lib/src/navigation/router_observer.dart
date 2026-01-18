import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final class ArkRouterObserver extends NavigatorObserver {
  final Ref ref;

  ArkRouterObserver(this.ref);

  @override
  void didPush(Route<dynamic> route, Route<dynamic>? previousRoute) {
    super.didPush(route, previousRoute);
  }

  @override
  void didPop(Route<dynamic> route, Route<dynamic>? previousRoute) {
    if(previousRoute != null) {
      _updateActivePath(previousRoute);
    }
  }

  @override
  void didReplace({Route<dynamic>? newRoute, Route<dynamic>? oldRoute}) {
    if(newRoute != null) {
      _updateActivePath(newRoute);
    }
  }

  void _updateActivePath(Route<dynamic> route) {
    final settings = route.settings;
    if(settings.name != null) {
      ref.read(activePathProvider.notifier).state = settings.name!;
    }
  }
}

final activePathProvider = StateProvider<String>((ref) => '/');
