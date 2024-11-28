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

  static TagProperties get _default => TagProperties(
        backgroundColor: null,
        textStyle: null,
        padding: EdgeInsets.symmetric(vertical: 4.sc, horizontal: 6.sc),
        margin: EdgeInsets.zero,
        borderRadius: BorderRadius.circular(4.sc),
      );

  static TagProperties get theme =>
      DI.theme.getSyncOrNull<TagProperties>()?.copyWith() ?? _default;

  //
  //
  //

  const Tag({
    super.key,
    required this.text,
    this.onTap,
    this.properties,
  });

  //
  //
  //

  @override
  Widget build(BuildContext context) {
    return text.isNotEmpty
        ? TapBox(
            onTap: onTap,
            child: Container(
              decoration: BoxDecoration(
                color: properties?.backgroundColor ??
                    Theme.of(context).colorScheme.secondary.withAlpha(64),
                borderRadius:
                    properties?.borderRadius ?? BorderRadius.circular(4.sc),
              ),
              margin: properties?.margin ?? EdgeInsets.zero,
              padding: properties?.padding ??
                  EdgeInsets.symmetric(vertical: 4.sc, horizontal: 6.sc),
              child: Text(
                text,
                style: properties?.textStyle ??
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
    Field(
      fieldPath: ['backgroundColor'],
      fieldType: Color,
      nullable: false,
    ),
    Field(
      fieldPath: ['textStyle'],
      fieldType: TextStyle,
      nullable: false,
    ),
    Field(
      fieldPath: ['padding'],
      fieldType: EdgeInsets,
      nullable: false,
    ),
    Field(
      fieldPath: ['margin'],
      fieldType: EdgeInsets,
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
class _TagProperties {
  const _TagProperties();
}
