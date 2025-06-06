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

part '_show_top_message_overlay_properties.g.dart';

// ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░

final class ShowTopMessageOverlay {
  const ShowTopMessageOverlay._();
  static ShowTopMessageOverlayProperties themeOf(BuildContext? context) {
    return DefaultThemes.of(
          context,
        )?.themeOrNull<ShowTopMessageOverlayProperties>() ??
        const ShowTopMessageOverlayProperties(duration: Duration(seconds: 3));
  }

  static Future<void> showError(
    BuildContext context, {
    required Object? message,
    void Function(void Function() remove)? remover,
    ShowTopMessageOverlayProperties? properties,
  }) {
    final p = properties ?? ShowTopMessageOverlay.themeOf(context);
    return show(
      context,
      message: message,
      properties: p.copyWith(
        backgroundColor: p.backgroundColor ?? Theme.of(context).colorScheme.errorContainer,
      ),
    );
  }

  static Future<void> show(
    BuildContext context, {
    required Object? message,
    void Function(void Function() remove)? remover,
    ShowTopMessageOverlayProperties? properties,
  }) {
    final p = properties ?? ShowTopMessageOverlay.themeOf(context);
    final alignment = p.alignment ?? Alignment.topCenter;
    return ShowAlignedOverlay.show(
      context,
      alignment: alignment,
      builder: (context, remove) {
        remover?.call(remove);
        if (p.duration != null) {
          Future.delayed(p.duration!, remove);
        }
        return GestureDetector(
          behavior: HitTestBehavior.translucent,
          onTap: remove,
          child: Column(
            children: [
              SizedBox(height: p.topSpacing ?? 72.sc),
              IntrinsicWidth(
                child: SlideAnimator(
                  extent: 0.5,
                  direction: alignment.y == -1
                      ? SlideAnimatorDirection.TOP_TO_BOTTOM
                      : SlideAnimatorDirection.BOTTOM_TO_TOP,
                  child: Container(
                    margin: p.margin ?? EdgeInsets.symmetric(horizontal: 28.sc),
                    constraints: p.constraints ??
                        BoxConstraints(
                          maxWidth: 400.sc,
                        ),
                    decoration: BoxDecoration(
                      color: p.backgroundColor ??
                          Theme.of(context).colorScheme.tertiary.withValues(alpha: 0.85),
                      borderRadius: p.borderRadius ?? BorderRadius.circular(24.sc),
                    ),
                    clipBehavior: Clip.antiAlias,
                    padding: p.padding ??
                        EdgeInsets.symmetric(
                          horizontal: 20.sc,
                          vertical: 12.sc,
                        ),
                    child: Wrap(
                      crossAxisAlignment: WrapCrossAlignment.center,
                      children: [
                        if (p.icon != null) ...[
                          p.icon!,
                          SizedBox(width: p.iconSpacing ?? 8.sc),
                        ],
                        Text(
                          message.toString(),
                          style: p.messageStyle ??
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

// ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░

@GenerateDartModel(
  fields: {
    Field(fieldPath: ['messageStyle'], fieldType: TextStyle, nullable: true),
    Field(fieldPath: ['icon'], fieldType: Widget, nullable: true),
    Field(fieldPath: ['iconSpacing'], fieldType: double, nullable: true),
    Field(fieldPath: ['backgroundColor'], fieldType: Color, nullable: true),
    Field(fieldPath: ['duration'], fieldType: Duration, nullable: true),
    Field(fieldPath: ['padding'], fieldType: EdgeInsets, nullable: true),
    Field(fieldPath: ['borderRadius'], fieldType: BorderRadius, nullable: true),
    Field(fieldPath: ['topSpacing'], fieldType: double, nullable: true),
    Field(fieldPath: ['alignment'], fieldType: Alignment, nullable: true),
    Field(fieldPath: ['margin'], fieldType: EdgeInsets, nullable: true),
    Field(fieldPath: ['constraints'], fieldType: BoxConstraints, nullable: true),
  },
)
// ignore: unused_element
class _ShowTopMessageOverlayProperties {
  const _ShowTopMessageOverlayProperties();
}
