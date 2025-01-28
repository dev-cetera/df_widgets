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

class Blur extends StatelessWidget {
  //
  //
  //

  final double sigma;
  final Widget? child;
  final Color? color;
  final BlendMode blendMode;
  final bool disabled;

  //
  //
  //

  const Blur({
    super.key,
    this.child,
    this.sigma = 3.0,
    this.color,
    this.blendMode = BlendMode.darken,
    this.disabled = false,
  });

  //
  //
  //

  @override
  Widget build(BuildContext context) {
    if (child == null) return const SizedBox();
    return ClipRRect(
      child: ImageFiltered(
        imageFilter: ui.ImageFilter.blur(
          sigmaX: sigma,
          sigmaY: sigma,
          tileMode: ui.TileMode.clamp,
        ),
        child: Stack(
          fit: StackFit.loose,
          alignment: Alignment.center,
          children: [
            if (color != null)
              ColorFiltered(
                colorFilter: ui.ColorFilter.mode(
                  color!,
                  blendMode,
                ),
                child: child!,
              )
            else
              child!,
            if (disabled)
              Container(
                color: const Color(0x00000000),
              ),
          ],
        ),
      ),
    );
  }
}
