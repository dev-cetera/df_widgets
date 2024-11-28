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

// ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░

class BasicCountIndicator extends StatelessWidget {
  //
  //
  //

  final int count;
  final double? size;

  //
  //
  //

  const BasicCountIndicator({
    super.key,
    required this.count,
    this.size,
  });

  //
  //
  //

  @override
  Widget build(BuildContext context) {
    final dimension = size ?? 20.sc;
    if (count > 0) {
      return IgnorePointer(
        child: Container(
          height: dimension,
          alignment: Alignment.center,
          padding: EdgeInsets.symmetric(horizontal: 0.35 * dimension),
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.primary.withAlpha(128),
            borderRadius: BorderRadius.circular(0.5 * dimension),
          ),
          child: Text(
            count.toString(),
            style: TextStyle(
              color: Theme.of(context).scaffoldBackgroundColor,
              fontSize: 0.5 * dimension,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      );
    } else {
      return SizedBox.square(
        dimension: dimension,
      );
    }
  }
}
