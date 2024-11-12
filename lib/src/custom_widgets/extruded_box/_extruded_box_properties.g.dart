//.title
// ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓
//
// GENERATED - DO NOT MODIFY BY HAND
// See: https://github.com/DevCetra/df_generate_dart_models
//
// ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓
//.title~

// ignore_for_file: annotate_overrides
// ignore_for_file: overridden_fields

part of 'extruded_box.dart';

// ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░

/// Generated class for [_ExtrudedBoxProperties].
class ExtrudedBoxProperties extends _ExtrudedBoxProperties {
  //
  //
  //

  /// No description provided.
  final double? perspectiveDepth;

  /// No description provided.
  final Color? color;

  /// No description provided.
  final double? value;

  /// No description provided.
  final double? max;

  /// No description provided.
  final double? angle;

  /// No description provided.
  final ShapeBorder? border;

  /// Constructs a new instance of [ExtrudedBoxProperties]
  /// from optional and required parameters.
  const ExtrudedBoxProperties({
    required this.perspectiveDepth,
    required this.color,
    required this.value,
    this.max,
    required this.angle,
    this.border,
  });

  /// Creates a copy of this instance, replacing the specified fields.
  ExtrudedBoxProperties copyWith({
    double? perspectiveDepth,
    Color? color,
    double? value,
    double? max,
    double? angle,
    ShapeBorder? border,
  }) {
    return ExtrudedBoxProperties(
      perspectiveDepth: perspectiveDepth ?? this.perspectiveDepth,
      color: color ?? this.color,
      value: value ?? this.value,
      max: max ?? this.max,
      angle: angle ?? this.angle,
      border: border ?? this.border,
    );
  }

  /// Creates a copy of this instance, removing the specified fields.
  ExtrudedBoxProperties copyWithout({
    bool perspectiveDepth = true,
    bool color = true,
    bool value = true,
    bool max = true,
    bool angle = true,
    bool border = true,
  }) {
    return ExtrudedBoxProperties(
      perspectiveDepth: perspectiveDepth ? this.perspectiveDepth : null,
      color: color ? this.color : null,
      value: value ? this.value : null,
      max: max ? this.max : null,
      angle: angle ? this.angle : null,
      border: border ? this.border : null,
    );
  }

  /// Returns the value of the [perspectiveDepth] field.
  /// If the field is nullable, the return value may be null; otherwise, it
  /// will always return a non-null value.
  @pragma('vm:prefer-inline')
  double get perspectiveDepth$ => perspectiveDepth!;

  /// Returns the value of the [color] field.
  /// If the field is nullable, the return value may be null; otherwise, it
  /// will always return a non-null value.
  @pragma('vm:prefer-inline')
  Color get color$ => color!;

  /// Returns the value of the [value] field.
  /// If the field is nullable, the return value may be null; otherwise, it
  /// will always return a non-null value.
  @pragma('vm:prefer-inline')
  double get value$ => value!;

  /// Returns the value of the [max] field.
  /// If the field is nullable, the return value may be null; otherwise, it
  /// will always return a non-null value.
  @pragma('vm:prefer-inline')
  double? get max$ => max;

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
