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
class ShowMessageOverlay {
  Future<void> show(
    BuildContext context, {
    String? title,
    TextStyle? titleStyle,
    Widget? titleIcon,
    Object? message,
    TextStyle? messageStyle,
    Widget? leading,
    Widget? trailing,
    bool tapBackgroundToDismiss = false,
    EdgeInsets? padding,
    EdgeInsets margin = EdgeInsets.zero,
    BoxConstraints? constraints,
    double? spacing,
    double? titleIconSpacing,
    BoxDecoration? decoration,
    Color? color,
    Color? backgroundColor,
    Color? dividerColor,
    BorderRadius borderRadius = BorderRadius.zero,
    void Function(void Function() remove)? remover,
    double? height,
    double? width,
  }) {
    FocusManager.instance.primaryFocus?.unfocus(); // Dismiss the keyboard.
    return ShowBlurryOverlay.show(
      context,
      tapBackgroundToDismiss: tapBackgroundToDismiss,
      properties: BlurryOverlayContainerProperties(
        sigma: 1.0,
        color: backgroundColor ?? const Color.fromARGB(128, 0, 0, 0),
        fadeDuration: const Duration(milliseconds: 500),
      ),
      builder: (context, remove) {
        remover?.call(remove);
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            IntrinsicWidth(
              child: Padding(
                padding: margin,
                child: Container(
                  padding: padding ?? EdgeInsets.all(32.sc),
                  decoration: decoration,
                  constraints: constraints,
                  color: color,
                  width: width,
                  height: height,
                  child: DividedColumn(
                    divider: SizedBox(height: spacing ?? 16.sc),
                    children: [
                      if (title != null) ...[
                        Wrap(
                          children: [
                            Text(title, style: titleStyle),
                            if (titleIcon != null) ...[
                              SizedBox(width: titleIconSpacing ?? 8.sc),
                              titleIcon,
                            ],
                          ],
                        ),
                        ContentDivider(color: dividerColor),
                      ],
                      if (leading != null) leading,
                      if (message != null)
                        Text(message.toString(), style: messageStyle),
                      if (trailing != null) trailing,
                    ],
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}

// ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░

void Function(void Function())? removeInSeconds(int seconds) {
  return (r) => Future.delayed(Duration(seconds: seconds), r);
}

void Function(void Function())? removeInMilliseconds(int milliseconds) {
  return (r) => Future.delayed(Duration(milliseconds: milliseconds), r);
}
