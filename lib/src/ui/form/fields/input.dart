import 'dart:ui' as ui;

import 'package:flutter/gestures.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_ark/src/ui/form/field.dart';
import 'package:flutter_ark/src/ui/input/input.dart';
import 'package:flutter_ark/src/theme/decorator.dart';
import 'package:flutter_ark/src/theme/theme.dart';

class ArkInputFormField extends ArkFormBuilderField<String> {
  ArkInputFormField({
    super.id,
    super.key,
    super.onSaved,
    super.forceErrorText,
    String? Function(String)? validator,
    String? initialValue,
    super.enabled,
    super.autovalidateMode,
    super.restorationId,
    this.controller,
    super.label,
    super.error,
    super.description,
    void Function(String)? onChanged,
    super.valueTransformer,
    super.onReset,
    super.focusNode,

    /// {@macro ArkInput.decoration}
    ArkDecoration? decoration,

    /// {@macro ArkInput.placeholder}
    Widget? placeholder,

    /// {@macro ArkInput.magnifierConfiguration}
    TextMagnifierConfiguration magnifierConfiguration =
        TextMagnifierConfiguration.disabled,

    /// {@macro ArkInput.keyboardType}
    TextInputType? keyboardType,

    /// {@macro ArkInput.textInputAction}
    TextInputAction? textInputAction,

    /// {@macro ArkInput.textCapitalization}
    TextCapitalization textCapitalization = TextCapitalization.none,

    /// {@macro ArkInput.style}
    TextStyle? style,

    /// {@macro ArkInput.strutStyle}
    StrutStyle? strutStyle,

    /// {@macro ArkInput.textAlign}
    TextAlign textAlign = TextAlign.start,

    /// {@macro ArkInput.textDirection}
    TextDirection? textDirection,

    /// {@macro ArkInput.autofocus}
    bool autofocus = false,

    /// {@macro ArkInput.obscuringCharacter}
    String obscuringCharacter = '•',

    /// {@macro ArkInput.obscureText}
    bool obscureText = false,

    /// {@macro ArkInput.autocorrect}
    bool autocorrect = true,

    /// {@macro ArkInput.smartDashesType}
    SmartDashesType? smartDashesType,

    /// {@macro ArkInput.smartQuotesType}
    SmartQuotesType? smartQuotesType,

    /// {@macro ArkInput.enableSuggestions}
    bool enableSuggestions = true,

    /// {@macro ArkInput.maxLines}
    int? maxLines = 1,

    /// {@macro ArkInput.minLines}
    int? minLines,

    /// {@macro ArkInput.expands}
    bool expands = false,

    /// {@macro ArkFormBuilderField.readOnly}
    super.readOnly,

    /// {@macro ArkInput.showCursor}
    bool? showCursor,

    /// {@macro ArkInput.maxLength}
    int? maxLength,

    /// {@macro ArkInput.maxLengthEnforcement}
    MaxLengthEnforcement? maxLengthEnforcement,

    /// {@macro ArkInput.onEditingComplete}
    VoidCallback? onEditingComplete,

    /// {@macro ArkInput.onSubmitted}
    ValueChanged<String>? onSubmitted,

    /// {@macro ArkInput.onAppPrivateCommand}
    AppPrivateCommandCallback? onAppPrivateCommand,

    /// {@macro ArkInput.inputFormatters}
    List<TextInputFormatter>? inputFormatters,

    /// {@macro ArkInput.cursorWidth}
    double? cursorWidth,

    /// {@macro ArkInput.cursorHeight}
    double? cursorHeight,

    /// {@macro ArkInput.cursorRadius}
    Radius? cursorRadius,

    /// {@macro ArkInput.cursorOpacityAnimates}
    bool? cursorOpacityAnimates,

    /// {@macro ArkInput.cursorColor}
    Color? cursorColor,

    /// {@macro ArkInput.selectionHeightStyle}
    ui.BoxHeightStyle selectionHeightStyle = ui.BoxHeightStyle.tight,

    /// {@macro ArkInput.selectionWidthStyle}
    ui.BoxWidthStyle selectionWidthStyle = ui.BoxWidthStyle.tight,

    /// {@macro ArkInput.keyboardAppearance}
    Brightness? keyboardAppearance,

    /// {@macro ArkInput.scrollPadding}
    EdgeInsets scrollPadding = const EdgeInsets.all(20),

    /// {@macro ArkInput.enableInteractiveSelection}
    bool? enableInteractiveSelection,

    /// {@macro ArkInput.selectionControls}
    TextSelectionControls? selectionControls,

    /// {@macro ArkInput.dragStartBehavior}
    DragStartBehavior dragStartBehavior = DragStartBehavior.start,

    /// {@macro ArkInput.onPressed}
    GestureTapCallback? onPressed,

    /// {@macro ArkInput.onPressedAlwaysCalled}
    bool onPressedAlwaysCalled = false,

    /// {@macro ArkInput.onPressedOutside}
    TapRegionCallback? onPressedOutside,

    /// {@macro ArkInput.mouseCursor}
    MouseCursor? mouseCursor,

    /// {@macro ArkInput.scrollPhysics}
    ScrollPhysics? scrollPhysics,

    /// {@macro ArkInput.scrollController}
    ScrollController? scrollController,

    /// {@macro ArkInput.autofillHints}
    Iterable<String>? autofillHints,

    /// {@macro ArkInput.clipBehavior}
    Clip clipBehavior = Clip.hardEdge,

    /// {@macro ArkInput.scribbleEnabled}
    bool scribbleEnabled = true,

    /// {@macro ArkInput.enableIMEPersonalizedLearning}
    bool enableIMEPersonalizedLearning = true,

    /// {@macro ArkInput.contentInsertionConfiguration}
    ContentInsertionConfiguration? contentInsertionConfiguration,

    /// {@macro ArkInput.contextMenuBuilder}
    EditableTextContextMenuBuilder? contextMenuBuilder,

    /// {@macro ArkInput.undoController}
    UndoHistoryController? undoController,

    /// {@macro ArkInput.spellCheckConfiguration}
    SpellCheckConfiguration? spellCheckConfiguration,

    /// {@macro ArkInput.selectionColor}
    Color? selectionColor,

    /// {@macro ArkInput.padding}
    EdgeInsetsGeometry? padding,

    /// {@macro ArkInput.leading}
    Widget? leading,

    /// {@macro ArkInput.trailing}
    Widget? trailing,

    /// {@macro ArkInput.mainAxisAlignment}
    MainAxisAlignment? mainAxisAlignment,

    /// {@macro ArkInput.crossAxisAlignment}
    CrossAxisAlignment? crossAxisAlignment,

    /// {@macro ArkInput.placeholderStyle}
    TextStyle? placeholderStyle,

    /// {@macro ArkInput.alignment}
    AlignmentGeometry? alignment,

    /// {@macro ArkInput.placeholderAlignment}
    AlignmentGeometry? placeholderAlignment,

    /// {@macro ArkInput.inputPadding}
    EdgeInsetsGeometry? inputPadding,

    /// {@macro ArkInput.gap}
    double? gap,

    /// {@macro ArkInput.constraints}
    BoxConstraints? constraints,

    /// {@macro flutter.widgets.editableText.groupId}
    Object? groupId,

    /// {@macro ArkKeyboardToolbar.toolbarBuilder}
    WidgetBuilder? keyboardToolbarBuilder,

    /// {@macro ArkInput.top}
    Widget? top,

    /// {@macro ArkInput.bottom}
    Widget? bottom,

    /// {@macro ArkInput.onLineCountChange}
    ValueChanged<int>? onLineCountChange,

    /// {@macro ArkInput.editableTextSize}
    Size? editableTextSize,
  }) : super(
    initialValue: controller != null ? controller.text : initialValue,
    validator: validator == null ? null : (v) => validator(v ?? ''),
    onChanged: onChanged == null ? null : (v) => onChanged(v ?? ''),
    decorationBuilder: (context) =>
        (ArkTheme.of(context).inputTheme.decoration ??
            const ArkDecoration())
            .merge(decoration),
    builder: (field) {
      final state = field as _ArkFormBuilderInputState;
      return ArkInput(
        key: state.inputKey,
        controller: state.controller,
        restorationId: restorationId,
        enabled: state.enabled,
        focusNode: state.focusNode,
        decoration: state.decoration,
        style: style,
        cursorColor: cursorColor,
        selectionColor: selectionColor,
        keyboardType: keyboardType,
        textInputAction: textInputAction,
        textCapitalization: textCapitalization,
        autofocus: autofocus,
        obscureText: obscureText,
        autocorrect: autocorrect,
        magnifierConfiguration: magnifierConfiguration,
        smartDashesType: smartDashesType,
        smartQuotesType: smartQuotesType,
        enableSuggestions: enableSuggestions,
        maxLines: maxLines,
        minLines: minLines,
        expands: expands,
        onEditingComplete: onEditingComplete,
        onSubmitted: onSubmitted,
        onAppPrivateCommand: onAppPrivateCommand,
        inputFormatters: inputFormatters,
        cursorWidth: cursorWidth,
        cursorHeight: cursorHeight,
        cursorRadius: cursorRadius,
        selectionHeightStyle: selectionHeightStyle,
        selectionWidthStyle: selectionWidthStyle,
        scrollPadding: scrollPadding,
        dragStartBehavior: dragStartBehavior,
        scrollController: scrollController,
        scrollPhysics: scrollPhysics,
        autofillHints: autofillHints,
        clipBehavior: clipBehavior,
        scribbleEnabled: scribbleEnabled,
        enableIMEPersonalizedLearning: enableIMEPersonalizedLearning,
        contentInsertionConfiguration: contentInsertionConfiguration,
        contextMenuBuilder: contextMenuBuilder,
        selectionControls: selectionControls,
        mouseCursor: mouseCursor,
        enableInteractiveSelection: enableInteractiveSelection,
        undoController: undoController,
        spellCheckConfiguration: spellCheckConfiguration,
        placeholder: placeholder,
        onPressed: onPressed,
        onPressedAlwaysCalled: onPressedAlwaysCalled,
        onPressedOutside: onPressedOutside,
        keyboardAppearance: keyboardAppearance,
        cursorOpacityAnimates: cursorOpacityAnimates,
        readOnly: readOnly,
        strutStyle: strutStyle,
        textAlign: textAlign,
        textDirection: textDirection,
        obscuringCharacter: obscuringCharacter,
        showCursor: showCursor,
        maxLength: maxLength,
        maxLengthEnforcement: maxLengthEnforcement,
        padding: padding,
        leading: leading,
        trailing: trailing,
        mainAxisAlignment: mainAxisAlignment,
        crossAxisAlignment: crossAxisAlignment,
        alignment: alignment,
        placeholderStyle: placeholderStyle,
        placeholderAlignment: placeholderAlignment,
        inputPadding: inputPadding,
        gap: gap,
        constraints: constraints,
        groupId: groupId,
        keyboardToolbarBuilder: keyboardToolbarBuilder,
        top: top,
        bottom: bottom,
        onLineCountChange: onLineCountChange,
        editableTextSize: editableTextSize,
      );
    },
  );

