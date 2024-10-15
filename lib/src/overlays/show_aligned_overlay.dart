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

Future<void> showAlignedOverlay(
  BuildContext context, {
  Alignment alignment = Alignment.bottomCenter,
  required FutureOr<Widget> Function(
    BuildContext context,
    void Function() remove,
  ) builder,
}) {
  final completer = Completer<dynamic>();
  late final OverlayEntry overlayEntry;
  overlayEntry = OverlayEntry(
    builder: (context) {
      return Align(
        alignment: alignment,
        child: FutureBuilder(
          future: () async {
            return await builder(context, () {
              if (overlayEntry.mounted) {
                overlayEntry.remove();
              }
              if (!completer.isCompleted) {
                completer.complete();
              }
            });
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
