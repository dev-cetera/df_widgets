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

class BasicPopupMenu extends StatelessWidget {
  //
  //
  //

  final Widget Function(BuildContext context, VoidCallback open) buttonBuilder;
  final List<Widget> Function(BuildContext context, VoidCallback close) childrenBuilder;
  final void Function(VoidCallback close)? onTapDownBackground;

  //
  //
  //

  const BasicPopupMenu({
    super.key,
    required this.buttonBuilder,
    required this.childrenBuilder,
    this.onTapDownBackground,
  });

  //
  //
  //

  //
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return AnchoredPopup(
      buttonBuilder: buttonBuilder,
      itemBuilder: (context, close) {
        return SlideAnimator(
          curve: Curves.linearToEaseOut,
          child: Padding(
            padding: EdgeInsets.all(16.sc),
            child: BasicSurface(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16.sc),
                color: Theme.of(context).colorScheme.surfaceContainerLowest,
              ),
              constraints: BoxConstraints(
                maxWidth: 300.sc,
                maxHeight: 0.5 * screenSize.height,
              ),
              padding: EdgeInsets.all(16.sc),
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: DividedColumn(
                  divider: SizedBox(height: 8.sc),
                  children: childrenBuilder(context, close),
                ),
              ),
            ),
          ),
        );
      },
      // TODO: Add backgroundBuilder
      onTapDownBackground: onTapDownBackground,
    );
  }
}
