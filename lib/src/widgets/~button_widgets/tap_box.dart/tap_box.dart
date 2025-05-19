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

import 'package:df_generate_dart_models_core/df_generate_dart_models_core.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';

import '../../../_index.g.dart';

part '_tap_box_properties.g.dart';

// ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░

class TapBox extends StatefulWidget {
  final TapBoxProperties? properties;
  final VoidCallback? onTap;
  final GestureTapDownCallback? onTapDown;
  final Widget? child;

  static TapBoxProperties themeOf(BuildContext? context) {
    return DefaultThemes.of(context)?.themeOrNull<TapBoxProperties>() ??
        const TapBoxProperties(
          decoration: BoxDecoration(),
          foregroundDecoration: BoxDecoration(),
        );
  }

  const TapBox({
    super.key,
    this.properties,
    this.onTap,
    this.onTapDown,
    this.child,
  });

  @override
  _State createState() => _State();
}

// ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░

class _State extends State<TapBox> {
  var _states = <TapBoxState>{};

  TapBoxProperties get _p => widget.properties ?? TapBox.themeOf(context);

  void _handleTapDown(TapDownDetails details) {
    setState(() {
      _states = {TapBoxState.HOVER, TapBoxState.TAP_DOWN};
    });
    if (widget.onTapDown != null) {
      widget.onTapDown!(details);
    }
  }

  void _handleTapUp(TapUpDetails details) {
    setState(() {
      _states = {TapBoxState.TAP_UP};
    });
    if (widget.onTap != null) {
      widget.onTap!();
    }
  }

  void _handleTapCancel() {
    setState(() {
      _states = {};
    });
  }

  void _handleMouseEnter(PointerEnterEvent event) {
    setState(() {
      _states = {TapBoxState.HOVER};
    });
  }

  void _handleMouseExit(PointerExitEvent event) {
    setState(() {
      _states = {};
    });
  }

  void _handleMouseHover(PointerHoverEvent event) {
    setState(() {
      _states = {TapBoxState.HOVER};
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: _handleTapDown,
      onTapUp: _handleTapUp,
      onTapCancel: _handleTapCancel,
      child: MouseRegion(
        cursor: MouseCursor.uncontrolled,
        onEnter: _handleMouseEnter,
        onExit: _handleMouseExit,
        onHover: _handleMouseHover,
        child: Container(
          clipBehavior: Clip.antiAlias,
          decoration: _p.decoration$,
          foregroundDecoration: _p.foregroundDecoration,
          child: _p.builder?.call(context, _states, widget.child) ??
              widget.child ??
              const SizedBox.shrink(),
        ),
      ),
    );
  }
}

// ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░

enum TapBoxState { HOVER, TAP_UP, TAP_DOWN }

// ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░

@GenerateDartModel(
  fields: {
    Field(fieldPath: ['decoration'], fieldType: Decoration, nullable: true),
    Field(
      fieldPath: ['foregroundDecoration'],
      fieldType: Decoration,
      nullable: true,
    ),
    Field(fieldPath: ['builder'], fieldType: '_WidgetBuilder', nullable: true),
  },
  shouldInherit: true,
)
class _TapBoxProperties {
  const _TapBoxProperties();
}

// ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░

typedef _WidgetBuilder = Widget Function(
  BuildContext context,
  Set<TapBoxState> states,
  Widget? child,
);
