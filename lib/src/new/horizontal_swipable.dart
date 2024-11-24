//.title
// ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓
//
// JobXcel
//
// Licencing details are in the LICENSE file in the root directory.
//
// ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓
//.title~

import 'package:flutter/widgets.dart';

// ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░

class HorizonralSwipable extends StatefulWidget {
  final Widget child;
  final HorizonralSwipableDirection left;
  final HorizonralSwipableDirection right;
  final void Function(double)? onDrag;
  final Alignment stackAlignment;

  const HorizonralSwipable({
    super.key,
    required this.child,
    this.left = const HorizonralSwipableDirection(),
    this.right = const HorizonralSwipableDirection(),
    this.onDrag,
    this.stackAlignment = Alignment.center,
  });

  @override
  _HorizonralSwipableState createState() => _HorizonralSwipableState();
}

class _HorizonralSwipableState extends State<HorizonralSwipable> with TickerProviderStateMixin {
  late AnimationController _animationController;
  double _maxWidth = 0.0;

  late FocusNode _focusNode;

  bool get _canDragLeft => widget.left.child != null;
  bool get _canDragRight => widget.right.child != null;

  HorizonralSwipableDirection get _direction {
    if (_animationController.value > 0) {
      return widget.left;
    } else {
      return widget.right;
    }
  }

  double get _dragExtent {
    if (_direction.dragFactor != null) {
      return _direction.dragFactor! * _maxWidth;
    }
    return _direction.dragExtent ?? 160.0;
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
      duration: const Duration(milliseconds: 300),
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

  void _onDragUpdate(DragUpdateDetails details) {
    final delta = details.primaryDelta! / (_maxWidth - _dragExtent);
    _animationController.value += delta;
    _animationController.value =
        _animationController.value.clamp(_canDragLeft ? -1.0 : 0.0, _canDragRight ? 1.0 : 0.0);

    widget.onDrag?.call(details.primaryDelta!);
  }

  void _onDragEnd(DragEndDetails details) {
    var targetValue = 0.0;

    if (_direction.snapFactor != null) {
      if (_animationController.value.abs() >= _direction.snapFactor!.clamp(0.0, 1.0)) {
        targetValue = _animationController.value > 0 ? 1.0 : -1.0;
      }
    }

    _animationController.animateTo(
      targetValue,
      duration: const Duration(milliseconds: 300),
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
          return ClipRect(
            child: Stack(
              alignment: widget.stackAlignment,
              children: [
                ValueListenableBuilder(
                  valueListenable: _animationController,
                  builder: (context, value, _) {
                    return _direction.child ?? const SizedBox();
                  },
                ),
                GestureDetector(
                  onHorizontalDragStart: _onDragStart,
                  onHorizontalDragUpdate: _onDragUpdate,
                  onHorizontalDragEnd: _onDragEnd,
                  behavior: HitTestBehavior.translucent,
                  child: AnimatedBuilder(
                    animation: _animationController,
                    builder: (context, child) {
                      final offset = _animationController.value * _dragExtent;
                      return Transform.translate(
                        offset: Offset(offset, 0),
                        child: widget.child,
                      );
                    },
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

// ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░

class HorizonralSwipableDirection {
  final Widget? child;
  final double? dragExtent;
  final double? dragFactor;
  final double? snapFactor;

  const HorizonralSwipableDirection({
    this.child,
    this.dragExtent,
    this.dragFactor,
    this.snapFactor = 0.5,
  });

  HorizonralSwipableDirection copyWith({
    Widget? child,
    double? dragExtent,
    double? dragFactor,
    double? snapFactor,
  }) {
    return HorizonralSwipableDirection(
      child: child ?? this.child,
      dragExtent: dragExtent ?? this.dragExtent,
      dragFactor: dragFactor ?? this.dragFactor,
      snapFactor: snapFactor ?? this.snapFactor,
    );
  }
}
