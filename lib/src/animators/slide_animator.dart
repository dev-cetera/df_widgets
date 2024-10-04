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

import '/_common.dart';

// ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░

class SlideAnimator extends StatefulWidget {
  //
  //
  //

  final Widget? child;
  final Color color;
  final Duration delay;
  final Duration duration;
  final Curve curve;
  final SlideAnimatorDirection direction;
  final double extent;

  //
  //
  //

  const SlideAnimator({
    super.key,
    this.child,
    this.color = const Color(0x00000000),
    this.delay = const Duration(milliseconds: 0),
    this.direction = SlideAnimatorDirection.BOTTOM_TO_TOP,
    this.curve = Curves.easeInOutCirc,
    this.duration = const Duration(milliseconds: 250),
    this.extent = 0.25,
  });

  //
  //
  //

  @override
  _State createState() => _State();
}

// ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░

class _State extends State<SlideAnimator> with SingleTickerProviderStateMixin {
  //
  //
  //

  late final _controller = AnimationController(
    vsync: this,
    duration: widget.duration,
  );

  late final _extent = widget.extent.abs();

  late final _animation = Tween<Offset>(
    begin: Offset(
      widget.direction == SlideAnimatorDirection.RIGHT_TO_LEFT
          ? _extent
          : widget.direction == SlideAnimatorDirection.LEFT_TO_RIGHT
              ? -_extent
              : 0.0,
      widget.direction == SlideAnimatorDirection.BOTTOM_TO_TOP
          ? _extent
          : widget.direction == SlideAnimatorDirection.TOP_TO_BOTTOM
              ? -_extent
              : 0.0,
    ),
    end: const Offset(0.0, 0.0),
  ).animate(
    CurvedAnimation(
      parent: _controller,
      curve: widget.curve,
    ),
  );

  //
  //
  //

  @override
  void initState() {
    Future.delayed(widget.delay, () {
      if (mounted) {
        _controller.forward();
      }
    });
    super.initState();
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
    return Container(
      color: widget.color,
      child: SlideTransition(
        position: _animation,
        child: widget.child,
      ),
    );
  }
}

// ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░

enum SlideAnimatorDirection {
  LEFT_TO_RIGHT,
  RIGHT_TO_LEFT,
  BOTTOM_TO_TOP,
  TOP_TO_BOTTOM,
}