import 'package:flutter_ark/flutter_ark.dart';
import 'package:playground/src/app/app.dart';
import 'package:playground/src/dashboard.dart';

final class AppRouter extends ArkRouter {
  AppRouter() {
    register('/', (context, state) => const App());
    init();
  }
}
