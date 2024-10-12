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

part of 'blur_animator.dart';

// ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░

/// Generated class for [_BlurAnimatorProperties].
class BlurAnimatorProperties extends _BlurAnimatorProperties {
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

  /// No description provided.
  final BlendMode? blendMode;

  /// No description provided.
  final Color? color;

  /// No description provided.
  final bool? disabled;

  /// Constructs a new instance of [BlurAnimatorProperties]
  /// from optional and required parameters.
  const BlurAnimatorProperties({
    required this.duration,
    required this.delay,
    required this.curve,
    required this.begin,
    required this.end,
    required this.blendMode,
    required this.color,
    required this.disabled,
  });

  /// Creates a copy of this instance, replacing the specified fields.
  BlurAnimatorProperties copyWith({
    Duration? duration,
    Duration? delay,
    Curve? curve,
    double? begin,
    double? end,
    BlendMode? blendMode,
    Color? color,
    bool? disabled,
  }) {
    return BlurAnimatorProperties(
      duration: duration ?? this.duration,
      delay: delay ?? this.delay,
      curve: curve ?? this.curve,
      begin: begin ?? this.begin,
      end: end ?? this.end,
      blendMode: blendMode ?? this.blendMode,
      color: color ?? this.color,
      disabled: disabled ?? this.disabled,
    );
  }

  /// Creates a copy of this instance, removing the specified fields.
  BlurAnimatorProperties copyWithout({
    bool duration = true,
    bool delay = true,
    bool curve = true,
    bool begin = true,
    bool end = true,
    bool blendMode = true,
    bool color = true,
    bool disabled = true,
  }) {
    return BlurAnimatorProperties(
      duration: duration ? this.duration : null,
      delay: delay ? this.delay : null,
      curve: curve ? this.curve : null,
      begin: begin ? this.begin : null,
      end: end ? this.end : null,
      blendMode: blendMode ? this.blendMode : null,
      color: color ? this.color : null,
      disabled: disabled ? this.disabled : null,
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

  /// Returns the value of the [blendMode] field.
  /// If the field is nullable, the return value may be null; otherwise, it
  /// will always return a non-null value.
  @pragma('vm:prefer-inline')
  BlendMode get blendMode$ => blendMode!;

  /// Returns the value of the [color] field.
  /// If the field is nullable, the return value may be null; otherwise, it
  /// will always return a non-null value.
  @pragma('vm:prefer-inline')
  Color get color$ => color!;

  /// Returns the value of the [disabled] field.
  /// If the field is nullable, the return value may be null; otherwise, it
  /// will always return a non-null value.
  @pragma('vm:prefer-inline')
  bool get disabled$ => disabled!;
}
