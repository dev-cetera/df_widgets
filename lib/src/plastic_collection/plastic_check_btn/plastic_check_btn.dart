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

import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';

import '/_common.dart';

part '_plastic_check_btn_properties.g.dart';

// ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░

class PlasticCheckBtn extends StatelessWidget {
  final PlasticCheckBtnProperties? properties;

  static PlasticCheckBtnProperties themeOf(BuildContext? context) {
    return DefaultThemes.of(context)?.themeOrNull<PlasticCheckBtnProperties>() ??
        PlasticCheckBtnProperties(
          checkedColor: Colors.green.shade300,
          checkedHoverColor: Colors.green.shade200,
          checkedHoverIconColor: Colors.green.shade600,
          checkedHoverIconData: FluentIcons.checkbox_checked_24_filled,
          checkedHoverShadowColor: Colors.green.shade600,
          checkedIconColor: Colors.green.shade700,
          checkedIconData: FluentIcons.checkbox_checked_24_filled,
          checkedShadowColor: Colors.green.shade700,
          uncheckedColor: Colors.blueGrey.shade300,
          uncheckedHoverColor: Colors.blueGrey.shade200,
          uncheckedHoverIconColor: Colors.blueGrey.shade600,
          uncheckedHoverIconData: FluentIcons.checkbox_unchecked_24_filled,
          uncheckedHoverShadowColor: Colors.blueGrey.shade600,
          uncheckedIconColor: Colors.blueGrey.shade700,
          uncheckedIconData: FluentIcons.checkbox_unchecked_24_filled,
          uncheckedShadowColor: Colors.blueGrey.shade700,
        );
  }

  final Pod<bool> pState;
  final _OnTap? onTap;
  final _OnTapDown? onTapDown;

  const PlasticCheckBtn({
    super.key,
    required this.pState,
    this.onTap,
    this.onTapDown,
    this.properties,
  });

  @override
  Widget build(BuildContext context) {
    final p = properties ?? themeOf(context);
    final iconSize = p.iconSize ?? 24.sc;
    return ToggleBtn(
      pState: pState,
      onTap: onTap,
      onTapDown: onTapDown,
      tapBoxProperyBuilder: (checked, defaultTapBoxProperties) => defaultTapBoxProperties.copyWith(
        builder: (context, states, _) {
          final notIdling = states.isNotEmpty;
          return ExtrudedBox(
            properties: (p.extrudedBoxProperties ?? ExtrudedBox.themeOf(context)).copyWith(
              color: checked
                  ? notIdling
                      ? p.checkedHoverShadowColor
                      : p.checkedShadowColor
                  : notIdling
                      ? p.uncheckedHoverShadowColor
                      : p.uncheckedShadowColor,
              value: checked ? 0.6 : 1.0,
            ),
            child: ColoredBox(
              color: checked
                  ? notIdling
                      ? p.checkedHoverColor$
                      : p.checkedColor$
                  : notIdling
                      ? p.uncheckedHoverColor$
                      : p.uncheckedColor$,
              child: () {
                if (checked) {
                  return Icon(
                    notIdling ? p.checkedHoverIconData$ : p.checkedIconData,
                    color: notIdling ? p.checkedHoverIconColor$ : p.checkedIconColor$,
                    size: iconSize,
                  );
                } else {
                  return Icon(
                    notIdling ? p.uncheckedHoverIconData$ : p.uncheckedIconData,
                    color: notIdling ? p.uncheckedHoverIconColor$ : p.uncheckedIconColor$,
                    size: iconSize,
                  );
                }
              }(),
            ),
          );
        },
      ),
    );
  }
}

// ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░

typedef _OnTap = void Function(Pod<bool> pState);
typedef _OnTapDown = void Function(TapDownDetails details, Pod<bool> pState);

// ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░

@GenerateDartModel(
  fields: {
    Field(
      fieldPath: ['iconSize'],
      fieldType: double,
      nullable: true,
    ),
    Field(
      fieldPath: ['checkedIconData'],
      fieldType: IconData,
      nullable: true,
    ),
    Field(
      fieldPath: ['checkedIconColor'],
      fieldType: Color,
      nullable: false,
    ),
    Field(
      fieldPath: ['checkedColor'],
      fieldType: Color,
      nullable: false,
    ),
    Field(
      fieldPath: ['checkedShadowColor'],
      fieldType: Color,
      nullable: false,
    ),
    Field(
      fieldPath: ['uncheckedIconData'],
      fieldType: IconData,
      nullable: true,
    ),
    Field(
      fieldPath: ['uncheckedIconColor'],
      fieldType: Color,
      nullable: false,
    ),
    Field(
      fieldPath: ['uncheckedColor'],
      fieldType: Color,
      nullable: false,
    ),
    Field(
      fieldPath: ['uncheckedShadowColor'],
      fieldType: Color,
      nullable: false,
    ),
    Field(
      fieldPath: ['checkedHoverIconData'],
      fieldType: IconData,
      nullable: true,
    ),
    Field(
      fieldPath: ['checkedHoverIconColor'],
      fieldType: Color,
      nullable: false,
    ),
    Field(
      fieldPath: ['checkedHoverColor'],
      fieldType: Color,
      nullable: false,
    ),
    Field(
      fieldPath: ['checkedHoverShadowColor'],
      fieldType: Color,
      nullable: false,
    ),
    Field(
      fieldPath: ['uncheckedHoverIconData'],
      fieldType: IconData,
      nullable: true,
    ),
    Field(
      fieldPath: ['uncheckedHoverIconColor'],
      fieldType: Color,
      nullable: false,
    ),
    Field(
      fieldPath: ['uncheckedHoverColor'],
      fieldType: Color,
      nullable: false,
    ),
    Field(
      fieldPath: ['uncheckedHoverShadowColor'],
      fieldType: Color,
      nullable: false,
    ),
    Field(
      fieldPath: ['extrudedBoxProperties'],
      fieldType: ExtrudedBoxProperties,
      nullable: true,
    ),
  },
  shouldInherit: true,
)
class _PlasticCheckBtnProperties {
  const _PlasticCheckBtnProperties();
}
