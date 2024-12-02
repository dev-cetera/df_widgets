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

import 'package:flutter/material.dart' show Theme;

import '/_common.dart';

// ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░

Future<void> showBottomMessageOverlay(
  BuildContext context, {
  required Object? message,
  TextStyle? messageStyle,
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
                child: Container(
                  decoration: BoxDecoration(
                    color: backgroundColor ??
                        backgroundColor ??
                        Theme.of(context).colorScheme.surfaceContainerLow,
                    borderRadius: borderRadius ?? BorderRadius.circular(24.sc),
                  ),
                  clipBehavior: Clip.antiAlias,
                  padding: padding ??
                      EdgeInsets.symmetric(
                        horizontal: 20.sc,
                        vertical: 12.sc,
                      ),
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
                        style: messageStyle,
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
