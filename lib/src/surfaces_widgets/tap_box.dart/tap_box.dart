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

part '_tap_box_properties.g.dart';

// ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░

class TapBox extends StatefulWidget {
  final TapBoxProperties properties;
  final VoidCallback? onTap;
  final GestureTapDownCallback? onTapDown;
  final Widget? child;

  static const DEFAULT_PROPERTIES = TapBoxProperties(
    overlayHoverDecoration: BoxDecoration(color: Color.fromARGB(16, 0, 0, 0)),
    overlayTapDecoration: BoxDecoration(color: Color.fromARGB(32, 0, 0, 0)),
    underlayHoverDecoration: BoxDecoration(color: Color(0x00000000)),
    underlayTapDecoration: BoxDecoration(color: Color(0x00000000)),
    decoration: BoxDecoration(),
  );

  const TapBox({
    super.key,
    this.properties = DEFAULT_PROPERTIES,
    this.onTap,
    this.onTapDown,
    this.child,
  });

  @override
  _TapBoxState createState() => _TapBoxState();
}

// ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░

class _TapBoxState extends State<TapBox> {
  bool _isTapped = false;
  bool _isHovered = false;

  void _handleTapDown(TapDownDetails details) {
    setState(() {
      _isTapped = true;
    });
    if (widget.onTapDown != null) {
      widget.onTapDown!(details);
    }
  }

  void _handleTapUp(TapUpDetails details) {
    setState(() {
      _isTapped = false;
    });
    if (widget.onTap != null) {
      widget.onTap!();
    }
  }

  void _handleTapCancel() {
    setState(() {
      _isTapped = false;
    });
  }

  void _handleMouseEnter(PointerEnterEvent event) {
    setState(() {
      _isHovered = true;
    });
  }

  void _handleMouseExit(PointerExitEvent event) {
    setState(() {
      _isHovered = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: _handleTapDown,
      onTapUp: _handleTapUp,
      onTapCancel: _handleTapCancel,
      child: MouseRegion(
        onEnter: _handleMouseEnter,
        onExit: _handleMouseExit,
        child: Builder(
          builder: (context) {
            final child = (_isHovered
                    ? widget.properties.hoverBuilder?.call(context) ?? widget.child
                    : widget.properties.nonHoverBuilder?.call(context) ?? widget.child) ??
                const SizedBox.shrink();

            final underlay = Container(
              decoration: (_isTapped
                  ? widget.properties.underlayTapDecoration
                  : _isHovered
                      ? widget.properties.underlayHoverDecoration
                      : null),
              child: const SizedBox.expand(),
            );
            final overlay = Container(
              decoration: (_isTapped
                  ? widget.properties.overlayTapDecoration
                  : _isHovered
                      ? widget.properties.overlayHoverDecoration
                      : null),
              child: const SizedBox.expand(),
            );
            return IntrinsicHeight(
              child: IntrinsicWidth(
                child: Container(
                  clipBehavior: Clip.antiAlias,
                  decoration: widget.properties.decoration$,
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      underlay,
                      child,
                      overlay,
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

// ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░

@GenerateDartModel(
  fields: {
    Field(
      fieldPath: ['underlayTapDecoration'],
      fieldType: Decoration,
      nullable: false,
    ),
    Field(
      fieldPath: ['underlayHoverDecoration'],
      fieldType: Decoration,
      nullable: false,
    ),
    Field(
      fieldPath: ['overlayTapDecoration'],
      fieldType: Decoration,
      nullable: false,
    ),
    Field(
      fieldPath: ['overlayHoverDecoration'],
      fieldType: Decoration,
      nullable: false,
    ),
    Field(
      fieldPath: ['decoration'],
      fieldType: Decoration,
      nullable: false,
    ),
    Field(
      fieldPath: ['hoverBuilder'],
      fieldType: 'WidgetBuilder',
      nullable: true,
    ),
    Field(
      fieldPath: ['nonHoverBuilder'],
      fieldType: 'WidgetBuilder',
      nullable: true,
    ),
  },
  shouldInherit: true,
)
class _TapBoxProperties {
  const _TapBoxProperties();
}
