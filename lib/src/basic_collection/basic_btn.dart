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

class BasicBtn extends StatelessWidget {
  final VoidCallback? onTap;
  final GestureTapDownCallback? onTapDown;
  final String? text;
  final Widget? child;

  const BasicBtn({
    super.key,
    this.onTap,
    this.onTapDown,
    this.text,
    this.child,
  });

  @override
  Widget build(BuildContext context) {
    final baseDecoration = BoxDecoration(
      borderRadius: BorderRadius.circular(24.sc),
    );
    final baseTextStyle = Theme.of(context).textTheme.bodyMedium?.copyWith(
      fontWeight: FONT_WEIGHT_BLACK,
      color: Theme.of(context).colorScheme.primary,
    );
    return Btn(
      properties: Btn.themeOf(context).copyWith(
        decoration: baseDecoration,
        disabledDecoration: baseDecoration,
        hoverDecoration: baseDecoration.copyWith(
          color: Theme.of(context).colorScheme.primary.withAlpha(32),
        ),
        textStyle: baseTextStyle,
        disabledTextStyle: baseTextStyle?.copyWith(
          color: Theme.of(context).colorScheme.primary.withAlpha(32),
        ),
        hoverTextStyle: baseTextStyle,
      ),
      onTap: onTap,
      onTapDown: onTapDown,
      child:
          child ??
          (text != null
              ? Text(
                  text!,
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    fontWeight: FONT_WEIGHT_BLACK,
                    color: Theme.of(
                      context,
                    ).colorScheme.primary.withSaturation(1.0),
                  ),
                )
              : null),
    );
  }
}
