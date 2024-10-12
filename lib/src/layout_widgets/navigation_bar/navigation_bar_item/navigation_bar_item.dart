//.title
// ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓
//
// Dart/Flutter (DF) Packages by DevCetra.com & contributors. The use of this
// source code is governed by an MIT-style license described in the LICENSE
// file located in this project's root directory.
//
// See: https://opensource.org/license/mit
//
// ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓
//.title~

import '/_common.dart';

part '_navigation_bar_item_properties.g.dart';

// ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░

class NavigationBarItem extends StatelessWidget {
  final NavigationBarItemProperties properties;
  final VoidCallback? onTap;
  final GestureTapDownCallback? onTapDown;

  static const DEFAULT_PROPERTIES = NavigationBarItemProperties(
    selected: false,
    tapBoxProperties: TapBox.DEFAULT_PROPERTIES,
  );
  const NavigationBarItem({
    super.key,
    this.onTap,
    this.onTapDown,
    this.properties = DEFAULT_PROPERTIES,
  });

  @override
  Widget build(BuildContext context) {
    return TapBox(
      properties: properties.tapBoxProperties$,
      onTap: onTap,
      onTapDown: onTapDown,
      child: SizedBox.square(
        dimension: properties.size,
        child: properties.selected$ ? properties.selectedIcon : properties.unselectedIcon,
      ),
    );
  }
}

// ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░

@GenerateDartModel(
  fields: {
    Field(
      fieldPath: ['size'],
      fieldType: double,
      nullable: true,
    ),
    Field(
      fieldPath: ['tapBoxProperties'],
      fieldType: TapBoxProperties,
      nullable: false,
    ),
    Field(
      fieldPath: ['selected'],
      fieldType: bool,
      nullable: false,
    ),
    Field(
      fieldPath: ['selectedIcon'],
      fieldType: Widget,
      nullable: true,
    ),
    Field(
      fieldPath: ['unselectedIcon'],
      fieldType: Widget,
      nullable: true,
    ),
  },
  shouldInherit: true,
)
class _NavigationBarItemProperties {
  const _NavigationBarItemProperties();
}
