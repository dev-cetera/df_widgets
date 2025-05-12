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

// TODO: Add theme, add builders with remover passed
class ShowBlurryOverlay {
  static Future<void> show(
    BuildContext context, {
    bool tapBackgroundToDismiss = true,
    required FutureOr<Widget> Function(
      BuildContext context,
      void Function() remove,
    ) builder,
    BlurryOverlayContainerProperties properties = const BlurryOverlayContainerProperties(
      sigma: 1.0,
      color: Color.fromARGB(128, 0, 0, 0),
      fadeDuration: Duration(milliseconds: 500),
    ),
  }) {
    final completer = Completer<dynamic>();
    late final OverlayEntry overlayEntry;

    void complete() {
      if (overlayEntry.mounted) {
        try {
          overlayEntry.remove();
        } catch (_) {
          // Throws if the overlay is already removed. Do nothing.
        }
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
}
