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

part of 'extruded.dart';

// ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░

/// Generated class for [_ExtrudedProperties].
class ExtrudedProperties extends _ExtrudedProperties {
  //
  //
  //

  /// No description provided.
  final bool? showExtrusion;

  /// No description provided.
  final Color? color;

  /// No description provided.
  final double? extrusion;

  /// No description provided.
  final double? angle;

  /// No description provided.
  final ShapeBorder? border;

  /// Constructs a new instance of [ExtrudedProperties]
  /// from optional and required parameters.
  const ExtrudedProperties({
    required this.showExtrusion,
    required this.color,
    this.extrusion,
    required this.angle,
    this.border,
  });

  /// Creates a copy of this instance, replacing the specified fields.
  ExtrudedProperties copyWith({
    bool? showExtrusion,
    Color? color,
    double? extrusion,
    double? angle,
    ShapeBorder? border,
  }) {
    return ExtrudedProperties(
      showExtrusion: showExtrusion ?? this.showExtrusion,
      color: color ?? this.color,
      extrusion: extrusion ?? this.extrusion,
      angle: angle ?? this.angle,
      border: border ?? this.border,
    );
  }

  /// Creates a copy of this instance, removing the specified fields.
  ExtrudedProperties copyWithout({
    bool showExtrusion = true,
    bool color = true,
    bool extrusion = true,
    bool angle = true,
    bool border = true,
  }) {
    return ExtrudedProperties(
      showExtrusion: showExtrusion ? this.showExtrusion : null,
      color: color ? this.color : null,
      extrusion: extrusion ? this.extrusion : null,
      angle: angle ? this.angle : null,
      border: border ? this.border : null,
    );
  }

  /// Returns the value of the [showExtrusion] field.
  /// If the field is nullable, the return value may be null; otherwise, it
  /// will always return a non-null value.
  @pragma('vm:prefer-inline')
  bool get showExtrusion$ => showExtrusion!;

  /// Returns the value of the [color] field.
  /// If the field is nullable, the return value may be null; otherwise, it
  /// will always return a non-null value.
  @pragma('vm:prefer-inline')
  Color get color$ => color!;

  /// Returns the value of the [extrusion] field.
  /// If the field is nullable, the return value may be null; otherwise, it
  /// will always return a non-null value.
  @pragma('vm:prefer-inline')
  double? get extrusion$ => extrusion;

  /// Returns the value of the [angle] field.
  /// If the field is nullable, the return value may be null; otherwise, it
  /// will always return a non-null value.
  @pragma('vm:prefer-inline')
  double get angle$ => angle!;

  /// Returns the value of the [border] field.
  /// If the field is nullable, the return value may be null; otherwise, it
  /// will always return a non-null value.
  @pragma('vm:prefer-inline')
  ShapeBorder? get border$ => border;
}
