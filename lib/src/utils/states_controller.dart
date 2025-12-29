import 'package:flutter/widgets.dart';

enum ArkState {
  focused,
  hovered,
  pressed,
  disabled,
}

final class ArkStatesController extends ValueNotifier<Set<ArkState>> {
  ArkStatesController([Set<ArkState>? value]) : super(<ArkState>{...?value});

  void update(ArkState state, bool add) {
    final valueChanged = add ? value.add(state) : value.remove(state);
    if (valueChanged) {
      notifyListeners();
    }
  }
}
