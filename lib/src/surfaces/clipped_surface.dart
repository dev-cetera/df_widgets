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

import '/_common.dart';

// ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░

class ClippedSurface extends StatelessWidget {
  //
  //
  //

  final Widget? child;
  final BorderRadius borderRadius;
  final BoxConstraints? constraints;
  final BoxDecoration? decoration;
  final EdgeInsets? padding;
  final Color? color;
  final double? width;
  final double? height;

  //
  //
  //

  const ClippedSurface({
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
    final color1 = decoration?.color ?? color;
    final borderRadius1 = decoration?.borderRadius ?? borderRadius;
    return Container(
      width: width,
      height: height,
      constraints: constraints,
      decoration: decoration?.copyWith(
            color: color1,
            borderRadius: borderRadius1,
          ) ??
          BoxDecoration(
            color: color1,
            borderRadius: borderRadius1,
          ),
      padding: padding ?? EdgeInsets.zero,
      clipBehavior: Clip.antiAlias,
      child: child,
    );
  }
}
