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

import 'package:flutter/material.dart' show Theme;

import '/_common.dart';

// ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░

// TODO: Add theme, add builders with remover passed
class ShowTopMessageOverlay {
  static Future<void> show(
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
    double? topSpacing,
  }) {
    return ShowAlignedOverlay.show(
      context,
      alignment: Alignment.topCenter,
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
              SizedBox(height: topSpacing ?? 72.sc),
              IntrinsicWidth(
                child: SlideAnimator(
                  extent: 0.5,
                  direction: SlideAnimatorDirection.TOP_TO_BOTTOM,
                  child: Container(
                    decoration: BoxDecoration(
                      color: backgroundColor ??
                          backgroundColor ??
                          Theme.of(context).colorScheme.tertiary.withValues(alpha: 0.85),
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
                          SizedBox(width: iconSpacing ?? 8.sc),
                        ],
                        Text(
                          message.toString(),
                          style: messageStyle ??
                              Theme.of(context).textTheme.bodyMedium?.copyWith(
                                    color: Theme.of(context).colorScheme.onTertiary,
                                    fontWeight: FONT_WEIGHT_SEMI_BOLD,
                                  ),
                          softWrap: true,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const Spacer(),
            ],
          ),
        );
      },
    );
  }
}
