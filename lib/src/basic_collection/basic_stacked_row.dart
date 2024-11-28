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

import 'dart:math' as math;

import 'package:flutter/material.dart';

import '/_common.dart';

// ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░

class BasicStackedRow extends StatelessWidget {
  //
  //
  //

  final double? elementWidth;
  final double? offset;
  final List<Widget> children;

  //
  //
  //

  const BasicStackedRow({
    super.key,
    this.elementWidth,
    this.offset,
    required this.children,
  });

  //
  //
  //

  @override
  Widget build(BuildContext context) {
    final offset1 = offset ?? 20.sc;
    final elementWidth1 = elementWidth ?? 30.sc;
    final s1 = math.max(elementWidth1, 16.sc);
    final s2 = math.max(s1 - 8.sc, 8.sc);
    final children1 = <Widget>[];
    final l = math.min(children1.length, 3);
    for (var i = 0; i < l; i++) {
      final margin = i * offset1;
      children1.add(
        Positioned(
          left: margin,
          child: SizedBox.square(
            dimension: s2,
            child: children[i],
          ),
        ),
      );
    }
    if (children.length > l) {
      final margin = l * offset1 + 8.sc;
      children1.add(
        Positioned(
          left: margin,
          child: Container(
            height: s2,
            width: s2,
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.onSurface.withAlpha(192),
              shape: BoxShape.circle,
            ),
            alignment: Alignment.center,
            child: Padding(
              padding: EdgeInsets.all(4.sc),
              child: Text(
                '+${children.length - l}',
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: Theme.of(context).colorScheme.surface,
                    ),
              ),
            ),
          ),
        ),
      );
    }
    return SizedBox(
      height: s1,
      width: s1 + (children.length > l ? l + 1 : l) * offset1,
      child: Stack(
        alignment: Alignment.centerLeft,
        children: children1,
      ),
    );
  }
}
