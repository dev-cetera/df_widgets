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

class AnchoredPopupController {
  AnchoredPopupController();
  void Function()? _open;
  void Function()? _close;
  void close() => _close?.call();
  void open() => _open?.call();
}

class AnchoredPopup extends StatefulWidget {
  //
  //
  //

  final Widget Function(BuildContext context, VoidCallback open)? buttonBuilder;
  final Widget Function(BuildContext context, VoidCallback close)? itemBuilder;
  final Widget Function(BuildContext context, VoidCallback close)?
  backgroundBuilder;

  final AnchoredPopupController? controller;

  //
  //
  //

  const AnchoredPopup({
    super.key,
    this.buttonBuilder,
    this.itemBuilder,
    this.backgroundBuilder,
    this.controller,
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

  @override
  void initState() {
    super.initState();
    widget.controller?._close = _closePopup;
    widget.controller?._open = _openPopup;
  }

  //
  //
  //

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        widget.buttonBuilder?.call(context, _openPopup) ??
            const SizedBox.shrink(),
        if (_open) ...[
          PositionedOverlay(
            child: Builder(
              builder: (context) => SizedBox.fromSize(
                size: MediaQuery.sizeOf(context),
                child:
                    widget.backgroundBuilder?.call(context, _closePopup) ??
                    const BlurryContainer(),
              ),
            ),
          ),
          AnchoredOverlay(
            child:
                widget.itemBuilder?.call(context, _closePopup) ??
                const SizedBox.shrink(),
          ),
        ],
      ],
    );
  }
}
