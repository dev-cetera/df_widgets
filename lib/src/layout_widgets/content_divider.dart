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

import 'dart:math' as math;

import 'package:df_scalable/df_scalable.dart';
import 'package:flutter/widgets.dart';

import 'package:flutter/material.dart' show Theme;

// ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░

// TODO: Vertical not working!
class ContentDivider extends StatelessWidget {
  //
  //
  //

  final double? thickness;
  final Color? color;
  final double? size;
  final double? startSpacing;
  final double? betweenSpacing;
  final double? endSpacing;
  final Axis? orientation;
  final bool overflow;
  final List<ContentDividerChild> children;

  //
  //
  //

  const ContentDivider({
    super.key,
    this.thickness,
    this.color,
    this.size,
    this.startSpacing,
    this.betweenSpacing,
    this.endSpacing,
    this.orientation,
    this.overflow = false,
    this.children = const [],
  });

  //
  //
  //

  factory ContentDivider.horizontal({
    Key? key,
    double? thickness,
    Color? color,
    double? size,
    double? startSpacing,
    double? betweenSpacing,
    double? endSpacing,
    bool overflow = false,
    List<ContentDividerChild> children = const [],
  }) {
    return ContentDivider(
      key: key,
      thickness: thickness,
      color: color,
      size: size,
      startSpacing: startSpacing,
      betweenSpacing: betweenSpacing,
      endSpacing: endSpacing,
      orientation: Axis.horizontal,
      overflow: overflow,
      children: children,
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
    double? startSpacing,
    double? betweenSpacing,
    double? endSpacing,
    bool overflow = false,
    List<ContentDividerChild> children = const [],
  }) {
    return ContentDivider(
      key: key,
      thickness: thickness,
      color: color,
      size: size,
      startSpacing: startSpacing,
      betweenSpacing: betweenSpacing,
      endSpacing: endSpacing,
      orientation: Axis.vertical,
      overflow: overflow,
      children: children,
    );
  }

  //
  //
  //

  @override
  @override
  Widget build(BuildContext context) {
    final orientation1 = orientation ?? Axis.horizontal;
    final thickness1 = thickness ?? 1.sc;
    final size1 = math.max(thickness1, size ?? thickness1);

    final color1 = color ?? Theme.of(context).colorScheme.outline;
    final vertical = orientation1 == Axis.vertical;
    final horizontal = orientation1 == Axis.horizontal;

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

    Widget childBuilder(ContentDividerChild child) {
      return Padding(
        padding: EdgeInsets.only(
          left: horizontal ? startSpacing ?? 8.sc : 0.0,
          right: horizontal ? endSpacing ?? 8.sc : 0.0,
          top: vertical ? startSpacing ?? 8.sc : 0.0,
          bottom: vertical ? endSpacing ?? 8.sc : 0.0,
        ),
        child: Container(
          decoration: (child.decoration ?? const BoxDecoration()).copyWith(
            borderRadius: child.decoration?.borderRadius ??
                BorderRadius.circular(math.max(8.sc, 0.25 * size1)),
          ),
          alignment: Alignment.center,
          child: child,
        ),
      );
    }

    final startChildren = children
        .where((e) => e.alignment == ContentDividerAlignment.START)
        .map(childBuilder)
        .toList();
    final centerChildren = children
        .where((e) => e.alignment == ContentDividerAlignment.CENTER)
        .map(childBuilder)
        .toList();
    final endChildren = children
        .where((e) => e.alignment == ContentDividerAlignment.END)
        .map(childBuilder)
        .toList();

    final screenSize = MediaQuery.of(context).size;

    Widget buildChildren(List<Widget> children, Alignment alignment) {
      return Align(
        alignment: alignment,
        child: Flex(
          direction: horizontal ? Axis.horizontal : Axis.vertical,
          mainAxisSize: MainAxisSize.min,
          children: children,
        ),
      );
    }

    final stack = Stack(
      clipBehavior: Clip.none,
      alignment: Alignment.center,
      children: [
        container,
        if (startChildren.isNotEmpty)
          buildChildren(
            startChildren,
            horizontal ? Alignment.centerLeft : Alignment.topCenter,
          ),
        if (centerChildren.isNotEmpty)
          buildChildren(centerChildren, Alignment.center),
        if (endChildren.isNotEmpty)
          buildChildren(
            endChildren,
            horizontal ? Alignment.centerRight : Alignment.bottomCenter,
          ),
      ],
    );

    return overflow
        ? SizedBox(
            width: horizontal ? screenSize.width : size1,
            height: vertical ? screenSize.height : size1,
            child: OverflowBox(
              maxWidth: screenSize.width,
              maxHeight: screenSize.height,
              child: stack,
            ),
          )
        : stack;
  }
}

// ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░

class ContentDividerChild extends StatelessWidget {
  final Widget child;
  final BoxDecoration? decoration;
  final EdgeInsets? padding;
  final ContentDividerAlignment alignment;

  const ContentDividerChild({
    super.key,
    required this.child,
    this.decoration,
    this.padding,
    this.alignment = ContentDividerAlignment.START,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding ?? EdgeInsets.zero,
      child: Container(
        decoration: decoration ?? const BoxDecoration(),
        child: child,
      ),
    );
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
