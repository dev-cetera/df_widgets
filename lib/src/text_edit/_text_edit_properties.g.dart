//.title
// ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓
//
// GENERATED - DO NOT MODIFY BY HAND
// See: https://github.com/robmllze/df_generate_dart_models
//
// ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓
//.title~

// ignore_for_file: annotate_overrides
// ignore_for_file: overridden_fields

part of 'text_edit.dart';

// ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░

/// Generated class for [_TextEditProperties].
class TextEditProperties extends _TextEditProperties {
  //
  //
  //

  /// No description provided.
  final TextEditingController? controller;

  /// No description provided.
  final FocusNode? focusNode;

  /// No description provided.
  final TextStyle? style;

  /// No description provided.
  final Color? cursorColor;

  /// No description provided.
  final Color? backgroundCursorColor;

  /// Constructs a new instance of [TextEditProperties]
  /// from optional and required parameters.
  const TextEditProperties({
    required this.controller,
    required this.focusNode,
    required this.style,
    required this.cursorColor,
    required this.backgroundCursorColor,
  });

  /// Creates a copy of this instance, replacing the specified fields.
  TextEditProperties copyWith({
    TextEditingController? controller,
    FocusNode? focusNode,
    TextStyle? style,
    Color? cursorColor,
    Color? backgroundCursorColor,
  }) {
    return TextEditProperties(
      controller: controller ?? this.controller,
      focusNode: focusNode ?? this.focusNode,
      style: style ?? this.style,
      cursorColor: cursorColor ?? this.cursorColor,
      backgroundCursorColor:
          backgroundCursorColor ?? this.backgroundCursorColor,
    );
  }

  /// Creates a copy of this instance, removing the specified fields.
  TextEditProperties copyWithout({
    bool controller = true,
    bool focusNode = true,
    bool style = true,
    bool cursorColor = true,
    bool backgroundCursorColor = true,
  }) {
    return TextEditProperties(
      controller: controller ? this.controller : null,
      focusNode: focusNode ? this.focusNode : null,
      style: style ? this.style : null,
      cursorColor: cursorColor ? this.cursorColor : null,
      backgroundCursorColor:
          backgroundCursorColor ? this.backgroundCursorColor : null,
    );
  }

  /// Returns the value of the [controller] field.
  /// If the field is nullable, the return value may be null; otherwise, it
  /// will always return a non-null value.
  @pragma('vm:prefer-inline')
  TextEditingController get controller$ => controller!;

  /// Returns the value of the [focusNode] field.
  /// If the field is nullable, the return value may be null; otherwise, it
  /// will always return a non-null value.
  @pragma('vm:prefer-inline')
  FocusNode get focusNode$ => focusNode!;

  /// Returns the value of the [style] field.
  /// If the field is nullable, the return value may be null; otherwise, it
  /// will always return a non-null value.
  @pragma('vm:prefer-inline')
  TextStyle get style$ => style!;

  /// Returns the value of the [cursorColor] field.
  /// If the field is nullable, the return value may be null; otherwise, it
  /// will always return a non-null value.
  @pragma('vm:prefer-inline')
  Color get cursorColor$ => cursorColor!;

  /// Returns the value of the [backgroundCursorColor] field.
  /// If the field is nullable, the return value may be null; otherwise, it
  /// will always return a non-null value.
  @pragma('vm:prefer-inline')
  Color get backgroundCursorColor$ => backgroundCursorColor!;
}
