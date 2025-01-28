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

class CollapsableAnimator extends StatefulWidget {
  //
  //
  //

  final bool collapsed;
  final bool shouldEnableStaticMode;
  final Curve curve;
  final Duration duration;
  final Widget? child;

  //
  //
  //

  const CollapsableAnimator({
    super.key,
    this.collapsed = false,
    this.shouldEnableStaticMode = true,
    this.duration = const Duration(milliseconds: 500),
    this.curve = Curves.fastOutSlowIn,
    this.child,
  });

  //
  //
  //

  @override
  _State createState() => _State();
}

// ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░

class _State extends State<CollapsableAnimator> with SingleTickerProviderStateMixin {
  //
  //
  //

  late final _controller = AnimationController(
    vsync: this,
    duration: widget.duration,
  );

  //
  //
  //

  late final _animation = CurvedAnimation(
    parent: _controller,
    curve: widget.curve,
  );

  //
  //
  //

  @override
  void initState() {
    super.initState();
    if (widget.shouldEnableStaticMode) {
      _handleAnimationState(fromReverse: 0.0, fromForward: 1.0);
    } else {
      _handleAnimationState();
    }
  }

  //
  //
  //

  @override
  void didUpdateWidget(CollapsableAnimator old) {
    super.didUpdateWidget(old);
    _handleAnimationState();
  }

  //
  //
  //

  void _handleAnimationState({double? fromReverse, double? fromForward}) {
    if (widget.collapsed) {
      _controller.reverse(from: fromReverse);
    } else {
      _controller.forward(from: fromForward);
    }
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
    return FadeTransition(
      opacity: _animation,
      child: SizeTransition(
        axisAlignment: 1.0,
        sizeFactor: _animation,
        child: widget.child,
      ),
    );
  }
}
