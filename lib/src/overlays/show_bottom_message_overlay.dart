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

Future<void> showBottomMessageOverlay(
  BuildContext context, {
  required Object? message,
  TextStyle? textStyle,
  Widget? icon,
  double? iconSpacing,
  void Function(void Function() remove)? remover,
  Color? backgroundColor,
  Duration? duration = const Duration(seconds: 3),
  EdgeInsets? padding,
  BorderRadius? borderRadius,
  double? bottomSpacing,
}) {
  return showAlignedOverlay(
    context,
    alignment: Alignment.bottomCenter,
    builder: (context, remove) {
      remover?.call(remove);
      if (duration != null) {
        Future.delayed(duration, remove);
      }
      return GestureDetector(
        behavior: HitTestBehavior.translucent,
        onTap: remove,
        child: Column(
          children: [
            const Spacer(),
            IntrinsicWidth(
              child: SlideAnimator(
                extent: 0.5,
                child: ClippedSurface(
                  decoration: BoxDecoration(
                    color: backgroundColor,
                  ),
                  padding: padding ??
                      EdgeInsets.symmetric(
                        horizontal: 20.sc,
                        vertical: 12.sc,
                      ),
                  borderRadius: borderRadius ?? BorderRadius.circular(24.sc),
                  child: Wrap(
                    crossAxisAlignment: WrapCrossAlignment.center,
                    children: [
                      if (icon != null) ...[
                        icon,
                        SizedBox(
                          width: iconSpacing ?? 8.sc,
                        ),
                      ],
                      Text(
                        message.toString(),
                        style: textStyle,
                        softWrap: true,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: bottomSpacing ?? 40.sc,
            ),
          ],
        ),
      );
    },
  );
}