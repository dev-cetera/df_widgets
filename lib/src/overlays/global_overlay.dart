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

class GlobalOverlay extends StatefulWidget {
  //
  //
  //

  final double? left;
  final double? right;
  final double? top;
  final double? bottom;
  final Widget? background;
  final Widget child;

  //
  //
  //

  const GlobalOverlay({
    super.key,
    this.left,
    this.right,
    this.top,
    this.bottom,
    this.background,
    required this.child,
  });

  //
  //
  //

  @override
  _State createState() => _State();
}

// ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░

class _State extends State<GlobalOverlay> {
  //
  //
  //

  late final OverlayEntry _overlayEntry;

  //
  //
  //

  @override
  void initState() {
    super.initState();
    _createOverlayEntry();
  }

  //
  //
  //

  @override
  void dispose() {
    _overlayEntry.remove();
    super.dispose();
  }

  //
  //
  //

  void _createOverlayEntry() {
    _overlayEntry = OverlayEntry(
      builder: (context) {
        final l = widget.left ?? 0.0;
        final r = widget.right;
        final t = widget.top ?? 0.0;
        final b = widget.bottom;
        final x = l + (r != null ? MediaQuery.of(context).size.width - r : 0.0);
        final y = t + (b != null ? MediaQuery.of(context).size.height - b : 0.0);
        return Stack(
          children: [
            if (widget.background != null) widget.background!,
            Positioned(
              top: y,
              left: x,
              child: widget.child,
            ),
          ],
        );
      },
    );
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Overlay.of(context).insert(_overlayEntry);
    });
  }

  //
  //
  //

  @override
  Widget build(BuildContext context) => const SizedBox.shrink();
}
