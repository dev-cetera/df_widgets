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

part '_blurry_container_properties.g.dart';

// ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░

class BlurryContainer extends StatelessWidget {
  //
  //
  //

  final BlurryContainerProperties? properties;
  final Widget? child;

  //
  //
  //

  static BlurryContainerProperties get _default =>
      const BlurryContainerProperties(
        decoration: BoxDecoration(),
        foregroundDecoration: BoxDecoration(),
        padding: EdgeInsets.zero,
        constraints: BoxConstraints(minWidth: 48.0, minHeight: 48.0),
        borderRadius: BorderRadius.zero,
      );

  static BlurryContainerProperties get theme =>
      DI.theme.getSyncOrNull<BlurryContainerProperties>()?.copyWith() ??
      _default;

  //
  //
  //

  const BlurryContainer({
    super.key,
    this.properties,
    this.child,
  });

  //
  //
  //

  @override
  Widget build(BuildContext context) {
    final p = properties ?? theme;
    final sigma = p.sigma ?? 3.0;
    final alpha = p.alpha ?? 128;
    return ClipRRect(
      borderRadius: p.borderRadius$,
      child: BackdropFilter(
        filter: ImageFilter.blur(
          sigmaX: sigma,
          sigmaY: sigma,
        ),
        child: Container(
          width: p.width,
          height: p.height,
          constraints: p.constraints,
          decoration: p.decoration$.copyWith(
            color: p.color?.withAlpha(alpha),
            borderRadius: p.borderRadius,
          ),
          padding: p.padding ?? EdgeInsets.zero,
          child: child,
        ),
      ),
    );
  }
}

// ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░

@GenerateDartModel(
  fields: {
    Field(
      fieldPath: ['width'],
      fieldType: double,
      nullable: true,
    ),
    Field(
      fieldPath: ['height'],
      fieldType: double,
      nullable: true,
    ),
    Field(
      fieldPath: ['sigma'],
      fieldType: double,
      nullable: true,
    ),
    Field(
      fieldPath: ['alpha'],
      fieldType: int,
      nullable: true,
    ),
    Field(
      fieldPath: ['color'],
      fieldType: Color,
      nullable: true,
    ),
    Field(
      fieldPath: ['decoration'],
      fieldType: BoxDecoration,
      nullable: false,
    ),
    Field(
      fieldPath: ['foregroundDecoration'],
      fieldType: BoxDecoration,
      nullable: false,
    ),
    Field(
      fieldPath: ['padding'],
      fieldType: EdgeInsets,
      nullable: false,
    ),
    Field(
      fieldPath: ['constraints'],
      fieldType: BoxConstraints,
      nullable: false,
    ),
    Field(
      fieldPath: ['borderRadius'],
      fieldType: BorderRadius,
      nullable: false,
    ),
  },
  shouldInherit: true,
)
class _BlurryContainerProperties {
  const _BlurryContainerProperties();
}
