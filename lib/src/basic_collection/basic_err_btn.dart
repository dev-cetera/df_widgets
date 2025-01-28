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

class BasicErrBtn extends StatelessWidget {
  final VoidCallback? onTap;
  final GestureTapDownCallback? onTapDown;
  final String? text;
  final Widget? child;

  const BasicErrBtn({
    super.key,
    this.onTap,
    this.onTapDown,
    this.text,
    this.child,
  });

  @override
  Widget build(BuildContext context) {
    final enabled = onTap != null || onTapDown != null;
    return TapBox(
      properties: TapBox.themeOf(context).copyWith(
        builder: (context, states, child) {
          return Container(
            constraints: const BoxConstraints(minWidth: 48.0, minHeight: 48.0),
            decoration: BoxDecoration(
              color: enabled && states.contains(TapBoxState.HOVER)
                  ? Theme.of(context).colorScheme.error.withAlpha(32)
                  : Colors.transparent,
              borderRadius: BorderRadius.circular(24.sc),
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.sc),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  child!,
                ],
              ),
            ),
          );
        },
      ),
      child: child ??
          (text != null
              ? Text(
                  text!,
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        fontWeight: FONT_WEIGHT_BLACK,
                        color:
                            Theme.of(context).colorScheme.error.withSaturation(enabled ? 1.0 : 0.0),
                      ),
                )
              : null),
    );
  }
}
