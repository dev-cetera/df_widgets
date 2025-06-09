//.title
// ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓
//
// GENERATED - DO NOT MODIFY BY HAND
// See: https://github.com/dev-cetera/df_generate_dart_models
//
// ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓
//.title~

// ignore_for_file: annotate_overrides
// ignore_for_file: overridden_fields

part of 'btn.dart';

// ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░

/// Generated class for [_BtnProperties].
class BtnProperties extends _BtnProperties {
  //
  //
  //

  /// No description provided.
  final BoxDecoration? decoration;

  /// No description provided.
  final BoxDecoration? disabledDecoration;

  /// No description provided.
  final BoxDecoration? hoverDecoration;

  /// No description provided.
  final TextStyle? textStyle;

  /// No description provided.
  final TextStyle? disabledTextStyle;

  /// No description provided.
  final TextStyle? hoverTextStyle;

  /// No description provided.
  final EdgeInsets? padding;

  /// Constructs a new instance of [BtnProperties]
  /// from optional and required parameters.
  const BtnProperties({
    required this.decoration,
    required this.disabledDecoration,
    required this.hoverDecoration,
    required this.textStyle,
    required this.disabledTextStyle,
    required this.hoverTextStyle,
    required this.padding,
  });

  /// Creates a copy of this instance, replacing the specified fields.
  BtnProperties copyWith({
    BoxDecoration? decoration,
    BoxDecoration? disabledDecoration,
    BoxDecoration? hoverDecoration,
    TextStyle? textStyle,
    TextStyle? disabledTextStyle,
    TextStyle? hoverTextStyle,
    EdgeInsets? padding,
  }) {
    return BtnProperties(
      decoration: decoration ?? this.decoration,
      disabledDecoration: disabledDecoration ?? this.disabledDecoration,
      hoverDecoration: hoverDecoration ?? this.hoverDecoration,
      textStyle: textStyle ?? this.textStyle,
      disabledTextStyle: disabledTextStyle ?? this.disabledTextStyle,
      hoverTextStyle: hoverTextStyle ?? this.hoverTextStyle,
      padding: padding ?? this.padding,
    );
  }

  /// Creates a copy of this instance, removing the specified fields.
  BtnProperties copyWithout({
    bool decoration = true,
    bool disabledDecoration = true,
    bool hoverDecoration = true,
    bool textStyle = true,
    bool disabledTextStyle = true,
    bool hoverTextStyle = true,
    bool padding = true,
  }) {
    return BtnProperties(
      decoration: decoration ? this.decoration : null,
      disabledDecoration: disabledDecoration ? this.disabledDecoration : null,
      hoverDecoration: hoverDecoration ? this.hoverDecoration : null,
      textStyle: textStyle ? this.textStyle : null,
      disabledTextStyle: disabledTextStyle ? this.disabledTextStyle : null,
      hoverTextStyle: hoverTextStyle ? this.hoverTextStyle : null,
      padding: padding ? this.padding : null,
    );
  }

  /// Returns the value of the [decoration] field.
  /// If the field is nullable, the return value may be null; otherwise, it
  /// will always return a non-null value.
  @pragma('vm:prefer-inline')
  BoxDecoration get decoration$ => decoration!;

  /// Returns the value of the [disabledDecoration] field.
  /// If the field is nullable, the return value may be null; otherwise, it
  /// will always return a non-null value.
  @pragma('vm:prefer-inline')
  BoxDecoration get disabledDecoration$ => disabledDecoration!;

  /// Returns the value of the [hoverDecoration] field.
  /// If the field is nullable, the return value may be null; otherwise, it
  /// will always return a non-null value.
  @pragma('vm:prefer-inline')
  BoxDecoration get hoverDecoration$ => hoverDecoration!;

  /// Returns the value of the [textStyle] field.
  /// If the field is nullable, the return value may be null; otherwise, it
  /// will always return a non-null value.
  @pragma('vm:prefer-inline')
  TextStyle get textStyle$ => textStyle!;

  /// Returns the value of the [disabledTextStyle] field.
  /// If the field is nullable, the return value may be null; otherwise, it
  /// will always return a non-null value.
  @pragma('vm:prefer-inline')
  TextStyle get disabledTextStyle$ => disabledTextStyle!;

  /// Returns the value of the [hoverTextStyle] field.
  /// If the field is nullable, the return value may be null; otherwise, it
  /// will always return a non-null value.
  @pragma('vm:prefer-inline')
  TextStyle get hoverTextStyle$ => hoverTextStyle!;

  /// Returns the value of the [padding] field.
  /// If the field is nullable, the return value may be null; otherwise, it
  /// will always return a non-null value.
  @pragma('vm:prefer-inline')
  EdgeInsets get padding$ => padding!;
}
