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

class BasicErrBtn extends StatelessWidget {
  final _OnTap? onTap;
  final _OnTapDown? onTapDown;
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
      properties: TapBox.theme.copyWith(
        builder: (context, states, child) {
          return Container(
            constraints: BoxConstraints(minWidth: 48.sc, minHeight: 48.sc),
            decoration: BoxDecoration(
              color: (Theme.of(context)
                      .colorScheme
                      .error
                      .withAlpha(enabled && states.contains(TapBoxState.HOVER) ? 96 : 48))
                  .withSaturation(enabled ? 1.0 : 0.0),
              borderRadius: BorderRadius.circular(24.sc),
            ),
            child: Center(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.sc),
                child: child,
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

// ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░

typedef _OnTap = void Function();
typedef _OnTapDown = void Function(TapDownDetails details);
