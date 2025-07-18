//.title
// ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓
//
// Copyright © dev-cetera.com & contributors.
//
// The use of this source code is governed by an MIT-style license described in
// the LICENSE file located in this project's root directory.
//
// See: https://opensource.org/license/mit
//
// ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓
//.title~

import 'package:flutter/rendering.dart';

// ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░

class DiagonalStripesPainter extends CustomPainter {
  //
  //
  //

  final double lineThickness;
  final Color color;
  final double spacing;

  //
  //
  //

  DiagonalStripesPainter({
    this.lineThickness = 2.0,
    this.color = const Color(0xFF000000),
    this.spacing = 10.0,
  });

  //
  //
  //

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.stroke
      ..strokeWidth = lineThickness;

    var start = -size.height;
    while (start < size.width) {
      // Draw each line from bottom-left to top-right
      final p1 = Offset(start, size.height);
      final p2 = Offset(start + size.height, 0);
      canvas.drawLine(p1, p2, paint);
      start += spacing;
    }
  }

  //
  //
  //

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
