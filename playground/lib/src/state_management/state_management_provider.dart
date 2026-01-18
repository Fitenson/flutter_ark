import 'package:flutter_ark/flutter_ark.dart';
import 'package:playground/src/state_management/provider_page.dart';

final class StateManagementProvider extends ArkRouter {
  @override
  void registerRoutes() {
    register('/state-management/provider', (context, state) => ProviderPage());
  }
}
