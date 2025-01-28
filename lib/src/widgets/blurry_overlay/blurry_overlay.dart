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

import 'dart:ui' show ImageFilter;

import '/_common.dart';

part '_blurry_overlay_container_properties.g.dart';

// ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░

class BlurryOverlay extends StatelessWidget {
  //
  //
  //

  final VoidCallback? onTapBackground;
  final BlurryOverlayContainerProperties? properties;
  final Widget? child;

  static BlurryOverlayContainerProperties themeOf(BuildContext? context) {
    return DefaultThemes.of(context)?.themeOrNull<BlurryOverlayContainerProperties>() ??
        const BlurryOverlayContainerProperties(
          sigma: 1.0,
          color: Color.fromARGB(128, 0, 0, 0),
        );
  }

  //
  //
  //

  const BlurryOverlay({
    super.key,
    this.properties,
    this.onTapBackground,
    this.child,
  });

  //
  //
  //

  @override
  Widget build(BuildContext context) {
    final p = properties ?? themeOf(context);
    return Stack(
      fit: StackFit.expand,
      alignment: Alignment.center,
      children: [
        GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: onTapBackground,
          child: Container(
            color: p.color,
          ),
        ),
        Builder(
          builder: (context) {
            final sigma = p.sigma$;
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

// ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░

@GenerateDartModel(
  fields: {
    Field(
      fieldPath: ['sigma'],
      fieldType: double,
      nullable: false,
    ),
    Field(
      fieldPath: ['color'],
      fieldType: Color,
      nullable: false,
    ),
  },
  shouldInherit: true,
)
class _BlurryOverlayContainerProperties {
  const _BlurryOverlayContainerProperties();
}
