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

part '_blur_animator_properties.g.dart';

// ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░

class BlurAnimator extends StatefulWidget {
  //
  //
  //

  final Widget child;
  final BlurAnimatorProperties properties;

  //
  //
  //

  const BlurAnimator({
    super.key,
    required this.child,
    this.properties = const BlurAnimatorProperties(
      delay: Duration.zero,
      duration: Duration(milliseconds: 1500),
      curve: Curves.easeInCirc,
      begin: 0.0,
      end: 3.0,
      blendMode: BlendMode.darken,
      disabled: false,
      color: Color.fromARGB(128, 0, 0, 0),
    ),
  });

  //
  //
  //

  @override
  _State createState() => _State();
}

// ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░

class _State extends State<BlurAnimator> with SingleTickerProviderStateMixin {
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
    _controller = AnimationController(
      vsync: this,
      duration: widget.properties.duration$,
    );
    Future.delayed(widget.properties.delay$, () {
      if (mounted) {
        _controller.forward();
      }
    });
    _animation = Tween<double>(
      begin: widget.properties.begin$,
      end: widget.properties.end$,
    ).animate(
      CurvedAnimation(parent: _controller, curve: widget.properties.curve$),
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

  //
  //
  //

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animation,
      child: widget.child,
      builder: (_, final child) {
        final sigma = _animation.value;
        return Blur(
          sigma: sigma,
          color: widget.properties.color$,
          blendMode: widget.properties.blendMode$,
          disabled: widget.properties.disabled$,
          child: child,
        );
      },
    );
  }
}

// ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░

@GenerateDartModel(
  fields: {
    ...ANIMATOR_PROPERTIES_FIELDS,
    Field(fieldPath: ['blendMode'], fieldType: BlendMode, nullable: false),
    Field(fieldPath: ['color'], fieldType: Color, nullable: false),
    Field(fieldPath: ['disabled'], fieldType: bool, nullable: false),
  },
  shouldInherit: true,
)
class _BlurAnimatorProperties {
  const _BlurAnimatorProperties();
}
