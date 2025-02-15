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

class Popup extends StatelessWidget {
  //
  //
  //

  final _globalKey = GlobalKey();

  //
  //
  //

  final Widget button;
  final Widget Function(BuildContext context, VoidCallback close) popupBuilder;
  final PopupController controller;

  //
  //
  //

  Popup({
    super.key,
    required this.button,
    required this.popupBuilder,
    required this.controller,
  }) {
    controller._myPopup ??= this;
  }

  //
  //
  //

  @override
  Widget build(BuildContext context) {
    return SizedBox(key: _globalKey, child: button);
  }
}

// ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░

class PopupController {
  //
  //
  //

  OverlayEntry? _overlayEntry;
  Popup? _myPopup;

  //
  //
  //

  final double elevation;
  final Duration? duration;

  //
  //
  //

  PopupController({this.elevation = 4.0, this.duration});

  //
  //
  //

  void showPopup({
    required BuildContext context,
    AlignmentGeometry alignment = Alignment.topLeft,
    Offset? relativePosition,
    double? left,
    double? top,
    double? right,
    double? bottom,
  }) {
    assert(_myPopup != null);
    if (_myPopup == null || _overlayEntry != null) {
      return;
    }
    var l = left, t = top, r = right, b = bottom;
    if (relativePosition != null) {
      final renderBox =
          _myPopup!._globalKey.currentContext?.findRenderObject() as RenderBox;
      final offset = renderBox.localToGlobal(relativePosition);
      l = (l ?? 0.0) + offset.dx;
      t = (t ?? 0.0) + offset.dy;
    }
    _overlayEntry = OverlayEntry(
      builder: (context) {
        return BlurryOverlay(
          child: GestureDetector(
            behavior: HitTestBehavior.translucent,
            onTap: () {
              hidePopup();
            },
            child: Padding(
              padding: EdgeInsets.only(
                top: t ?? 0.0,
                left: l ?? 0.0,
                right: r ?? 0.0,
                bottom: b ?? 0.0,
              ),
              child: Align(
                alignment: alignment,
                child: _myPopup!.popupBuilder(context, hidePopup),
              ),
            ),
          ),
        );
      },
    );

    Overlay.of(context).insert(_overlayEntry!);

    if (duration != null) {
      Future.delayed(duration!, () {
        hidePopup();
      });
    }
  }

  //
  //
  //

  void hidePopup() {
    _overlayEntry?.remove();
    _overlayEntry = null;
  }
}
