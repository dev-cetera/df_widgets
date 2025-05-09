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

class ShowLoadingOverlayUntilComplete {
  Future<void> show(
    BuildContext context, {
    required Future<void> future,
    void Function(Object? e)? onError,
    Color? backgroundColor,
    Widget? progressIndicator,
  }) {
    VoidCallback? remove;
    FocusManager.instance.primaryFocus?.unfocus(); // Dismiss the keyboard.
    return ShowMessageOverlay().show(
      context,
      leading: progressIndicator ??
          const BasicDelayedCircularProgressIndicator(
            delay: Duration.zero,
          ),
      backgroundColor: backgroundColor,
      remover: (r) async {
        remove = r;
        try {
          await future;
          r();
        } catch (e) {
          r();
          if (context.mounted) {
            remove?.call();
          }
          onError?.call(e);
        }
      },
    );
  }
}
