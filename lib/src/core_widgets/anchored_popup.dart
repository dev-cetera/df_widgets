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

import 'package:flutter/material.dart';

import '/_common.dart';

// ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░

class AnchoredPopup extends StatefulWidget {
  //
  //
  //

  final Widget Function(
    BuildContext context,
    VoidCallback open,
  )? buttonBuilder;
  final Widget Function(
    BuildContext context,
    VoidCallback close,
  )? itemBuilder;
  final Widget Function(
    BuildContext context,
    VoidCallback close,
  )? backgroundBuilder;

  final void Function(
    VoidCallback close,
  )? onTapDownBackground;

  //
  //
  //

  const AnchoredPopup({
    super.key,
    this.buttonBuilder,
    this.itemBuilder,
    this.backgroundBuilder,
    this.onTapDownBackground,
  });

  //
  //
  //

  @override
  State<AnchoredPopup> createState() => _State();
}

// ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░

class _State extends State<AnchoredPopup> {
  //
  //
  //

  var _open = false;

  void _openPopup() {
    setState(() => _open = true);
  }

  void _closePopup() {
    setState(() => _open = false);
  }

  //
  //
  //

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        widget.buttonBuilder?.call(
              context,
              _openPopup,
            ) ??
            const SizedBox.shrink(),
        if (_open) ...[
          PositionedOverlay(
            child: GestureDetector(
              behavior: HitTestBehavior.translucent,
              onTapDown: (details) => widget.onTapDownBackground?.call(
                _closePopup,
              ),
              child: Builder(
                builder: (context) => SizedBox.fromSize(
                  size: MediaQuery.sizeOf(context),
                  child: widget.backgroundBuilder?.call(
                        context,
                        _closePopup,
                      ) ??
                      const BlurryContainer(),
                ),
              ),
            ),
          ),
          AnchoredOverlay(
            child: widget.itemBuilder?.call(
                  context,
                  _closePopup,
                ) ??
                const SizedBox.shrink(),
          ),
        ],
      ],
    );
  }
}
