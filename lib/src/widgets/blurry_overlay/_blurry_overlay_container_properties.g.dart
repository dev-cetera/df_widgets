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

part of 'blurry_overlay.dart';

// ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░

/// Generated class for [_BlurryOverlayContainerProperties].
class BlurryOverlayContainerProperties
    extends _BlurryOverlayContainerProperties {
  //
  //
  //

  /// No description provided.
  final double? sigma;

  /// No description provided.
  final Color? color;

  /// Constructs a new instance of [BlurryOverlayContainerProperties]
  /// from optional and required parameters.
  const BlurryOverlayContainerProperties({
    required this.sigma,
    required this.color,
  });

  /// Creates a copy of this instance, replacing the specified fields.
  BlurryOverlayContainerProperties copyWith({
    double? sigma,
    Color? color,
  }) {
    return BlurryOverlayContainerProperties(
      sigma: sigma ?? this.sigma,
      color: color ?? this.color,
    );
  }

  /// Creates a copy of this instance, removing the specified fields.
  BlurryOverlayContainerProperties copyWithout({
    bool sigma = true,
    bool color = true,
  }) {
    return BlurryOverlayContainerProperties(
      sigma: sigma ? this.sigma : null,
      color: color ? this.color : null,
    );
  }

  /// Returns the value of the [sigma] field.
  /// If the field is nullable, the return value may be null; otherwise, it
  /// will always return a non-null value.
  @pragma('vm:prefer-inline')
  double get sigma$ => sigma!;

  /// Returns the value of the [color] field.
  /// If the field is nullable, the return value may be null; otherwise, it
  /// will always return a non-null value.
  @pragma('vm:prefer-inline')
  Color get color$ => color!;
}
