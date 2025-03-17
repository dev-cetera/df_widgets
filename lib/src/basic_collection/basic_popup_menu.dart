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

class BasicPopupMenu extends StatelessWidget {
  //
  //
  //

  final Widget Function(BuildContext context, VoidCallback open) buttonBuilder;
  final Widget Function(BuildContext, void Function())? backgroundBuilder;
  final List<Widget> Function(BuildContext context, VoidCallback close) childrenBuilder;
  final void Function(VoidCallback close)? onTapDownBackground;
  final double maxWidthFactor;
  final double maxHeightFactor;

  //
  //
  //

  const BasicPopupMenu({
    super.key,
    required this.buttonBuilder,
    this.backgroundBuilder,
    required this.childrenBuilder,
    this.onTapDownBackground,
    this.maxWidthFactor = 0.5,
    this.maxHeightFactor = 0.75,
  }) : assert(maxHeightFactor >= 0.0 && maxHeightFactor <= 1.0);

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
                maxWidth: maxWidthFactor * screenSize.width,
                maxHeight: maxHeightFactor * screenSize.height,
              ),
              padding: EdgeInsets.all(16.sc),
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  spacing: 8.sc,
                  children: childrenBuilder(context, close),
                ),
              ),
            ),
          ),
        );
      },
      backgroundBuilder: backgroundBuilder,
      onTapDownBackground: onTapDownBackground,
    );
  }
}
