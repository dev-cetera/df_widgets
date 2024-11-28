//.title
// ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓
//
// JobXcel
//
// Licencing details are in the LICENSE file in the root directory.
//
// ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓
//.title~

import 'package:flutter/material.dart';

import 'package:df_scalable/df_scalable.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';

import 'show_bottom_message_overlay.dart';

// ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░

Future<void> showBottomErrorOverlay(
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
  return showBottomMessageOverlay(
    context,
    message: message,
    messageStyle: messageStyle,
    icon: icon ??
        Icon(
          FluentIcons.error_circle_24_regular,
          color: Theme.of(context).colorScheme.error,
          size: 24.sc,
        ),
    iconSpacing: iconSpacing,
    remover: remover,
    backgroundColor: backgroundColor ?? Theme.of(context).colorScheme.errorContainer,
    duration: duration,
    padding: padding,
    borderRadius: borderRadius,
    bottomSpacing: bottomSpacing,
  );
}
