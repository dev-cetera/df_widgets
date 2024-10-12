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

part of 'tap_box.dart';

// ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░

/// Generated class for [_TapBoxProperties].
class TapBoxProperties extends _TapBoxProperties {
  //
  //
  //

  /// No description provided.
  final Decoration? underlayTapDecoration;

  /// No description provided.
  final Decoration? underlayHoverDecoration;

  /// No description provided.
  final Decoration? overlayTapDecoration;

  /// No description provided.
  final Decoration? overlayHoverDecoration;

  /// No description provided.
  final Decoration? decoration;

  /// No description provided.
  final WidgetBuilder? hoverBuilder;

  /// No description provided.
  final WidgetBuilder? nonHoverBuilder;

  /// Constructs a new instance of [TapBoxProperties]
  /// from optional and required parameters.
  const TapBoxProperties({
    required this.underlayTapDecoration,
    required this.underlayHoverDecoration,
    required this.overlayTapDecoration,
    required this.overlayHoverDecoration,
    required this.decoration,
    this.hoverBuilder,
    this.nonHoverBuilder,
  });

  /// Creates a copy of this instance, replacing the specified fields.
  TapBoxProperties copyWith({
    Decoration? underlayTapDecoration,
    Decoration? underlayHoverDecoration,
    Decoration? overlayTapDecoration,
    Decoration? overlayHoverDecoration,
    Decoration? decoration,
    WidgetBuilder? hoverBuilder,
    WidgetBuilder? nonHoverBuilder,
  }) {
    return TapBoxProperties(
      underlayTapDecoration:
          underlayTapDecoration ?? this.underlayTapDecoration,
      underlayHoverDecoration:
          underlayHoverDecoration ?? this.underlayHoverDecoration,
      overlayTapDecoration: overlayTapDecoration ?? this.overlayTapDecoration,
      overlayHoverDecoration:
          overlayHoverDecoration ?? this.overlayHoverDecoration,
      decoration: decoration ?? this.decoration,
      hoverBuilder: hoverBuilder ?? this.hoverBuilder,
      nonHoverBuilder: nonHoverBuilder ?? this.nonHoverBuilder,
    );
  }

  /// Creates a copy of this instance, removing the specified fields.
  TapBoxProperties copyWithout({
    bool underlayTapDecoration = true,
    bool underlayHoverDecoration = true,
    bool overlayTapDecoration = true,
    bool overlayHoverDecoration = true,
    bool decoration = true,
    bool hoverBuilder = true,
    bool nonHoverBuilder = true,
  }) {
    return TapBoxProperties(
      underlayTapDecoration:
          underlayTapDecoration ? this.underlayTapDecoration : null,
      underlayHoverDecoration:
          underlayHoverDecoration ? this.underlayHoverDecoration : null,
      overlayTapDecoration:
          overlayTapDecoration ? this.overlayTapDecoration : null,
      overlayHoverDecoration:
          overlayHoverDecoration ? this.overlayHoverDecoration : null,
      decoration: decoration ? this.decoration : null,
      hoverBuilder: hoverBuilder ? this.hoverBuilder : null,
      nonHoverBuilder: nonHoverBuilder ? this.nonHoverBuilder : null,
    );
  }

  /// Returns the value of the [underlayTapDecoration] field.
  /// If the field is nullable, the return value may be null; otherwise, it
  /// will always return a non-null value.
  @pragma('vm:prefer-inline')
  Decoration get underlayTapDecoration$ => underlayTapDecoration!;

  /// Returns the value of the [underlayHoverDecoration] field.
  /// If the field is nullable, the return value may be null; otherwise, it
  /// will always return a non-null value.
  @pragma('vm:prefer-inline')
  Decoration get underlayHoverDecoration$ => underlayHoverDecoration!;

  /// Returns the value of the [overlayTapDecoration] field.
  /// If the field is nullable, the return value may be null; otherwise, it
  /// will always return a non-null value.
  @pragma('vm:prefer-inline')
  Decoration get overlayTapDecoration$ => overlayTapDecoration!;

  /// Returns the value of the [overlayHoverDecoration] field.
  /// If the field is nullable, the return value may be null; otherwise, it
  /// will always return a non-null value.
  @pragma('vm:prefer-inline')
  Decoration get overlayHoverDecoration$ => overlayHoverDecoration!;

  /// Returns the value of the [decoration] field.
  /// If the field is nullable, the return value may be null; otherwise, it
  /// will always return a non-null value.
  @pragma('vm:prefer-inline')
  Decoration get decoration$ => decoration!;

  /// Returns the value of the [hoverBuilder] field.
  /// If the field is nullable, the return value may be null; otherwise, it
  /// will always return a non-null value.
  @pragma('vm:prefer-inline')
  WidgetBuilder? get hoverBuilder$ => hoverBuilder;

  /// Returns the value of the [nonHoverBuilder] field.
  /// If the field is nullable, the return value may be null; otherwise, it
  /// will always return a non-null value.
  @pragma('vm:prefer-inline')
  WidgetBuilder? get nonHoverBuilder$ => nonHoverBuilder;
}
