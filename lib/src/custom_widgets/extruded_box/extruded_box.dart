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

import 'dart:math';

import 'package:flutter/material.dart';

import '/_common.dart';

part '_extruded_box_properties.g.dart';

// ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░

class ExtrudedBox extends StatelessWidget {
  final Widget? endChild;
  final Widget? child;

  final ExtrudedBoxProperties? properties;

  static ExtrudedBoxProperties themeOf(BuildContext? context) {
    return DefaultThemes.of(context)?.themeOrNull<ExtrudedBoxProperties>() ??
        ExtrudedBoxProperties(
          value: 1.0,
          color: const Color.fromARGB(128, 0, 0, 0),
          angle: 55.0,
          border: const OutlineInputBorder(),
          perspectiveDepth: 0.0,
          max: 6.sc,
        );
  }

  const ExtrudedBox({super.key, this.properties, this.endChild, this.child});

  @override
  Widget build(BuildContext context) {
    final p = properties ?? themeOf(context);
    final max = (p.max ?? 12.sc).round();
    final extrusion = (max * p.value$).round();
    final border =
        p.border ??
        OutlineInputBorder(borderRadius: BorderRadius.circular(8.sc));
    final angleInRadians = (p.angle$ % 360) * pi / 180;
    final ax = cos(angleInRadians);
    final ay = sin(angleInRadians);
    final px = max * ax;
    final py = max * ay;
    final extraLeft = px < 0 ? -px : 0.0;
    final extraTop = py < 0 ? -py : 0.0;
    final extraRight = px > 0 ? px : 0.0;
    final extraBottom = py > 0 ? py : 0.0;
    final rx = extrusion * ax;
    final ry = extrusion * ay;
    return Padding(
      padding: EdgeInsets.only(
        left: extraLeft,
        top: extraTop,
        right: extraRight,
        bottom: extraBottom,
      ),
      child: Transform.translate(
        offset: Offset(px - rx, py - ry),
        child: CustomPaint(
          painter: ExtrudedBoxPainter(
            border: border,
            color: p.color$,
            extrusion: extrusion,
            angle: p.angle$,
            perspectiveDepth: p.perspectiveDepth$,
          ),
          child: ClipPath(
            clipper: ShapeBorderClipper(shape: border),
            child: child,
          ),
        ),
      ),
    );
  }
}

// ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░

@GenerateDartModel(
  fields: {
    Field(fieldPath: ['perspectiveDepth'], fieldType: double, nullable: false),
    Field(fieldPath: ['color'], fieldType: Color, nullable: false),
    Field(fieldPath: ['value'], fieldType: double, nullable: false),
    Field(fieldPath: ['max'], fieldType: double, nullable: true),
    Field(fieldPath: ['angle'], fieldType: double, nullable: false),
    Field(fieldPath: ['border'], fieldType: ShapeBorder, nullable: true),
  },
  shouldInherit: true,
)
class _ExtrudedBoxProperties {
  const _ExtrudedBoxProperties();
}

// ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░

class ExtrudedBoxPainter extends CustomPainter {
  final Color color;
  final int extrusion;
  final ShapeBorder border;
  final double angle;
  final double perspectiveDepth;

  ExtrudedBoxPainter({
    required this.border,
    required this.color,
    required this.extrusion,
    required this.angle,
    this.perspectiveDepth = 0.0,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..color = color;

    // Get the path based on the given shapeBorder.
    final path = border.getOuterPath(
      Rect.fromLTWH(0, 0, size.width, size.height),
    );

    // Convert angle to radians for trigonometric calculations.
    final angleInRadians = (angle % 360) * pi / 180;
    final dx = cos(angleInRadians);
    final dy = sin(angleInRadians);

    // Drawing the original shape first
    canvas.drawPath(path, paint);

    // Drawing multiple shifted shapes to simulate the extrusion effect
    for (var i = 1; i <= extrusion; i++) {
      canvas.save();

      // Create a scaled-down path for the extrusion effect
      final scaleFactor =
          max(0, 1 - (i * perspectiveDepth / 1000.0)).toDouble();
      final shiftedPath = Path.from(path);

      // Translate the path inward based on the extrusion
      canvas.translate(i * dx, i * dy);

      // Scale down the path to simulate extrusion inward
      canvas.scale(scaleFactor);

      // Draw the shifted path
      canvas.drawPath(shiftedPath, paint);
      canvas.restore();
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
