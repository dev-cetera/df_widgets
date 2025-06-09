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

import 'dart:collection' show Queue;

import '/_common.dart';

// ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░

class DividedFlex extends Flex {
  //
  //
  //

  final Widget? firstIfNotEmpty;
  final Widget? divider;
  final Widget? lastIfNotEmpty;
  final List<Widget?>? elements;

  //
  //
  //

  const DividedFlex({
    super.key,
    MainAxisAlignment? mainAxisAlignment,
    MainAxisSize? mainAxisSize,
    CrossAxisAlignment? crossAxisAlignment,
    VerticalDirection? verticalDirection,
    Axis? direction,
    super.textDirection,
    super.textBaseline,
    this.firstIfNotEmpty,
    this.divider,
    this.lastIfNotEmpty,
    this.elements,
  }) : super(
         mainAxisAlignment: mainAxisAlignment ?? MainAxisAlignment.start,
         mainAxisSize: mainAxisSize ?? MainAxisSize.min,
         crossAxisAlignment: crossAxisAlignment ?? CrossAxisAlignment.start,
         verticalDirection: verticalDirection ?? VerticalDirection.down,
         direction: direction ?? Axis.horizontal,
       );

  //
  //
  //

  factory DividedFlex.column({
    Key? key,
    MainAxisAlignment? mainAxisAlignment,
    MainAxisSize? mainAxisSize,
    CrossAxisAlignment? crossAxisAlignment,
    VerticalDirection? verticalDirection,
    TextDirection? textDirection,
    TextBaseline? textBaseline,
    Widget? firstIfNotEmpty,
    Widget? divider,
    Widget? lastIfNotEmpty,
    List<Widget?>? children,
  }) {
    return DividedFlex(
      direction: Axis.vertical,
      key: key,
      mainAxisAlignment: mainAxisAlignment,
      mainAxisSize: mainAxisSize,
      crossAxisAlignment: crossAxisAlignment,
      verticalDirection: verticalDirection,
      textDirection: textDirection,
      textBaseline: textBaseline,
      firstIfNotEmpty: firstIfNotEmpty,
      divider: divider,
      lastIfNotEmpty: lastIfNotEmpty,
      elements: children,
    );
  }

  //
  //
  //

  factory DividedFlex.row({
    Key? key,
    MainAxisAlignment? mainAxisAlignment,
    MainAxisSize? mainAxisSize,
    CrossAxisAlignment? crossAxisAlignment,
    VerticalDirection? verticalDirection,
    TextDirection? textDirection,
    TextBaseline? textBaseline,
    Widget? firstIfNotEmpty,
    Widget? divider,
    Widget? lastIfNotEmpty,
    List<Widget?>? children,
  }) {
    return DividedFlex(
      direction: Axis.horizontal,
      key: key,
      mainAxisAlignment: mainAxisAlignment,
      mainAxisSize: mainAxisSize,
      crossAxisAlignment: crossAxisAlignment,
      verticalDirection: verticalDirection,
      textDirection: textDirection,
      textBaseline: textBaseline,
      firstIfNotEmpty: firstIfNotEmpty,
      divider: divider,
      lastIfNotEmpty: lastIfNotEmpty,
      elements: children,
    );
  }

  //
  //
  //

  DividedFlex copyWith({
    Key? key,
    MainAxisAlignment? mainAxisAlignment,
    MainAxisSize? mainAxisSize,
    CrossAxisAlignment? crossAxisAlignment,
    VerticalDirection? verticalDirection,
    Axis? direction,
    TextDirection? textDirection,
    TextBaseline? textBaseline,
    Widget? firstIfNotEmpty,
    Widget? divider,
    Widget? lastIfNotEmpty,
    List<Widget?>? elements,
  }) {
    return DividedFlex(
      key: key ?? this.key,
      mainAxisAlignment: mainAxisAlignment ?? this.mainAxisAlignment,
      mainAxisSize: mainAxisSize ?? this.mainAxisSize,
      crossAxisAlignment: crossAxisAlignment ?? this.crossAxisAlignment,
      verticalDirection: verticalDirection ?? this.verticalDirection,
      direction: direction ?? this.direction,
      textDirection: textDirection ?? this.textDirection,
      textBaseline: textBaseline ?? this.textBaseline,
      firstIfNotEmpty: firstIfNotEmpty ?? this.firstIfNotEmpty,
      divider: divider ?? this.divider,
      lastIfNotEmpty: lastIfNotEmpty ?? this.lastIfNotEmpty,
      elements: elements ?? this.elements,
    );
  }

  //
  //
  //

  @override
  List<Widget> get children {
    final elements = this.elements?.nonNulls ?? [];
    final result = Queue<Widget>();
    if (elements.isNotEmpty) {
      if (elements.length != 1) {
        final length = elements.length;
        for (var n = 0; n < length - 1; n++) {
          final e = elements.elementAt(n);
          result.add(e);
          if (divider != null) {
            result.add(divider!);
          }
        }
        final last = elements.last;
        result.add(last);
      } else {
        final first = elements.first;
        result.add(first);
      }
      if (firstIfNotEmpty != null) {
        result.addFirst(firstIfNotEmpty!);
      }
      if (lastIfNotEmpty != null) {
        result.addLast(lastIfNotEmpty!);
      }
    }

    return result.toList();
  }
}
