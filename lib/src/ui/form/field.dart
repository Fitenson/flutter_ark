import 'package:flutter/widgets.dart';
import 'package:flutter_ark/src/ui/form/form.dart';
import 'package:flutter_ark/src/theme/decorator.dart';
import 'package:flutter_ark/src/ui/input/theme/input_decorator.dart';

/// A function that transforms the value of a form field into a different
/// format.
///
/// Takes a value of type [T] and returns a transformed value of any type.
/// Used to convert field values before saving or processing
typedef ValueTransformer<T> = dynamic Function(T value);

/// A customizable form field widget with built-in decoration and state
/// management.
///
/// The [ArkFormBuilderField] extends [FormField] to provide a styled input
/// field with a label, error display, and description, integrated with
/// `ArkTheme` via [ArkInputDecorator]. It supports validation, focus
/// management, and value transformation, designed for use within a [ArkForm].
@immutable
class ArkFormBuilderField<T> extends FormField<T> {
  /// Creates a form field widget with a custom builder and optional properties.
  ArkFormBuilderField({
    super.key,
    required Widget Function(FormFieldState<T>) builder,
    super.onSaved,
    super.validator,
    super.initialValue,
    super.enabled,
    super.autovalidateMode,
    super.restorationId,
    this.readOnly = false,
    this.id,
    this.focusNode,
    this.label,
    this.error,
    this.description,
    this.onChanged,
    this.valueTransformer,
    this.onReset,
    this.decorationBuilder,
    super.forceErrorText,
  }) : super(
    builder: (field) {
      final state =
      field as ArkFormBuilderFieldState<ArkFormBuilderField<T>, T>;
      final hasError = field.hasError;

      final effectiveError = hasError
          ? error?.call(field.errorText!) ?? Text(field.errorText!)
          : null;

      return ArkInputDecorator(
        label: label,
        error: effectiveError,
        description: description,
        decoration: state.decoration,
        child: builder(field),
      );
    },
    onReset: onReset,
  );

  /// {@template ArkFormBuilderField.id}
  /// An optional identifier used to reference the field within a [ArkForm].
  /// Enables form data retrieval or field manipulation post-submission.
  /// {@endtemplate}
  final String? id;

  /// {@template ArkFormBuilderField.focusNode}
  /// The focus node for keyboard navigation and focus handling.
  /// If null, an internal focus node is created by the state.
  /// {@endtemplate}
  final FocusNode? focusNode;

  /// {@template ArkFormBuilderField.label}
  /// The label widget displayed above the field.
  /// Typically a [Text] widget, providing context for the field’s purpose.
  /// {@endtemplate}
  final Widget? label;

  /// {@template ArkFormBuilderField.error}
  /// A function that returns a custom error widget based on the error text.
  /// Called when validation fails; defaults to a [Text] widget if null.
  /// {@endtemplate}
  final Widget Function(String error)? error;

  /// {@template ArkFormBuilderField.description}
  /// The description widget displayed below the field.
  /// Typically a [Text] widget, offering additional field information.
  /// {@endtemplate}
  final Widget? description;

  /// {@template ArkFormBuilderField.onChanged}
  /// Callback invoked when the field’s value changes.
  /// Provides the new value, complementing form state updates.
  /// {@endtemplate}
  final ValueChanged<T?>? onChanged;

  /// {@template ArkFormBuilderField.valueTransformer}
  /// A function to transform the field’s value before saving or processing.
  /// Useful for formatting or converting data; defaults to null
  /// (no transformation).
  /// {@endtemplate}
  final ValueTransformer<T?>? valueTransformer;

  /// {@template ArkFormBuilderField.onReset}
  /// Callback invoked when the field is reset to its initial value.
  /// Allows additional reset logic; defaults to null.
  /// {@endtemplate}
  @override
  // ignore: overridden_fields
  final VoidCallback? onReset;

  /// {@template ArkFormBuilderField.decorationBuilder}
  /// A function that builds a custom [ArkDecoration] for the field.
  /// Overrides the default decoration; merged with error state if provided.
  /// {@endtemplate}
  final ArkDecoration? Function(BuildContext context)? decorationBuilder;

