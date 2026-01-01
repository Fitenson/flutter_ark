import 'package:flutter/widgets.dart';
import 'package:flutter_ark/src/ui/form/field.dart';

enum ArkAutovalidateMode {
  disabled,
  always,
  onUserInteraction,
  alwaysAfterFirstValidation
}

typedef ArkFormFields = Map<
    String,
    ArkFormBuilderFieldState<ArkFormBuilderField<dynamic>, dynamic>
>;

final class ArkForm extends StatefulWidget {
  const ArkForm({
    super.key,
    this.onChanged,
    this.onPopInvokedWithResult,
    this.autovalidateMode = ArkAutovalidateMode.alwaysAfterFirstValidation,
    required this.child,
    this.initialValue = const {},
    this.enabled = true,
    this.skipDisabled = false,
    this.clearValueOnRegister = false,
  });

  final VoidCallback? onChanged;
  final PopInvokedWithResultCallback<Object?>? onPopInvokedWithResult;
  final ArkAutovalidateMode autovalidateMode;
  final Widget child;
  final Map<String, dynamic> initialValue;
  final bool enabled;
  final bool skipDisabled;
  final bool clearValueOnRegister;

  @override
  State<StatefulWidget> createState() => ArkFormState();

  static ArkFormState of(BuildContext context) {
    final state = maybeOf(context);
    return state!;
  }

  static ArkFormState? maybeOf(BuildContext context) {
    return (context.getElementForInheritedWidgetOfExactType<ArkFormScope>() as ArkFormScope?)?._formState;
  }
}

final class ArkFormState extends State<ArkForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final ArkFormFields _fields = {};
  final Map<String, dynamic> _values = {};
  final Map<String, Function> _transformers = {};
  late final ValueNotifier<AutovalidateMode> autovalidateMode;

  ArkFormFields get fields => _fields;

  Map<String, dynamic> get initialValues => widget.initialValue;

  bool get enabled => widget.enabled;

  Map<String, dynamic> get values => Map<String, dynamic>.unmodifiable(
    _values.map((key, values) => MapEntry(key, _transformers[key]?.call(values) ?? values))
  );

  @override
  void initState() {
    super.initState();
    final mode = switch(widget.autovalidateMode) {
      ArkAutovalidateMode.always => AutovalidateMode.always,
      ArkAutovalidateMode.onUserInteraction => AutovalidateMode.onUserInteraction,
      ArkAutovalidateMode.alwaysAfterFirstValidation || ArkAutovalidateMode.disabled
      => AutovalidateMode.disabled
    };
    autovalidateMode = ValueNotifier(mode);
  }

  @override
  void dispose() {
    super.dispose();
    autovalidateMode.dispose();
  }

  void registerField(
      String id,
      ArkFormBuilderFieldState<ArkFormBuilderField<dynamic>, dynamic> field
  ) {
    _fields[id] = field;
    _values[id] = field.initialValue ?? initialValues[id];
    field..registerTransformer(_transformers)
    ..setValue(_values[id]);
  }


  void unregisterField(
      String id,
      ArkFormBuilderFieldState<ArkFormBuilderField<dynamic>, dynamic> field
  ) {
    _fields.remove(id);
    _transformers.remove(id);
    if(widget.clearValueOnRegister) {
      removeFieldValue(id);
    }
  }


  void setFieldValue<T>(String id, T? value, {bool notifyField = true}) {
    _values[id] = value;
    if(notifyField) _fields[id]?.didChange(value);
  }


  void removeFieldValue(String id, {bool notifyField = false}) {
    _values.remove(id);
    if (notifyField) {
      final field = _fields[id];
      if (field != null) field.didChange(null);
    }
  }


  void setValue(
      Map<String, dynamic> value, {
        bool notifyFields = true,
        bool removeMissing = false,
        bool notifyRemovedFields = false
      }
  ) {
    if(removeMissing) {
      final keysToRemove = _values.keys
          .where((key) => !value.containsKey(key))
          .toList();

      for(final id in keysToRemove) {
        removeFieldValue(id, notifyField: notifyRemovedFields);
      }
    }

    for(final entry in value.entries) {
      final field = _fields[entry.key];
      final oldValue = _values[entry.key];
      _values[entry.key] = entry.value;
      if(notifyFields && field != null && oldValue != entry.value) {
        field.didChange(entry.value);
      }
    }
  }


  void setFieldError(String id, String? error) {
    final field = _fields[id];
    if(field == null) {
      throw FlutterError('Field with id: "$id" not  found. Make sure the field is registered with the form.');
    }
    field.setError(error);
  }


  bool validate({
    bool focusOnInvalid = true,
    bool autoScrollWhenFocusOnInvalid = false
  }) {
    if(widget.autovalidateMode == ArkAutovalidateMode.alwaysAfterFirstValidation) {
      autovalidateMode.value = AutovalidateMode.always;
    }

    final hasError = !_formKey.currentState!.validate();
    if(hasError) {
      final wrongFields = _fields.values
          .where((element) => element.hasError)
          .toList();

      if(wrongFields.isNotEmpty) {
        if(focusOnInvalid) wrongFields.first.focus();
        if(autoScrollWhenFocusOnInvalid) wrongFields.first.ensureVisible();
      }
    }
    return !hasError;
  }


  void save() {
    _formKey.currentState?.reset();
  }


  bool saveAndValidate({
    bool focusOnInvalid = true,
    bool autoScrollWhenFocusOnInvalid = false,
  }) {
    save();
    return validate(
      focusOnInvalid: focusOnInvalid,
      autoScrollWhenFocusOnInvalid: autoScrollWhenFocusOnInvalid
    );
  }


  void reset() {
    autovalidateMode.value = switch(widget.autovalidateMode) {
      ArkAutovalidateMode.always => AutovalidateMode.always,
      ArkAutovalidateMode.onUserInteraction => AutovalidateMode.onUserInteraction,
      ArkAutovalidateMode.alwaysAfterFirstValidation || ArkAutovalidateMode.disabled
      => AutovalidateMode.disabled
    };
    _formKey.currentState?.reset();
  }


  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
        valueListenable: autovalidateMode,
        builder: (context, mode, child) {
          return Form(
            key: _formKey,
            autovalidateMode: mode,
            onPopInvokedWithResult: widget.onPopInvokedWithResult,
            onChanged: widget.onChanged,
            child: child!,
          );
        },
        child: ArkFormScope(
            formState: this,
            child: FocusTraversalGroup(
                policy: WidgetOrderTraversalPolicy(),
                child: widget.child
            ),
        ),
    );
  }
}


final class ArkFormScope extends InheritedWidget {
  const ArkFormScope({
    super.key,
    required super.child,
    required ArkFormState formState,
  }) : _formState = formState;

  final ArkFormState _formState;

  ArkForm get form => _formState.widget;

  @override
  bool updateShouldNotify(ArkFormScope oldWidget) => oldWidget._formState != _formState;
}
