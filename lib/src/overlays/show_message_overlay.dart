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

Future<void> showMessageOverlay(
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
  EdgeInsets? margin,
  double? spacing,
  double? titleIconSpacing,
  BoxDecoration? decoration,
  Color? color,
  BorderRadius borderRadius = BorderRadius.zero,
  void Function(void Function() remove)? remover,
  double? height,
  double? width,
}) {
  return showBlurryOverlay(
    context,
    tapBackgroundToDismiss: tapBackgroundToDismiss,
    builder: (context, remove) {
      remover?.call(remove);
      return Padding(
        padding: margin ?? EdgeInsets.all(32.sc),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            IntrinsicWidth(
              child: ClippedSurface(
                padding: padding ?? EdgeInsets.all(32.sc),
                decoration: decoration,
                color: color,
                borderRadius: borderRadius,
                width: width,
                height: height,
                child: DividedColumn(
                  divider: SizedBox(height: spacing ?? 16.sc),
                  children: [
                    if (title != null) ...[
                      Wrap(
                        children: [
                          Text(
                            title,
                            style: titleStyle,
                          ),
                          if (titleIcon != null) ...[
                            SizedBox(width: titleIconSpacing ?? 8.sc),
                            titleIcon,
                          ],
                        ],
                      ),
                      const ContentDivider(),
                    ],
                    if (leading != null) leading,
                    if (message != null)
                      Text(
                        message.toString(),
                        style: messageStyle,
                      ),
                    if (trailing != null) trailing,
                  ],
                ),
              ),
            ),
          ],
        ),
      );
    },
  );
}

// ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░

void Function(void Function())? removeInSeconds(int seconds) {
  return (r) => Future.delayed(Duration(seconds: seconds), r);
}

void Function(void Function())? removeInMilliseconds(int milliseconds) {
  return (r) => Future.delayed(Duration(milliseconds: milliseconds), r);
}
