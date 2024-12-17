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

class PulseAnimator extends StatefulWidget {
  final Widget child;
  final Duration pulseDuration;
  final Duration delayBetweenPulses;
  final Curve curve;
  final double pulseWidth;

  const PulseAnimator({
    super.key,
    required this.child,
    this.pulseDuration = const Duration(seconds: 1),
    this.delayBetweenPulses = const Duration(seconds: 2),
    this.curve = Curves.easeInOut,
    this.pulseWidth = 0.05,
  });

  @override
  _PulseAnimatorState createState() => _PulseAnimatorState();
}

// ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░

class _PulseAnimatorState extends State<PulseAnimator>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: widget.pulseDuration,
    );
    _scaleAnimation = TweenSequence([
      TweenSequenceItem(
        tween: Tween(begin: 1.0, end: 1.0 - widget.pulseWidth),
        weight: 50,
      ),
      TweenSequenceItem(
        tween:
            Tween(begin: 1.0 - widget.pulseWidth, end: 1.0 + widget.pulseWidth),
        weight: 50,
      ),
      TweenSequenceItem(
        tween: Tween(begin: 1.0 + widget.pulseWidth, end: 1.0),
        weight: 50,
      ),
    ]).animate(CurvedAnimation(parent: _controller, curve: widget.curve));

    _startPulseCycle();
  }

  Future<void> _startPulseCycle() async {
    while (mounted) {
      await _controller.forward();
      await Future<dynamic>.delayed(widget.delayBetweenPulses);
      _controller.reset();
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _scaleAnimation,
      builder: (context, _) {
        return Transform.scale(
          scale: _scaleAnimation.value,
          child: widget.child,
        );
      },
    );
  }
}
