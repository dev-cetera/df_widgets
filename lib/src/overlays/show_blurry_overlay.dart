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

import 'dart:async';

import '/_common.dart';

// ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░

Future<void> showBlurryOverlay(
  BuildContext context, {
  bool tapBackgroundToDismiss = true,
  required FutureOr<Widget> Function(
    BuildContext context,
    void Function() remove,
  ) builder,
  BlurryOverlayProperties properties = const BlurryOverlayProperties(
    sigma: 1.0,
    color: Color.fromARGB(128, 0, 0, 0),
  ),
}) {
  final completer = Completer<dynamic>();
  late final OverlayEntry overlayEntry;

  void complete() {
    if (overlayEntry.mounted) {
      overlayEntry.remove();
    }
    if (!completer.isCompleted) {
      completer.complete();
    }
  }

  overlayEntry = OverlayEntry(
    builder: (context) {
      return BlurryOverlay(
        properties: properties,
        onTapBackground: tapBackgroundToDismiss ? complete : null,
        child: FutureBuilder(
          future: () async {
            return await builder(context, complete);
          }(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return snapshot.data as Widget;
            }
            return const SizedBox.shrink();
          },
        ),
      );
    },
  );

  Overlay.of(context).insert(overlayEntry);
  return completer.future;
}
