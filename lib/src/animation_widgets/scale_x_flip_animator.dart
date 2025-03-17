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

import 'package:flutter/material.dart';

// ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░

class ScaleXFlipAnimator extends StatefulWidget {
  //
  //
  //

  final Widget child;
  final double rpm; // Rotations per minute, controlling the speed of the flip
  final double minScale; // Minimum scale factor in the x-direction
  final double maxScale; // Maximum scale factor in the x-direction
  final Curve curve; // Curve for the scaling animation

  //
  //
  //

  const ScaleXFlipAnimator({
    super.key,
    required this.child,
    this.rpm = 30.0, // Default speed: 30 "flips" per minute
    this.minScale = 0.0, // Default minimum scale (fully collapsed)
    this.maxScale = 1.0, // Default maximum scale (normal size)
    this.curve = Curves.linear, // Default curve for smooth scaling
  });

  //
  //
  //

  @override
  _State createState() => _State();
}

// ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░

class _State extends State<ScaleXFlipAnimator> with SingleTickerProviderStateMixin {
  //
  //
  //

  late final AnimationController _controller;
  late final Animation<double> _animation;

  //
  //
  //

  @override
  void initState() {
    super.initState();
    // Initialize the AnimationController with a duration based on RPM.
    // Each "flip" cycle (scale from min to max and back) should take 60/rpm seconds.
    _controller = AnimationController(
      duration: Duration(seconds: (60.0 / widget.rpm).round()),
      vsync: this,
    )..repeat(reverse: true); // Repeat with reverse to create an oscillating effect.

    // Apply the curve to the animation for smooth scaling.
    _animation = CurvedAnimation(
      parent: _controller,
      curve: widget.curve,
    );
  }

  //
  //
  //

  @override
  void dispose() {
    _controller.dispose(); // Clean up the controller to prevent memory leaks.
    super.dispose();
  }

  //
  //
  //

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animation,
      builder: (context, child) {
        // Calculate the current scale factor based on the animation value.
        // The scale oscillates between minScale and maxScale.
        final scaleX = widget.minScale + (widget.maxScale - widget.minScale) * _animation.value;

        return Transform.scale(
          scaleX: scaleX, // Scale only in the x-direction.
          scaleY: 1.0, // Keep the y-direction unchanged.
          child: widget.child,
        );
      },
      child: widget.child,
    );
  }
}
