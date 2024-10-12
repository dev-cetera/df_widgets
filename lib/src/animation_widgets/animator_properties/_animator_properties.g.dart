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

part of 'animator_properties.dart';

// ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░

/// Generated class for [_AnimatorProperties].
class AnimatorProperties extends _AnimatorProperties {
  //
  //
  //

  /// No description provided.
  final Duration? duration;

  /// No description provided.
  final Duration? delay;

  /// No description provided.
  final Curve? curve;

  /// No description provided.
  final double? begin;

  /// No description provided.
  final double? end;

  /// Constructs a new instance of [AnimatorProperties]
  /// from optional and required parameters.
  const AnimatorProperties({
    required this.duration,
    required this.delay,
    required this.curve,
    required this.begin,
    required this.end,
  });

  /// Creates a copy of this instance, replacing the specified fields.
  AnimatorProperties copyWith({
    Duration? duration,
    Duration? delay,
    Curve? curve,
    double? begin,
    double? end,
  }) {
    return AnimatorProperties(
      duration: duration ?? this.duration,
      delay: delay ?? this.delay,
      curve: curve ?? this.curve,
      begin: begin ?? this.begin,
      end: end ?? this.end,
    );
  }

  /// Creates a copy of this instance, removing the specified fields.
  AnimatorProperties copyWithout({
    bool duration = true,
    bool delay = true,
    bool curve = true,
    bool begin = true,
    bool end = true,
  }) {
    return AnimatorProperties(
      duration: duration ? this.duration : null,
      delay: delay ? this.delay : null,
      curve: curve ? this.curve : null,
      begin: begin ? this.begin : null,
      end: end ? this.end : null,
    );
  }

  /// Returns the value of the [duration] field.
  /// If the field is nullable, the return value may be null; otherwise, it
  /// will always return a non-null value.
  @pragma('vm:prefer-inline')
  Duration get duration$ => duration!;

  /// Returns the value of the [delay] field.
  /// If the field is nullable, the return value may be null; otherwise, it
  /// will always return a non-null value.
  @pragma('vm:prefer-inline')
  Duration get delay$ => delay!;

  /// Returns the value of the [curve] field.
  /// If the field is nullable, the return value may be null; otherwise, it
  /// will always return a non-null value.
  @pragma('vm:prefer-inline')
  Curve get curve$ => curve!;

  /// Returns the value of the [begin] field.
  /// If the field is nullable, the return value may be null; otherwise, it
  /// will always return a non-null value.
  @pragma('vm:prefer-inline')
  double get begin$ => begin!;

  /// Returns the value of the [end] field.
  /// If the field is nullable, the return value may be null; otherwise, it
  /// will always return a non-null value.
  @pragma('vm:prefer-inline')
  double get end$ => end!;
}
