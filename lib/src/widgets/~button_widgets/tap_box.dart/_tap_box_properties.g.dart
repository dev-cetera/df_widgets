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

part of 'tap_box.dart';

// ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░

/// Generated class for [_TapBoxProperties].
class TapBoxProperties extends _TapBoxProperties {
  //
  //
  //

  /// No description provided.
  final Decoration? decoration;

  /// No description provided.
  final Decoration? foregroundDecoration;

  /// No description provided.
  final _WidgetBuilder? builder;

  /// Constructs a new instance of [TapBoxProperties]
  /// from optional and required parameters.
  const TapBoxProperties({
    this.decoration,
    this.foregroundDecoration,
    this.builder,
  });

  /// Creates a copy of this instance, replacing the specified fields.
  TapBoxProperties copyWith({
    Decoration? decoration,
    Decoration? foregroundDecoration,
    _WidgetBuilder? builder,
  }) {
    return TapBoxProperties(
      decoration: decoration ?? this.decoration,
      foregroundDecoration: foregroundDecoration ?? this.foregroundDecoration,
      builder: builder ?? this.builder,
    );
  }

  /// Creates a copy of this instance, removing the specified fields.
  TapBoxProperties copyWithout({
    bool decoration = true,
    bool foregroundDecoration = true,
    bool builder = true,
  }) {
    return TapBoxProperties(
      decoration: decoration ? this.decoration : null,
      foregroundDecoration:
          foregroundDecoration ? this.foregroundDecoration : null,
      builder: builder ? this.builder : null,
    );
  }

  /// Returns the value of the [decoration] field.
  /// If the field is nullable, the return value may be null; otherwise, it
  /// will always return a non-null value.
  @pragma('vm:prefer-inline')
  Decoration? get decoration$ => decoration;

  /// Returns the value of the [foregroundDecoration] field.
  /// If the field is nullable, the return value may be null; otherwise, it
  /// will always return a non-null value.
  @pragma('vm:prefer-inline')
  Decoration? get foregroundDecoration$ => foregroundDecoration;

  /// Returns the value of the [builder] field.
  /// If the field is nullable, the return value may be null; otherwise, it
  /// will always return a non-null value.
  @pragma('vm:prefer-inline')
  _WidgetBuilder? get builder$ => builder;
}
