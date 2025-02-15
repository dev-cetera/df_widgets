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

class FadeAnimator extends StatefulWidget {
  //
  //
  //

  final Widget? layer1;
  final Widget layer2;
  final Duration delay;
  final Duration duration;
  final Curve curve;
  final void Function()? onComplete;
  final double begin;
  final double end;

  //
  //
  //

  const FadeAnimator({
    super.key,
    this.layer1,
    required this.layer2,
    this.delay = const Duration(milliseconds: 0),
    this.duration = const Duration(milliseconds: 250),
    this.curve = Curves.linear,
    this.begin = 0.0,
    this.end = 1.0,
    this.onComplete,
  });

  //
  //
  //

  @override
  _State createState() => _State();
}

// ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░

class _State extends State<FadeAnimator> with SingleTickerProviderStateMixin {
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

  late final _animation = Tween<double>(
    begin: widget.begin,
    end: widget.end,
  ).animate(CurvedAnimation(parent: _controller, curve: widget.curve));

  //
  //
  //

  @override
  void initState() {
    super.initState();
    if (widget.delay.inMicroseconds == 0) {
      _controller.forward();
    } else {
      Future.delayed(widget.delay, () {
        if (mounted) {
          _controller.forward();
        }
      });
    }
    _controller.addListener(() {
      if (_controller.isCompleted) {
        widget.onComplete?.call();
      }
    });
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
    final layer1 = widget.layer1;
    final layer2 = widget.layer2;
    return Stack(
      children: [
        if (layer1 != null) layer1,
        FadeTransition(opacity: _animation, child: layer2),
      ],
    );
  }
}
