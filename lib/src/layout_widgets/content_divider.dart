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

import 'package:df_scalable/df_scalable.dart';
import 'package:flutter/widgets.dart';

import 'package:flutter/material.dart' show Theme;

// ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░

class ContentDivider extends StatelessWidget {
  //
  //
  //

  final double? thickness;
  final Color? color;
  final double? size;
  final Axis? orientation;
  final bool? overflow;
  final double? childMainAxisPadding;
  final ContentDividerAlignment? childAlignment;
  final BoxDecoration? childDecoration;
  final Widget? child;

  //
  //
  //

  const ContentDivider({
    super.key,
    this.thickness,
    this.color,
    this.size,
    this.orientation,
    this.overflow,
    this.childMainAxisPadding,
    this.childAlignment,
    this.childDecoration,
    this.child,
  });

  //
  //
  //

  factory ContentDivider.horizontal({
    Key? key,
    double? thickness,
    Color? color,
    double? size,
    bool? overflow,
    double? childMainAxisPadding,
    ContentDividerAlignment? childAlignment,
    BoxDecoration? childDecoration,
    Widget? child,
  }) {
    return ContentDivider(
      key: key,
      thickness: thickness,
      color: color,
      size: size,
      orientation: Axis.horizontal,
      overflow: overflow,
      childMainAxisPadding: childMainAxisPadding,
      childAlignment: childAlignment,
      childDecoration: childDecoration,
      child: child,
    );
  }

  //
  //
  //

  factory ContentDivider.vertical({
    Key? key,
    double? thickness,
    Color? color,
    double? size,
    bool? overflow,
    double? childMainAxisPadding,
    ContentDividerAlignment? childAlignment,
    BoxDecoration? childDecoration,
    Widget? child,
  }) {
    return ContentDivider(
      key: key,
      thickness: thickness,
      color: color,
      size: size,
      orientation: Axis.vertical,
      overflow: overflow,
      childMainAxisPadding: childMainAxisPadding,
      childAlignment: childAlignment,
      childDecoration: childDecoration,
      child: child,
    );
  }

  //
  //
  //

  @override
  Widget build(BuildContext context) {
    final orientation1 = orientation ?? Axis.horizontal;
    final thickness1 = thickness ?? 1.sc;
    final size1 = math.max(thickness1, size ?? thickness1);
    final spacing1 = childMainAxisPadding ?? 8.sc;
    final color1 = color ?? Theme.of(context).colorScheme.outline;
    final childAlignment1 =
        childAlignment?.toAlignment(orientation1) ?? Alignment.center;
    final vertical = orientation1 == Axis.vertical;
    final horizontal = orientation1 == Axis.horizontal;
    final screenSize = MediaQuery.of(context).size;
    final container = horizontal
        ? Container(
            width: double.infinity,
            height: thickness1,
            color: color1,
          )
        : Container(
            width: thickness1,
            height: double.infinity,
            color: color1,
          );
    final $overflow = overflow ?? false;
    final stack = Stack(
      alignment: Alignment.center,
      children: [
        container,
        if (child != null)
          Align(
            alignment: childAlignment1,
            child: IntrinsicHeight(
              child: IntrinsicWidth(
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: vertical ? spacing1 : 0.0,
                    horizontal: horizontal ? spacing1 : 0.0,
                  ),
                  child: Container(
                    height: horizontal ? size1 : null,
                    width: vertical ? size1 : null,
                    decoration:
                        (childDecoration ?? const BoxDecoration()).copyWith(
                      color: childDecoration?.color,
                      borderRadius: childDecoration?.borderRadius ??
                          BorderRadius.circular(math.max(8.sc, 0.25 * size1)),
                    ),
                    alignment: Alignment.center,
                    child: child!,
                  ),
                ),
              ),
            ),
          ),
      ],
    );
    final line = $overflow
        ? OverflowBox(
            maxWidth: horizontal ? screenSize.width : null,
            maxHeight: vertical ? screenSize.height : null,
            child: stack,
          )
        : stack;
    final result = SizedBox(
      width: vertical ? size1 : null,
      height: horizontal ? size1 : null,
      child: line,
    );
    return result;
  }
}

// ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░

enum ContentDividerAlignment {
  //
  //
  //

  START,
  CENTER,
  END;

  //
  //
  //

  Alignment toAlignment(Axis axis) {
    switch (this) {
      case ContentDividerAlignment.START:
        return axis == Axis.horizontal
            ? Alignment.centerLeft
            : Alignment.topCenter;
      case ContentDividerAlignment.CENTER:
        return Alignment.center;
      case ContentDividerAlignment.END:
        return axis == Axis.horizontal
            ? Alignment.centerRight
            : Alignment.bottomCenter;
    }
  }
}
