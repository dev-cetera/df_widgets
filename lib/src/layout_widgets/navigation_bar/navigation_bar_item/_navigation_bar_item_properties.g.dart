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

part of 'navigation_bar_item.dart';

// ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░

/// Generated class for [_NavigationBarItemProperties].
class NavigationBarItemProperties extends _NavigationBarItemProperties {
  //
  //
  //

  /// No description provided.
  final double? size;

  /// No description provided.
  final TapBoxProperties? tapBoxProperties;

  /// No description provided.
  final bool? selected;

  /// No description provided.
  final Widget? selectedIcon;

  /// No description provided.
  final Widget? unselectedIcon;

  /// Constructs a new instance of [NavigationBarItemProperties]
  /// from optional and required parameters.
  const NavigationBarItemProperties({
    this.size,
    required this.tapBoxProperties,
    required this.selected,
    this.selectedIcon,
    this.unselectedIcon,
  });

  /// Creates a copy of this instance, replacing the specified fields.
  NavigationBarItemProperties copyWith({
    double? size,
    TapBoxProperties? tapBoxProperties,
    bool? selected,
    Widget? selectedIcon,
    Widget? unselectedIcon,
  }) {
    return NavigationBarItemProperties(
      size: size ?? this.size,
      tapBoxProperties: tapBoxProperties ?? this.tapBoxProperties,
      selected: selected ?? this.selected,
      selectedIcon: selectedIcon ?? this.selectedIcon,
      unselectedIcon: unselectedIcon ?? this.unselectedIcon,
    );
  }

  /// Creates a copy of this instance, removing the specified fields.
  NavigationBarItemProperties copyWithout({
    bool size = true,
    bool tapBoxProperties = true,
    bool selected = true,
    bool selectedIcon = true,
    bool unselectedIcon = true,
  }) {
    return NavigationBarItemProperties(
      size: size ? this.size : null,
      tapBoxProperties: tapBoxProperties ? this.tapBoxProperties : null,
      selected: selected ? this.selected : null,
      selectedIcon: selectedIcon ? this.selectedIcon : null,
      unselectedIcon: unselectedIcon ? this.unselectedIcon : null,
    );
  }

  /// Returns the value of the [size] field.
  /// If the field is nullable, the return value may be null; otherwise, it
  /// will always return a non-null value.
  @pragma('vm:prefer-inline')
  double? get size$ => size;

  /// Returns the value of the [tapBoxProperties] field.
  /// If the field is nullable, the return value may be null; otherwise, it
  /// will always return a non-null value.
  @pragma('vm:prefer-inline')
  TapBoxProperties get tapBoxProperties$ => tapBoxProperties!;

  /// Returns the value of the [selected] field.
  /// If the field is nullable, the return value may be null; otherwise, it
  /// will always return a non-null value.
  @pragma('vm:prefer-inline')
  bool get selected$ => selected!;

  /// Returns the value of the [selectedIcon] field.
  /// If the field is nullable, the return value may be null; otherwise, it
  /// will always return a non-null value.
  @pragma('vm:prefer-inline')
  Widget? get selectedIcon$ => selectedIcon;

  /// Returns the value of the [unselectedIcon] field.
  /// If the field is nullable, the return value may be null; otherwise, it
  /// will always return a non-null value.
  @pragma('vm:prefer-inline')
  Widget? get unselectedIcon$ => unselectedIcon;
}
