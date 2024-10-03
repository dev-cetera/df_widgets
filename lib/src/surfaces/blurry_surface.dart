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

import 'dart:ui' show ImageFilter;

import '/_common.dart';

// ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░

class MBlurryContainer extends StatelessWidget {
  //
  //
  //

  final Widget? child;
  final double? sigma;
  final double opacity;
  final BorderRadius borderRadius;
  final BoxConstraints constraints;
  final BoxDecoration decoration;
  final EdgeInsets? padding;
  final Color? color;
  final double? width;
  final double? height;

  //
  //
  //

  const MBlurryContainer({
    super.key,
    this.child,
    this.sigma = 8.0,
    this.opacity = 0.75,
    this.borderRadius = BorderRadius.zero,
    this.constraints = const BoxConstraints(),
    this.decoration = const BoxDecoration(),
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
    return ClipRRect(
      borderRadius: borderRadius,
      child: BackdropFilter(
        filter: ImageFilter.blur(
          sigmaX: sigma!,
          sigmaY: sigma!,
        ),
        child: Container(
          width: width,
          height: height,
          constraints: constraints,
          decoration: decoration.copyWith(
            color: color?.withOpacity(color!.opacity * opacity),
            borderRadius: borderRadius,
          ),
          padding: padding ?? EdgeInsets.zero,
          child: child,
        ),
      ),
    );
  }
}
