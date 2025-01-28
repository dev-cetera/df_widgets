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

part of 'tag.dart';

// ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░

/// Generated class for [_TagProperties].
class TagProperties extends _TagProperties {
  //
  //
  //

  /// No description provided.
  final Color? backgroundColor;

  /// No description provided.
  final TextStyle? textStyle;

  /// No description provided.
  final EdgeInsets? padding;

  /// No description provided.
  final EdgeInsets? margin;

  /// No description provided.
  final BorderRadius? borderRadius;

  /// Constructs a new instance of [TagProperties]
  /// from optional and required parameters.
  const TagProperties({
    required this.backgroundColor,
    required this.textStyle,
    required this.padding,
    required this.margin,
    required this.borderRadius,
  });

  /// Creates a copy of this instance, replacing the specified fields.
  TagProperties copyWith({
    Color? backgroundColor,
    TextStyle? textStyle,
    EdgeInsets? padding,
    EdgeInsets? margin,
    BorderRadius? borderRadius,
  }) {
    return TagProperties(
      backgroundColor: backgroundColor ?? this.backgroundColor,
      textStyle: textStyle ?? this.textStyle,
      padding: padding ?? this.padding,
      margin: margin ?? this.margin,
      borderRadius: borderRadius ?? this.borderRadius,
    );
  }

  /// Creates a copy of this instance, removing the specified fields.
  TagProperties copyWithout({
    bool backgroundColor = true,
    bool textStyle = true,
    bool padding = true,
    bool margin = true,
    bool borderRadius = true,
  }) {
    return TagProperties(
      backgroundColor: backgroundColor ? this.backgroundColor : null,
      textStyle: textStyle ? this.textStyle : null,
      padding: padding ? this.padding : null,
      margin: margin ? this.margin : null,
      borderRadius: borderRadius ? this.borderRadius : null,
    );
  }

  /// Returns the value of the [backgroundColor] field.
  /// If the field is nullable, the return value may be null; otherwise, it
  /// will always return a non-null value.
  @pragma('vm:prefer-inline')
  Color get backgroundColor$ => backgroundColor!;

  /// Returns the value of the [textStyle] field.
  /// If the field is nullable, the return value may be null; otherwise, it
  /// will always return a non-null value.
  @pragma('vm:prefer-inline')
  TextStyle get textStyle$ => textStyle!;

  /// Returns the value of the [padding] field.
  /// If the field is nullable, the return value may be null; otherwise, it
  /// will always return a non-null value.
  @pragma('vm:prefer-inline')
  EdgeInsets get padding$ => padding!;

  /// Returns the value of the [margin] field.
  /// If the field is nullable, the return value may be null; otherwise, it
  /// will always return a non-null value.
  @pragma('vm:prefer-inline')
  EdgeInsets get margin$ => margin!;

  /// Returns the value of the [borderRadius] field.
  /// If the field is nullable, the return value may be null; otherwise, it
  /// will always return a non-null value.
  @pragma('vm:prefer-inline')
  BorderRadius get borderRadius$ => borderRadius!;
}
