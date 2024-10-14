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

import 'package:flutter/material.dart';

import '/_common.dart';

// ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░

class BasicIconBtn extends StatelessWidget {
  final _OnTap? onTap;
  final _OnTapDown? onTapDown;
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
      properties: TapBox.theme.copyWith(
        builder: (context, states, child) {
          return Container(
            constraints: BoxConstraints(
              minHeight: 48.sc,
              minWidth: 48.sc,
            ),
            decoration: ShapeDecoration(
              color: (Theme.of(context)
                      .colorScheme
                      .primary
                      .withAlpha(enabled && states.contains(TapBoxState.HOVER) ? 96 : 48))
                  .withSaturation(enabled ? 1.0 : 0.0),
              shape: shape,
            ),
            child: child,
          );
        },
      ),
      child: child ??
          Icon(
            iconData,
            color: Theme.of(context).colorScheme.primary.withSaturation(enabled ? 1.0 : 0.0),
            size: 24.sc,
          ),
    );
  }
}

// ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░

typedef _OnTap = void Function(Pod<bool> pState);
typedef _OnTapDown = void Function(TapDownDetails details, Pod<bool> pState);
