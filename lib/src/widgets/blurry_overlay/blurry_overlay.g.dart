//.title
// ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓
//
// GENERATED - DO NOT MODIFY BY HAND
// See: https://github.com/robmllze/df_generate_dart_models
//
// ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓
//.title~

part of 'blurry_overlay.dart';

// ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░

/// Generated class for [BlurryOverlay].
class BlurryOverlayProperties {
  //
  //
  //

  /// No description provided.
  final Color? color;

  /// No description provided.
  final double? sigma;

  /// Constructs a new instance of [BlurryOverlayProperties]
  /// from optional and required parameters.
  const BlurryOverlayProperties({
    this.color,
    this.sigma,
  });

  /// Creates a copy of this instance, replacing the specified fields.
  BlurryOverlayProperties copyWith({
    Color? color,
    double? sigma,
  }) {
    return BlurryOverlayProperties(
      color: color ?? this.color,
      sigma: sigma ?? this.sigma,
    );
  }

  /// Creates a copy of this instance, removing the specified fields.
  BlurryOverlayProperties copyWithout({
    bool color = true,
    bool sigma = true,
  }) {
    return BlurryOverlayProperties(
      color: color ? this.color : null,
      sigma: sigma ? this.sigma : null,
    );
  }
}
