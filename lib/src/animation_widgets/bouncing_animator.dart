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

class BouncingAnimator extends StatefulWidget {
  //
  //
  //

  final Widget child;
  final bool bounce;
  final double beginSize;
  final double endSize;
  final Curve curve;

  //
  //
  //

  const BouncingAnimator({
    super.key,
    this.bounce = true,
    required this.child,
    this.beginSize = 0.0,
    this.endSize = 24.0,
    this.curve = Curves.easeOutQuad,
  });

  //
  //
  //

  @override
  _State createState() => _State();
}

// ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░

class _State extends State<BouncingAnimator>
    with SingleTickerProviderStateMixin {
  //
  //
  //

  late AnimationController _controller;
  late Animation<double> _animation;

  //
  //
  //

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 200),
      vsync: this,
    );

    _animation =
        Tween<double>(begin: widget.beginSize, end: widget.endSize).animate(
      CurvedAnimation(parent: _controller, curve: widget.curve),
    )..addStatusListener((status) {
            if (status == AnimationStatus.completed) {
              _controller.reverse();
            } else if (status == AnimationStatus.dismissed) {
              if (widget.bounce) {
                _controller.forward();
              }
            }
          });

    if (widget.bounce) {
      _controller.forward();
    }
  }

  //
  //
  //

  @override
  void didUpdateWidget(BouncingAnimator oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.bounce != oldWidget.bounce) {
      if (widget.bounce) {
        _controller.forward();
      } else {
        _controller.stop();
        _controller.reverse(from: _controller.value);
      }
    }
  }

  //
  //
  //

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) => Transform.translate(
        offset: Offset(0, _animation.value),
        child: child,
      ),
      child: widget.child,
    );
  }

  //
  //
  //

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
