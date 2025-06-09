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

import 'package:df_scalable/df_scalable.dart';
import 'package:flutter/material.dart';

import '../text_style_x.dart';

// ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░

class TextThemeA extends TextTheme {
  TextThemeA()
    : super(
        displayLarge: TextStyle(fontSize: 44.sc, fontWeight: FONT_WEIGHT_BLACK),
        displayMedium: TextStyle(
          fontSize: 37.sc,
          fontWeight: FONT_WEIGHT_BLACK,
        ),
        displaySmall: TextStyle(fontSize: 27.sc, fontWeight: FONT_WEIGHT_BLACK),
        headlineLarge: TextStyle(fontSize: 40.sc, fontWeight: FONT_WEIGHT_BOLD),
        headlineMedium: TextStyle(
          fontSize: 34.sc,
          fontWeight: FONT_WEIGHT_BOLD,
        ),
        headlineSmall: TextStyle(fontSize: 25.sc, fontWeight: FONT_WEIGHT_BOLD),
        titleLarge: TextStyle(fontSize: 23.sc, fontWeight: FONT_WEIGHT_BLACK),
        titleMedium: TextStyle(fontSize: 20.sc, fontWeight: FONT_WEIGHT_BLACK),
        titleSmall: TextStyle(fontSize: 17.sc, fontWeight: FONT_WEIGHT_BLACK),
        bodyLarge: TextStyle(fontSize: 16.sc, fontWeight: FONT_WEIGHT_REGULAR),
        bodyMedium: TextStyle(fontSize: 14.sc, fontWeight: FONT_WEIGHT_REGULAR),
        bodySmall: TextStyle(fontSize: 12.sc, fontWeight: FONT_WEIGHT_REGULAR),
        labelLarge: TextStyle(fontSize: 16.sc, fontWeight: FONT_WEIGHT_MEDIUM),
        labelMedium: TextStyle(fontSize: 14.sc, fontWeight: FONT_WEIGHT_MEDIUM),
        labelSmall: TextStyle(fontSize: 12.sc, fontWeight: FONT_WEIGHT_MEDIUM),
      );
}
