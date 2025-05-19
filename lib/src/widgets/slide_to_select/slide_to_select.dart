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

import 'package:flutter/widgets.dart';

// ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░

class SlideToSelect extends StatefulWidget {
  //
  //
  //

  final int itemLength;
  final Widget? child;
  final void Function(int selectedIndex)? onSelectionChanged;
  final Axis? axis;

  //
  //
  //

  const SlideToSelect({
    super.key,
    required this.itemLength,
    this.child,
    this.onSelectionChanged,
    this.axis = Axis.horizontal,
  });

  //
  //
  //

  @override
  _State createState() => _State();
}

// ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░

class _State extends State<SlideToSelect> {
  //
  //
  //

  int? _selectedIndex;

  //
  //
  //

  @override
  Widget build(BuildContext context) {
    final axis = widget.axis ?? Axis.horizontal;
    return LayoutBuilder(
      builder: (context, constraints) {
        return GestureDetector(
          onHorizontalDragUpdate: (details) {
            final delta = axis == Axis.horizontal
                ? details.localPosition.dx
                : details.localPosition.dy;
            final axisLength = axis == Axis.horizontal
                ? constraints.maxWidth
                : constraints.maxHeight;
            final index = delta ~/ (axisLength / widget.itemLength);
            if (index != _selectedIndex) {
              _selectedIndex = index;
              widget.onSelectionChanged?.call(index);
            }
          },
          child: widget.child,
        );
      },
    );
  }
}
