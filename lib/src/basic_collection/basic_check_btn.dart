//.title
// ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓
//
// Dart/Flutter (DF) Packages by dev-cetera.com & contributors. The use of this
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

// ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░

class BasicCheckBtn extends StatelessWidget {
  final Pod<bool> pState;
  final _OnTap? onTap;
  final _OnTapDown? onTapDown;
  final ShapeBorder shape;
  final Widget? checkedIcon;
  final Widget? unheckedIcon;

  const BasicCheckBtn({
    super.key,
    required this.pState,
    this.onTap,
    this.onTapDown,
    this.shape = const CircleBorder(),
    this.checkedIcon,
    this.unheckedIcon,
  });

  @override
  Widget build(BuildContext context) {
    final enabled = onTap != null || onTapDown != null;
    return ToggleBtn(
      pState: pState,
      onTap: onTap,
      onTapDown: onTapDown,
      tapBoxProperyBuilder: (checked, defaultTapBoxProperties) => defaultTapBoxProperties.copyWith(
        builder: (context, states, _) {
          return Container(
            width: 48.sc,
            height: 48.sc,
            decoration: ShapeDecoration(
              color: enabled && states.contains(TapBoxState.HOVER)
                  ? Theme.of(context).colorScheme.primary.withAlpha(32)
                  : Colors.transparent,
              shape: shape,
            ),
            child: checked
                ? checkedIcon ??
                    Icon(
                      FluentIcons.checkbox_checked_24_regular,
                      color:
                          Theme.of(context).colorScheme.primary.withSaturation(enabled ? 1.0 : 0.0),
                      size: 24.sc,
                    )
                : unheckedIcon ??
                    Icon(
                      FluentIcons.checkbox_unchecked_24_regular,
                      color:
                          Theme.of(context).colorScheme.primary.withSaturation(enabled ? 1.0 : 0.0),
                      size: 24.sc,
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
