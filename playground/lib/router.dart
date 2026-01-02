
import 'package:go_router/go_router.dart';
import 'package:playground/src/ui/input_page.dart';

extension on GoRouterState {
  bool? getBoolFromArg(String name) {
    if(uri.queryParameters.containsKey(name)) {
      final arg = uri.queryParameters[name];
      if(arg == 'false' || arg == '0') return false;
      return true;
    }
    return null;
  }
}

final router = GoRouter(
    initialLocation: '/input',
    routes: [
      GoRoute(
          path: '/input',
          builder: (context, state) {
            final style = state.uri.queryParameters['style'] ?? InputStyle.email.name;
            return InputPage(style: InputStyle.values.byName(style));
          } 
      )
    ]
);
