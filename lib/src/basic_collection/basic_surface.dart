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

class BasicSurface extends StatelessWidget {
  //
  //
  //

  final Widget? child;
  final BorderRadius? borderRadius;
  final BoxConstraints? constraints;
  final BoxDecoration? decoration;
  final EdgeInsets? padding;
  final Color? color;
  final double? width;
  final double? height;

  //
  //
  //

  const BasicSurface({
    super.key,
    this.child,
    this.borderRadius = BorderRadius.zero,
    this.constraints,
    this.decoration,
    this.padding,
    this.color,
    this.height,
    this.width,
  });

  //
  //
  //

  @override
  Widget build(BuildContext context) {
    final color1 = decoration?.color ?? color ?? Theme.of(context).colorScheme.surfaceContainer;
    final borderRadius1 = decoration?.borderRadius ?? borderRadius ?? BorderRadius.circular(24.sc);
    final decoration1 = decoration?.copyWith(color: color1, borderRadius: borderRadius1) ??
        BoxDecoration(color: color1, borderRadius: borderRadius1);
    final constraints1 = constraints ?? const BoxConstraints(minWidth: 48.0, minHeight: 48.0);
    return Container(
      width: width,
      height: height,
      constraints: constraints1,
      decoration: decoration1.copyWith(
        border: Border.all(
          color: Theme.of(context).colorScheme.outline,
        ),
      ),
      padding: padding ?? EdgeInsets.zero,
      clipBehavior: Clip.hardEdge,
      child: child,
    );
  }
}
