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

import 'dart:ui' as ui;

import '/_common.dart';

// ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░

class Facade {
  //
  //
  //

  final ui.Image? image;
  final double blurSigma;
  final Widget? child;

  //
  //
  //

  const Facade({this.image, this.child, this.blurSigma = 0.0});

  //
  //
  //

  Facade copyWith({
    ui.Image? image,
    double? blurSigma,
    Color? blurColor,
    Widget? child,
  }) {
    return Facade(
      image: image ?? this.image,
      blurSigma: blurSigma ?? this.blurSigma,
      child: child ?? this.child,
    );
  }

  //
  //
  //

  Widget draw() {
    return Stack(
      fit: StackFit.expand,
      children: [
        Blur(
          sigma: blurSigma,
          child: RawImage(fit: BoxFit.fill, image: image),
        ),
        if (child != null) child!,
      ],
    );
  }
}
