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

part 'blurry_overlay.g.dart';

// ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░

class BlurryOverlay extends StatelessWidget {
  //
  //
  //

  final VoidCallback? onTapBackground;
  final BlurryOverlayProperties properties;
  final Widget? child;

  //
  //
  //

  const BlurryOverlay({
    super.key,
    this.properties = const BlurryOverlayProperties(
      sigma: 1.0,
      color: Color.fromARGB(128, 0, 0, 0),
    ),
    this.onTapBackground,
    this.child,
  });

  //
  //
  //

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      alignment: Alignment.center,
      children: [
        GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: onTapBackground,
          child: Container(
            color: properties.color,
          ),
        ),
        Builder(
          builder: (context) {
            final sigma = properties.sigma ?? 1.0;
            return BackdropFilter(
              filter: ImageFilter.blur(
                sigmaX: sigma,
                sigmaY: sigma,
              ),
              child: Center(
                child: child,
              ),
            );
          },
        ),
      ],
    );
  }
}
