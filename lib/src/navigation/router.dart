import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';

typedef RouteBuilder = Widget Function(BuildContext, GoRouterState);

abstract base class ArkRouter {
  void registerRoutes() {}

  static late final GoRouter _router;

  GoRouter get router {
    return _router;
  }

  static final Map<String, RouteBuilder> _routes = {};

  void register(String path, RouteBuilder builder) {
    _routes[path] = builder;
  }

  void init({ String initialRoute = '/' }) {
    final goRoutes = _routes.entries.map((entry) {
      return GoRoute(
          path: entry.key,
          builder: (context, state) => entry.value(context, state)
      );
    }).toList();

    _router = GoRouter(
        initialLocation: initialRoute,
        routes: goRoutes,
        errorBuilder: (context, state) => const SizedBox(
          child: Center(child: Text('Page not found')),
        )
    );
  }

  static void go(BuildContext context, String path, {Object? extra}) {
    context.go(path, extra: extra);
  }

  static void push(BuildContext context, String path, {Object? extra}) {
    context.push(path, extra: extra);
  }
}
