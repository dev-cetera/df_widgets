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

class OverlayPopup extends StatefulWidget {
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
  final Color? backgroundColor;
  final void Function()? onTapDownBackground;

  //
  //
  //

  const OverlayPopup({
    super.key,
    this.buttonBuilder,
    this.itemBuilder,
    this.backgroundColor,
    this.onTapDownBackground,
  });

  //
  //
  //

  @override
  State<OverlayPopup> createState() => _State();
}

// ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░

class _State extends State<OverlayPopup> {
  //
  //
  //

  var _open = false;

  //
  //
  //

  @override
  Widget build(BuildContext context) {
    final button = widget.buttonBuilder?.call(
          context,
          () => setState(() => _open = true),
        ) ??
        const SizedBox.shrink();

    final item = widget.itemBuilder?.call(
          context,
          () => setState(() => _open = false),
        ) ??
        const SizedBox.shrink();

    final $screenSize = MediaQuery.of(context).size;
    return Stack(
      children: [
        button,
        if (_open) ...[
          GlobalOverlay(
            child: GestureDetector(
              behavior: HitTestBehavior.translucent,
              onTapDown: (details) {
                setState(() => _open = false);
                widget.onTapDownBackground?.call();
              },
              child: FadeAnimator(
                layer2: Container(
                  color: widget.backgroundColor,
                  width: $screenSize.width,
                  height: $screenSize.height,
                ),
              ),
            ),
          ),
          Overlayed(
            child: item,
          ),
        ],
      ],
    );
  }
}