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

import '/_common.dart';

part '_tag_properties.g.dart';

// ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░

class Tag extends StatelessWidget {
  //
  //
  //

  final String text;
  final void Function()? onTap;
  final TagProperties? properties;

  //
  //
  //

  static TagProperties themeOf(BuildContext? context) {
    return DefaultThemes.of(context)?.themeOrNull<TagProperties>() ??
        TagProperties(
          backgroundColor: null,
          textStyle: null,
          padding: EdgeInsets.symmetric(vertical: 4.sc, horizontal: 6.sc),
          margin: EdgeInsets.zero,
          borderRadius: BorderRadius.circular(4.sc),
        );
  }

  //
  //
  //

  const Tag({super.key, required this.text, this.onTap, this.properties});

  //
  //
  //

  @override
  Widget build(BuildContext context) {
    final p = properties ?? Tag.themeOf(context);
    return text.isNotEmpty
        ? TapBox(
            onTap: onTap,
            child: Container(
              decoration: BoxDecoration(
                color:
                    p.backgroundColor ??
                    Theme.of(context).colorScheme.secondary.withAlpha(64),
                borderRadius: p.borderRadius ?? BorderRadius.circular(4.sc),
              ),
              margin: p.margin ?? EdgeInsets.zero,
              padding:
                  p.padding ??
                  EdgeInsets.symmetric(vertical: 4.sc, horizontal: 6.sc),
              child: Text(
                text,
                style:
                    p.textStyle ??
                    Theme.of(context).textTheme.bodySmall?.wMedium,
              ),
            ),
          )
        : const SizedBox();
  }
}

// ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░

@GenerateDartModel(
  fields: {
    Field(fieldPath: ['backgroundColor'], fieldType: Color, nullable: false),
    Field(fieldPath: ['textStyle'], fieldType: TextStyle, nullable: false),
    Field(fieldPath: ['padding'], fieldType: EdgeInsets, nullable: false),
    Field(fieldPath: ['margin'], fieldType: EdgeInsets, nullable: false),
    Field(
      fieldPath: ['borderRadius'],
      fieldType: BorderRadius,
      nullable: false,
    ),
  },
  shouldInherit: true,
)
class _TagProperties {
  const _TagProperties();
}
