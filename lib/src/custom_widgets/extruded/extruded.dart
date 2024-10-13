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

import 'dart:math';

import '/_common.dart';

part '_extruded_properties.g.dart';

// ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░

class Extruded extends StatelessWidget {
  final Widget? endChild;
  final Widget? child;

  final ExtrudedProperties properties;

  static const DEFAULT_PROPERTIES = ExtrudedProperties(
    showExtrusion: true,
    color: Color.fromARGB(128, 0, 0, 0),
    angle: 55.0,
    border: LinearBorder(),
  );

  const Extruded({
    super.key,
    this.properties = DEFAULT_PROPERTIES,
    this.endChild,
    this.child,
  });

  @override
  Widget build(BuildContext context) {
    final extrusion = (properties.extrusion ?? 6.sc).round();
    return Stack(
      alignment: Alignment.center,
      children: [
        Visibility.maintain(
          visible: properties.showExtrusion$,
          child: CustomPaint(
            painter: ExtrudedPainter(
              border: properties.border$,
              color: properties.color$,
              extrusion: extrusion,
              angle: properties.angle$,
            ),
            child: ClipPath(
              clipper: ShapeBorderClipper(
                shape: properties.border$,
              ),
              child: child,
            ),
          ),
        ),
        if (endChild != null)
          Visibility.maintain(
            visible: !properties.showExtrusion$,
            child: Builder(
              builder: (context) {
                final extrusion = (properties.extrusion ?? 6.sc).round();
                final angleInRadians = (properties.angle$ % 360) * pi / 180;

                // Calculate the translation
                final dx = 2.0 * extrusion * cos(angleInRadians);
                final dy = 2.0 * extrusion * sin(angleInRadians);

                // Add padding only in the directions needed to avoid clipping
                final extraLeft = dx < 0 ? -dx : 0.0;
                final extraTop = dy < 0 ? -dy : 0.0;
                final extraRight = dx > 0 ? dx : 0.0;
                final extraBottom = dy > 0 ? dy : 0.0;

                return Padding(
                  padding: EdgeInsets.only(
                    left: extraLeft,
                    top: extraTop,
                    right: extraRight,
                    bottom: extraBottom,
                  ),
                  child: Transform.translate(
                    offset: Offset(dx, dy),
                    child: ClipPath(
                      clipper: ShapeBorderClipper(
                        shape: properties.border$,
                      ),
                      child: endChild,
                    ),
                  ),
                );
              },
            ),
          ),
      ],
    );
  }
}

// ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░

@GenerateDartModel(
  fields: {
    Field(
      fieldPath: ['showExtrusion'],
      fieldType: bool,
      nullable: false,
    ),
    Field(
      fieldPath: ['color'],
      fieldType: Color,
      nullable: false,
    ),
    Field(
      fieldPath: ['extrusion'],
      fieldType: double,
      nullable: true,
    ),
    Field(
      fieldPath: ['angle'],
      fieldType: double,
      nullable: false,
    ),
    Field(
      fieldPath: ['border'],
      fieldType: ShapeBorder,
      nullable: false,
    ),
  },
  shouldInherit: true,
)
class _ExtrudedProperties {
  const _ExtrudedProperties();
}

// ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░

class ExtrudedPainter extends CustomPainter {
  final Color color;
  final int extrusion;
  final ShapeBorder border;
  final double angle;

  ExtrudedPainter({
    required this.border,
    required this.color,
    required this.extrusion,
    required this.angle,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..color = color;

    // Get the path based on the given shapeBorder.
    final path = border.getOuterPath(Rect.fromLTWH(0, 0, size.width, size.height));

    // Convert angle to radians for trigonometric calculations.
    final normalizedAngle = angle % 360;
    final angleInRadians = normalizedAngle * pi / 180;

    // Precompute x and y translation values based on the angle.
    final dx = cos(angleInRadians);
    final dy = sin(angleInRadians);

    // Drawing multiple shifted shapes to simulate smear effect.
    for (var i = 1; i <= extrusion; i++) {
      canvas.save();

      // Translate by 'i' pixels in the direction of the specified angle.
      canvas.translate(i * dx, i * dy);
      canvas.drawPath(path, paint);
      canvas.restore();
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