  /// {@template ArkFormBuilderField.readOnly}
  /// Whether the field is read-only.
  /// Defaults to false; if true, prevents editing but allows focus.
  /// {@endtemplate}
  final bool readOnly;

  @override
  ArkFormBuilderFieldState<ArkFormBuilderField<T>, T> createState() =>
      ArkFormBuilderFieldState<ArkFormBuilderField<T>, T>();
}

/// The state class for [ArkFormBuilderField], managing field state and form
/// integration.
///
/// Extends [FormFieldState] to handle value changes, focus, and form
/// registration.
/// Provides methods for focusing, ensuring visibility, and updating the parent
/// form.
class ArkFormBuilderFieldState<F extends ArkFormBuilderField<T>, T>
    extends FormFieldState<T> {
  FocusNode? _focusNode;
  ArkFormState? _parentForm;

  /// The effective focus node, either provided or internally managed.
  FocusNode get focusNode => widget.focusNode ?? _focusNode!;

  /// The decoration applied to the field, reflecting error state.
  ArkDecoration get decoration =>
      (widget.decorationBuilder?.call(context) ?? const ArkDecoration())
          .copyWith(hasError: hasError);

  String? _forceErrorText;

  String? get forceErrorText => widget.forceErrorText ?? _forceErrorText;

  @override
  String? get errorText => forceErrorText ?? super.errorText;

  @override
  bool get hasError => forceErrorText != null || super.hasError;

  /// Sets an internal error message that overrides validation errors.
  void setError(String? error) {
    setState(() {
      _forceErrorText = error;
    });
  }

  @override
  F get widget => super.widget as F;

  /// The initial value of the field, sourced from widget or parent form.
  T? get initialValue =>
      widget.initialValue ??
          (_parentForm?.widget.initialValue[widget.id] as T?);

  /// Whether the field is enabled, factoring in parent form state.
  bool get enabled => widget.enabled && (_parentForm?.enabled ?? true);

  @override
  void initState() {
    super.initState();
    if (widget.focusNode == null) {
      _focusNode = FocusNode(canRequestFocus: !widget.readOnly);
    }
    // Register this field when there is a parent ArkForm
    _parentForm = ArkForm.maybeOf(context);
    if (widget.id != null) _parentForm?.registerField(widget.id!, this);
  }

  @override
  void didUpdateWidget(covariant ArkFormBuilderField<T> oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.id != oldWidget.id) {
      if (oldWidget.id != null) {
        _parentForm?.unregisterField(oldWidget.id!, this);
      }
      if (widget.id != null) _parentForm?.registerField(widget.id!, this);
    }

    if (oldWidget.focusNode != null && widget.focusNode == null) {
      _focusNode ??= FocusNode(canRequestFocus: !widget.readOnly);
    }

    if (widget.readOnly != oldWidget.readOnly) {
      _focusNode?.canRequestFocus = !widget.readOnly;
    }
  }

  @override
  void didChange(T? value) {
    super.didChange(value);
    _informFormForFieldChange();
    widget.onChanged?.call(value);
  }

  @override
  void reset() {
    super.reset();
    didChange(initialValue);
    widget.onReset?.call();
  }

  @override
  void dispose() {
    if (widget.id != null) _parentForm?.unregisterField(widget.id!, this);
    _focusNode?.dispose();
    super.dispose();
  }

  /// Requests focus for the field's focus node.
  void focus() {
    FocusScope.of(context).requestFocus(focusNode);
  }

  /// Ensures the field is visible by scrolling if necessary.
  void ensureVisible() {
    Scrollable.ensureVisible(context);
  }

  @override
  void setValue(T? value, {bool populateForm = true}) {
    super.setValue(value);
    if (populateForm) {
      _informFormForFieldChange();
    }
  }

  void _informFormForFieldChange() {
    if (_parentForm != null) {
      if (enabled) {
        if (widget.id != null) {
          _parentForm!.setFieldValue<T>(widget.id!, value, notifyField: false);
        }
        return;
      }
      if (widget.id != null) _parentForm!.removeFieldValue(widget.id!);
    }
  }

  /// Registers the field’s value transformer with the provided map.
  void registerTransformer(Map<String, Function> map) {
    if (widget.id == null) return;
    final fun = widget.valueTransformer;
    if (fun != null) {
      map[widget.id!] = fun;
    }
  }
}
