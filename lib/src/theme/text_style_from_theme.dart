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

// ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░

class TextStyleFromTheme {
  //
  //
  //

  final TextStyle? Function(BuildContext context) of;

  //
  //
  //

  const TextStyleFromTheme._a(this.of);

  factory TextStyleFromTheme._b(
    TextStyle? Function(TextTheme data) converter,
  ) {
    return TextStyleFromTheme._a(
      (context) => converter(Theme.of(context).textTheme),
    );
  }

  factory TextStyleFromTheme.displayLarge() => TextStyleFromTheme._b((e) => e.displayLarge);
  factory TextStyleFromTheme.displayMedium() => TextStyleFromTheme._b((e) => e.displayMedium);
  factory TextStyleFromTheme.displaySmall() => TextStyleFromTheme._b((e) => e.displaySmall);
  factory TextStyleFromTheme.headlineLarge() => TextStyleFromTheme._b((e) => e.headlineLarge);
  factory TextStyleFromTheme.headlineMedium() => TextStyleFromTheme._b((e) => e.headlineMedium);
  factory TextStyleFromTheme.headlineSmall() => TextStyleFromTheme._b((e) => e.headlineSmall);
  factory TextStyleFromTheme.titleLarge() => TextStyleFromTheme._b((e) => e.titleLarge);
  factory TextStyleFromTheme.titleMedium() => TextStyleFromTheme._b((e) => e.titleMedium);
  factory TextStyleFromTheme.titleSmall() => TextStyleFromTheme._b((e) => e.titleSmall);
  factory TextStyleFromTheme.bodyLarge() => TextStyleFromTheme._b((e) => e.bodyLarge);
  factory TextStyleFromTheme.bodyMedium() => TextStyleFromTheme._b((e) => e.bodyMedium);
  factory TextStyleFromTheme.bodySmall() => TextStyleFromTheme._b((e) => e.bodySmall);
  factory TextStyleFromTheme.labelLarge() => TextStyleFromTheme._b((e) => e.labelLarge);
  factory TextStyleFromTheme.labelMedium() => TextStyleFromTheme._b((e) => e.labelMedium);
  factory TextStyleFromTheme.labelSmall() => TextStyleFromTheme._b((e) => e.labelSmall);
}
