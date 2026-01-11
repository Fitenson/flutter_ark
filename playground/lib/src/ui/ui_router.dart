import 'package:flutter_ark/flutter_ark.dart';
import 'package:playground/src/ui/input_page.dart';

final class UiRouter extends ArkRouter {
  @override
  void registerRoutes() {
    register('/ui/input', (context, state) => const InputPage(style: InputStyle.email));
  }
}
