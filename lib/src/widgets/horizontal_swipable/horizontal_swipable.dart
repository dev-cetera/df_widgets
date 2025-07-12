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

import 'package:flutter/widgets.dart';

import 'package:df_scalable/df_scalable.dart';

// ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░

class HorizonralSwipable extends StatefulWidget {
  final Widget child;
  final HorizonralSwipableDirection left;
  final HorizonralSwipableDirection right;
  final Alignment stackAlignment;
  final Duration slideDuration;

  const HorizonralSwipable({
    super.key,
    required this.child,
    this.left = const HorizonralSwipableDirection(),
    this.right = const HorizonralSwipableDirection(),
    this.stackAlignment = Alignment.center,
    this.slideDuration = const Duration(milliseconds: 300),
  });

  @override
  _State createState() => _State();
}

// ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░

class _State extends State<HorizonralSwipable> with TickerProviderStateMixin {
  late AnimationController _animationController;
  double _maxWidth = 0.0;

  late FocusNode _focusNode;

  bool get _canDragLeft => widget.left.builder != null || widget.left.child != null;
  bool get _canDragRight => widget.right.builder != null || widget.right.child != null;
  bool get _isLeft => _animationController.value < 0;
  bool get _isRight => _animationController.value > 0;

  @pragma('vm:prefer-inline')
  HorizonralSwipableDirection? get _direction {
    if (_isLeft) {
      return widget.left;
    } else if (_isRight) {
      return widget.right;
    } else {
      return null;
    }
  }

  double _dragExtent() {
    final dragFactor = _direction?.dragFactor;
    if (dragFactor != null) {
      return dragFactor * _maxWidth;
    }
    return _direction?.dragExtent ?? 160.sc;
  }

  @pragma('vm:prefer-inline')
  double _dragOffset() {
    return _animationController.value * _dragExtent();
  }

  void _onDragUpdate(DragUpdateDetails details) {
    final primaryDelta = details.primaryDelta!;
    final d = primaryDelta / _dragExtent();
    _animationController.value = (_animationController.value + d).clamp(
      _canDragLeft ? -1.0 : 0.0,
      _canDragRight ? 1.0 : 0.0,
    );
  }

  @override
  void initState() {
    super.initState();
    _focusNode = FocusNode();
    _focusNode.addListener(() {
      if (!_focusNode.hasFocus) {
        _animationController.animateTo(0.0);
      }
    });
    _animationController = AnimationController(
      vsync: this,
      duration: widget.slideDuration,
      lowerBound: -1.0,
      upperBound: 1.0,
    );
    _animationController.value = 0.0;
  }

  @override
  void dispose() {
    _focusNode.dispose();
    _animationController.dispose();
    super.dispose();
  }

  void _onDragEnd(DragEndDetails details) {
    if (_dragOffset().abs() == _dragExtent().abs()) {
      _direction?.onDragEnd?.call();
    }
    var targetValue = 0.0;
    final snapFactor = _direction?.snapFactor;
    if (snapFactor != null) {
      if (_animationController.value.abs() >= snapFactor.clamp(0.0, 1.0)) {
        targetValue = _animationController.value > 0 ? 1.0 : -1.0;
      }
    }

    _animationController.animateTo(
      targetValue,
      duration: widget.slideDuration,
      curve: Curves.easeOutExpo,
    );
  }

  void _onDragStart(DragStartDetails details) {
    FocusScope.of(context).unfocus();
    _focusNode.requestFocus();
    _animationController.stop();
  }

  @override
  Widget build(BuildContext context) {
    return Focus(
      focusNode: _focusNode,
      child: LayoutBuilder(
        builder: (context, constraints) {
          _maxWidth = constraints.maxWidth;
          return Stack(
            alignment: widget.stackAlignment,
            children: [
              AnimatedBuilder(
                animation: _animationController,
                builder: (context, _) {
                  if (_isLeft) {
                    final dragExtent = _dragExtent();
                    return Align(
                      alignment: Alignment.centerRight,
                      child: SizedBox(
                        width: dragExtent,
                        child: _direction?.build(
                          context,
                          _dragOffset(),
                          dragExtent,
                        ),
                      ),
                    );
                  } else if (_isRight) {
                    final dragExtent = _dragExtent();
                    return Align(
                      alignment: Alignment.centerLeft,
                      child: SizedBox(
                        width: dragExtent,
                        child: _direction?.build(
                          context,
                          _dragOffset(),
                          dragExtent,
                        ),
                      ),
                    );
                  } else {
                    return const SizedBox.shrink();
                  }
                },
              ),
              GestureDetector(
                onHorizontalDragStart: _onDragStart,
                onHorizontalDragUpdate: _onDragUpdate,
                onHorizontalDragEnd: _onDragEnd,
                behavior: HitTestBehavior.translucent,
                child: AnimatedBuilder(
                  animation: _animationController,
                  child: widget.child,
                  builder: (context, child) {
                    return Transform.translate(
                      offset: Offset(_dragOffset(), 0),
                      child: Row(children: [Expanded(child: child!)]),
                    );
                  },
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}

// ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░

class HorizonralSwipableDirection {
  final Widget? child;
  final HorizonralSwipableDirectionBuilder? builder;
  final double? dragExtent;
  final double? dragFactor;
  final double? snapFactor;
  final VoidCallback? onDragEnd;

  const HorizonralSwipableDirection({
    this.child,
    this.builder,
    this.dragExtent,
    this.dragFactor,
    this.snapFactor = 0.5,
    this.onDragEnd,
  });

  HorizonralSwipableDirection copyWith({
    Widget? child,
    HorizonralSwipableDirectionBuilder? builder,
    double? dragExtent,
    double? dragFactor,
    double? snapFactor,
    VoidCallback? onDragEnd,
  }) {
    return HorizonralSwipableDirection(
      child: child ?? this.child,
      builder: builder ?? this.builder,
      dragExtent: dragExtent ?? this.dragExtent,
      dragFactor: dragFactor ?? this.dragFactor,
      snapFactor: snapFactor ?? this.snapFactor,
      onDragEnd: onDragEnd ?? this.onDragEnd,
    );
  }

  @pragma('vm:prefer-inline')
  Widget build(BuildContext context, double dragOffset, double dragExtent) {
    return builder?.call(context, dragOffset, dragExtent, child) ??
        child ??
        const SizedBox.shrink();
  }
}

typedef HorizonralSwipableDirectionBuilder = Widget Function(
  BuildContext context,
  double dragOffset,
  double dragExtent,
  Widget? child,
);