  final TextEditingController? controller;

  @override
  ArkFormBuilderFieldState<ArkInputFormField, String> createState() =>
      _ArkFormBuilderInputState();
}

class _ArkFormBuilderInputState
    extends ArkFormBuilderFieldState<ArkInputFormField, String> {
  TextEditingController? _controller;

  TextEditingController get controller => widget.controller ?? _controller!;
  final GlobalKey<ArkInputState> inputKey = GlobalKey<ArkInputState>();

  @override
  void initState() {
    super.initState();
    if (widget.controller == null) {
      _controller = TextEditingController(text: value);
    }
    controller.addListener(onControllerChanged);
  }

  @override
  void didChange(String? value) {
    super.didChange(value);
    if (controller.text != value) {
      controller.text = value ?? '';
    }
  }

  @override
  void didUpdateWidget(covariant ArkInputFormField oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.controller == null && widget.controller != null) {
      _controller?.dispose();
    }
    if (oldWidget.controller != null && widget.controller == null) {
      _controller = TextEditingController(text: value);
    }
  }

  @override
  void reset() {
    super.reset();
    controller.text = initialValue ?? '';
    widget.onChanged?.call(controller.text);
  }

  @override
  void dispose() {
    controller.removeListener(onControllerChanged);
    _controller?.dispose();
    super.dispose();
  }

  void onControllerChanged() {
    if (controller.text != value) {
      didChange(controller.text);
    }
  }
}
