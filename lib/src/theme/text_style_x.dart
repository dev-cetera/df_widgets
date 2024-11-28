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

extension TextStyleX on TextStyle {
  TextStyle get wBlack => copyWith(fontWeight: FONT_WEIGHT_BLACK);
  TextStyle get wExtraBold => copyWith(fontWeight: FONT_WEIGHT_EXTRA_BOLD);
  TextStyle get wBold => copyWith(fontWeight: FONT_WEIGHT_BOLD);
  TextStyle get wSemiBold => copyWith(fontWeight: FONT_WEIGHT_SEMI_BOLD);
  TextStyle get wMedium => copyWith(fontWeight: FONT_WEIGHT_MEDIUM);
  TextStyle get wRegular => copyWith(fontWeight: FONT_WEIGHT_REGULAR);
  TextStyle get wLight => copyWith(fontWeight: FONT_WEIGHT_LIGHT);
  TextStyle get wExtraLight => copyWith(fontWeight: FONT_WEIGHT_EXTRA_LIGHT);
  TextStyle get wThin => copyWith(fontWeight: FONT_WEIGHT_THIN);
  TextStyle get wUnderlined => copyWith(decoration: TextDecoration.underline);
  TextStyle get wOverlined => copyWith(decoration: TextDecoration.overline);
  TextStyle get wLineThough => copyWith(decoration: TextDecoration.lineThrough);
  TextStyle get wItalic => copyWith(fontStyle: FontStyle.italic);
}

// ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░

const FONT_WEIGHT_BLACK = FontWeight.w900;
const FONT_WEIGHT_EXTRA_BOLD = FontWeight.w800;
const FONT_WEIGHT_BOLD = FontWeight.w700;
const FONT_WEIGHT_SEMI_BOLD = FontWeight.w600;
const FONT_WEIGHT_MEDIUM = FontWeight.w500;
const FONT_WEIGHT_REGULAR = FontWeight.w400;
const FONT_WEIGHT_LIGHT = FontWeight.w300;
const FONT_WEIGHT_EXTRA_LIGHT = FontWeight.w200;
const FONT_WEIGHT_THIN = FontWeight.w100;
