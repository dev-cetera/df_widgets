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

import 'package:flutter/material.dart';

import '/_common.dart';

// ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░

class BasicIconBtn extends StatelessWidget {
  final VoidCallback? onTap;
  final GestureTapDownCallback? onTapDown;
  final ShapeBorder shape;
  final IconData? iconData;
  final Widget? child;

  const BasicIconBtn({
    super.key,
    this.onTap,
    this.onTapDown,
    this.shape = const CircleBorder(),
    this.iconData,
    this.child,
  });

  @override
  Widget build(BuildContext context) {
    final enabled = onTap != null || onTapDown != null;
    assert(child != null || iconData != null);
    return TapBox(
      onTap: onTap,
      onTapDown: onTapDown,
      properties: TapBox.themeOf(context).copyWith(
        builder: (context, states, child) {
          return Container(
            constraints: const BoxConstraints(minWidth: 48.0, minHeight: 48.0),
            decoration: ShapeDecoration(
              color: enabled && states.contains(TapBoxState.HOVER)
                  ? Theme.of(context).colorScheme.primary.withAlpha(32)
                  : Colors.transparent,
              shape: shape,
            ),
            child: child,
          );
        },
      ),
      child: child ??
          Icon(
            iconData,
            color: Theme.of(context)
                .colorScheme
                .primary
                .withSaturation(enabled ? 1.0 : 0.0),
            size: 24.sc,
          ),
    );
  }
}
