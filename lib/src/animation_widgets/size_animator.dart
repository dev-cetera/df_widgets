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

import '/_common.dart';

// ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░

class SizeAnimator extends StatefulWidget {
  //
  //
  //

  final Widget child;
  final Duration delay;
  final Duration duration;
  final Curve curve;
  final double begin;
  final double end;
  final SizeAnimatorDirection direction;

  //
  //
  //

  const SizeAnimator({
    super.key,
    required this.child,
    this.delay = const Duration(milliseconds: 0),
    this.duration = const Duration(milliseconds: 500),
    this.curve = Curves.linear,
    this.begin = 0.5,
    this.end = 1.0,
    this.direction = SizeAnimatorDirection.TOP_TO_BOTTOM,
  });

  //
  //
  //

  @override
  _State createState() => _State();
}

// ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░

class _State extends State<SizeAnimator> with SingleTickerProviderStateMixin {
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
    _controller = AnimationController(vsync: this, duration: widget.duration);
    Future.delayed(widget.delay, () {
      if (mounted) {
        _controller.forward();
      }
    });
    _animation = Tween<double>(
      begin: widget.begin,
      end: widget.end,
    ).animate(CurvedAnimation(parent: _controller, curve: widget.curve));
  }

  //
  //
  //

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  //
  //
  //

  @override
  Widget build(BuildContext context) {
    Axis axis;
    double axisAlignment;

    switch (widget.direction) {
      case SizeAnimatorDirection.TOP_TO_BOTTOM:
        axis = Axis.vertical;
        axisAlignment = -1.0;
        break;
      case SizeAnimatorDirection.BOTTOM_TO_TOP:
        axis = Axis.vertical;
        axisAlignment = 1.0;
        break;
      case SizeAnimatorDirection.LEFT_TO_RIGHT:
        axis = Axis.horizontal;
        axisAlignment = -1.0;
        break;
      case SizeAnimatorDirection.RIGHT_TO_LEFT:
        axis = Axis.horizontal;
        axisAlignment = 1.0;
        break;
      case SizeAnimatorDirection.CENTER:
        axis = Axis.horizontal;
        axisAlignment = 0.0;
        break;
    }

    return SizeTransition(
      sizeFactor: _animation,
      axisAlignment: axisAlignment,
      axis: axis,
      child: widget.child,
    );
  }
}

// ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░

enum SizeAnimatorDirection {
  TOP_TO_BOTTOM,
  BOTTOM_TO_TOP,
  LEFT_TO_RIGHT,
  RIGHT_TO_LEFT,
  CENTER,
}
