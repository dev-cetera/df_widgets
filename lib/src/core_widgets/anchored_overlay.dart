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

class AnchoredOverlay extends StatefulWidget {
  //
  //
  //

  final Widget? child;

  //
  //
  //

  const AnchoredOverlay({
    super.key,
    this.child,
  });

  //
  //
  //

  @override
  _State createState() => _State();
}

// ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░

class _State extends State<AnchoredOverlay> {
  //
  //
  //

  final _offstageKey = GlobalKey();
  OverlayEntry? _overlayEntry;
  ScrollableState? _scrollable;
  ScrollPosition? _scrollPosition;

  //
  //
  //

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback(_measureAndOverlay);
  }

  //
  //
  //

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    try {
      _scrollable = Scrollable.of(context);
    } catch (_) {}
    if (_scrollable != null) {
      _scrollPosition = _scrollable!.position;
      _scrollPosition!.isScrollingNotifier.addListener(_scrollListener);
    }
  }

  //
  //
  //

  void _scrollListener() {
    if (_overlayEntry != null) {
      _overlayEntry!.remove();
      _measureAndOverlay(null);
    }
  }

  //
  //
  //

  void _measureAndOverlay(_) {
    final renderBox =
        _offstageKey.currentContext?.findRenderObject() as RenderBox;
    final childSize = renderBox.size;
    final position = renderBox.localToGlobal(Offset.zero);
    _positionOverlay(childSize, position);
  }

  //
  //
  //

  void _positionOverlay(Size childSize, Offset position) {
    final screenSize = MediaQuery.of(context).size;
    var x = position.dx;
    var y = position.dy;
    if (x + childSize.width > screenSize.width) {
      x = screenSize.width - childSize.width;
    }
    if (y + childSize.height > screenSize.height) {
      y = screenSize.height - childSize.height;
    }
    if (x < 0) {
      x = 0;
    }
    if (y < 0) {
      y = 0;
    }
    _overlayEntry = OverlayEntry(
      builder: (context) {
        return Positioned(
          left: x,
          top: y,
          child: SizedBox(
            child: widget.child,
          ),
        );
      },
    );

    Overlay.of(context).insert(_overlayEntry!);
  }

  //
  //
  //

  @override
  void dispose() {
    _overlayEntry?.remove();
    if (_scrollPosition != null) {
      _scrollPosition!.isScrollingNotifier.removeListener(_scrollListener);
    }
    super.dispose();
  }

  //
  //
  //

  @override
  Widget build(BuildContext context) {
    return Offstage(
      offstage: true,
      child: SizedBox(
        key: _offstageKey,
        child: widget.child,
      ),
    );
  }
}
