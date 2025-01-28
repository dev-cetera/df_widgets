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

part of 'blurry_container.dart';

// ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░

/// Generated class for [_BlurryContainerProperties].
class BlurryContainerProperties extends _BlurryContainerProperties {
  //
  //
  //

  /// No description provided.
  final double? width;

  /// No description provided.
  final double? height;

  /// No description provided.
  final BlurryOverlayContainerProperties? containerProperties;

  /// No description provided.
  final BoxDecoration? decoration;

  /// No description provided.
  final BoxDecoration? foregroundDecoration;

  /// No description provided.
  final EdgeInsets? padding;

  /// No description provided.
  final BoxConstraints? constraints;

  /// No description provided.
  final BorderRadius? borderRadius;

  /// Constructs a new instance of [BlurryContainerProperties]
  /// from optional and required parameters.
  const BlurryContainerProperties({
    this.width,
    this.height,
    required this.containerProperties,
    required this.decoration,
    required this.foregroundDecoration,
    required this.padding,
    required this.constraints,
    required this.borderRadius,
  });

  /// Creates a copy of this instance, replacing the specified fields.
  BlurryContainerProperties copyWith({
    double? width,
    double? height,
    BlurryOverlayContainerProperties? containerProperties,
    BoxDecoration? decoration,
    BoxDecoration? foregroundDecoration,
    EdgeInsets? padding,
    BoxConstraints? constraints,
    BorderRadius? borderRadius,
  }) {
    return BlurryContainerProperties(
      width: width ?? this.width,
      height: height ?? this.height,
      containerProperties: containerProperties ?? this.containerProperties,
      decoration: decoration ?? this.decoration,
      foregroundDecoration: foregroundDecoration ?? this.foregroundDecoration,
      padding: padding ?? this.padding,
      constraints: constraints ?? this.constraints,
      borderRadius: borderRadius ?? this.borderRadius,
    );
  }

  /// Creates a copy of this instance, removing the specified fields.
  BlurryContainerProperties copyWithout({
    bool width = true,
    bool height = true,
    bool containerProperties = true,
    bool decoration = true,
    bool foregroundDecoration = true,
    bool padding = true,
    bool constraints = true,
    bool borderRadius = true,
  }) {
    return BlurryContainerProperties(
      width: width ? this.width : null,
      height: height ? this.height : null,
      containerProperties:
          containerProperties ? this.containerProperties : null,
      decoration: decoration ? this.decoration : null,
      foregroundDecoration:
          foregroundDecoration ? this.foregroundDecoration : null,
      padding: padding ? this.padding : null,
      constraints: constraints ? this.constraints : null,
      borderRadius: borderRadius ? this.borderRadius : null,
    );
  }

  /// Returns the value of the [width] field.
  /// If the field is nullable, the return value may be null; otherwise, it
  /// will always return a non-null value.
  @pragma('vm:prefer-inline')
  double? get width$ => width;

  /// Returns the value of the [height] field.
  /// If the field is nullable, the return value may be null; otherwise, it
  /// will always return a non-null value.
  @pragma('vm:prefer-inline')
  double? get height$ => height;

  /// Returns the value of the [containerProperties] field.
  /// If the field is nullable, the return value may be null; otherwise, it
  /// will always return a non-null value.
  @pragma('vm:prefer-inline')
  BlurryOverlayContainerProperties get containerProperties$ =>
      containerProperties!;

  /// Returns the value of the [decoration] field.
  /// If the field is nullable, the return value may be null; otherwise, it
  /// will always return a non-null value.
  @pragma('vm:prefer-inline')
  BoxDecoration get decoration$ => decoration!;

  /// Returns the value of the [foregroundDecoration] field.
  /// If the field is nullable, the return value may be null; otherwise, it
  /// will always return a non-null value.
  @pragma('vm:prefer-inline')
  BoxDecoration get foregroundDecoration$ => foregroundDecoration!;

  /// Returns the value of the [padding] field.
  /// If the field is nullable, the return value may be null; otherwise, it
  /// will always return a non-null value.
  @pragma('vm:prefer-inline')
  EdgeInsets get padding$ => padding!;

  /// Returns the value of the [constraints] field.
  /// If the field is nullable, the return value may be null; otherwise, it
  /// will always return a non-null value.
  @pragma('vm:prefer-inline')
  BoxConstraints get constraints$ => constraints!;

  /// Returns the value of the [borderRadius] field.
  /// If the field is nullable, the return value may be null; otherwise, it
  /// will always return a non-null value.
  @pragma('vm:prefer-inline')
  BorderRadius get borderRadius$ => borderRadius!;
}
