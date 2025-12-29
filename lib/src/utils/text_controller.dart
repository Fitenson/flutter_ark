import 'package:flutter/widgets.dart';

final class ArkTextEditingController extends TextEditingController {
  ArkTextEditingController({super.text});

  ArkTextEditingController.fromValue(TextEditingValue super.value)
      : super.fromValue();

  TextEditingValue? previousValue;

  @override
  set value(TextEditingValue newValue) {
    if (newValue == value) return;
    previousValue = value;
    super.value = newValue;
  }
}
