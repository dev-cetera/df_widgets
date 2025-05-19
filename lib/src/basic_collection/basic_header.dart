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

import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';

import '/_common.dart';

// ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░

class BasicSliverHeader extends StatelessWidget {
  final String? title;
  final String? optionsMenuTitle;
  final List<Widget> Function(BuildContext context)? optionsMenuBuilder;
  final GestureTapDownCallback? onTapDownBack;

  const BasicSliverHeader({
    super.key,
    this.title,
    this.optionsMenuTitle,
    this.optionsMenuBuilder,
    this.onTapDownBack,
  });

  @override
  Widget build(BuildContext context) {
    return SliverPersistentHeader(
      delegate: _BasicHeaderDelegate(
        title: title,
        optionsMenuTitle: optionsMenuTitle,
        optionsMenuBuilder: optionsMenuBuilder,
        onTapDownBack: onTapDownBack,
      ),
      pinned: true,
    );
  }
}

// ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░

class BasicHeader extends StatelessWidget implements PreferredSizeWidget {
  final String? title;
  final String? optionsMenuTitle;
  final List<Widget> Function(BuildContext context)? optionsMenuBuilder;
  final GestureTapDownCallback? onTapDownBack;
  final bool compact;
  final double? preferredHeight;

  const BasicHeader({
    super.key,
    this.title,
    this.optionsMenuTitle,
    this.optionsMenuBuilder,
    this.onTapDownBack,
    this.compact = false,
    this.preferredHeight,
  });

  @override
  Widget build(BuildContext context) {
    return _BasicHeaderDelegate(
      title: title,
      optionsMenuTitle: optionsMenuTitle,
      optionsMenuBuilder: optionsMenuBuilder,
      onTapDownBack: onTapDownBack,
      minHeight: 48.0, // minimum touch size
      maxHeight: preferredSize.height,
    ).build(context, compact ? 32.sc : 0.0, true);
  }

  @override
  Size get preferredSize => Size(double.infinity, preferredHeight ?? 80.sc);
}

// ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░

class _BasicHeaderDelegate extends SliverPersistentHeaderDelegate {
  final String? title;
  final String? optionsMenuTitle;
  final List<Widget> Function(BuildContext context)? optionsMenuBuilder;
  final GestureTapDownCallback? onTapDownBack;
  final double? minHeight;
  final double? maxHeight;

  _BasicHeaderDelegate({
    this.title,
    this.optionsMenuTitle,
    this.optionsMenuBuilder,
    this.onTapDownBack,
    this.minHeight,
    this.maxHeight,
  });

  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) {
    final minHeight0 = minHeight ?? 48.sc;
    final maxHeight0 = maxHeight ?? 80.sc;

    // Calculate the current height based on the shrinkOffset
    final currentHeight = (maxHeight0 - shrinkOffset).clamp(
      minHeight0,
      maxHeight0,
    );
    final heightf = (2.0 + currentHeight / maxHeight0 / 3.0);

    return BlurryContainer(
      properties: BlurryContainer.themeOf(context).copyWith(
        height: currentHeight,
        containerProperties: BlurryContainer.themeOf(context)
            .containerProperties$
            .copyWith(color: Theme.of(context).colorScheme.surfaceContainer),
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(24.sc),
          bottomRight: Radius.circular(24.sc),
        ),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 8.sc),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            if (onTapDownBack != null) BasicBackBtn(onTapDown: onTapDownBack),
            if (title != null) ...[
              Padding(
                padding: EdgeInsets.only(left: 12.sc),
                child: Text(
                  title!,
                  style: Theme.of(context).textTheme.titleSmall?.copyWith(
                        fontSize:
                            Theme.of(context).textTheme.titleSmall!.fontSize! *
                                heightf,
                      ),
                ),
              ),
            ],
            const Spacer(),
            if (optionsMenuTitle != null && optionsMenuBuilder != null)
              AnchoredPopup(
                buttonBuilder: (context, open) => BasicIconBtn(
                  iconData: FluentIcons.more_vertical_24_regular,
                  onTapDown: (_) => open(),
                ),
                // onTapDownBackground: (close) {
                //   close();
                // },
                itemBuilder: (context, close) {
                  return SlideAnimator(
                    direction: SlideAnimatorDirection.RIGHT_TO_LEFT,
                    child: IntrinsicHeight(
                      child: BlurryContainer(
                        properties: BlurryContainer.themeOf(context).copyWith(
                          containerProperties: BlurryContainer.themeOf(
                            context,
                          ).containerProperties$.copyWith(
                                color: Theme.of(
                                  context,
                                ).colorScheme.surfaceContainerHighest,
                              ),
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(24.sc),
                            bottomLeft: Radius.circular(24.sc),
                          ),
                          width: 0.4 * MediaQuery.sizeOf(context).width,
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            DividedRow(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              firstIfNotEmpty: SizedBox(width: 12.sc),
                              divider: SizedBox(width: 12.sc),
                              children: [
                                Text(
                                  optionsMenuTitle!,
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleLarge
                                      ?.copyWith(fontWeight: FONT_WEIGHT_BLACK),
                                ),
                                const Spacer(),
                                BasicIconBtn(
                                  iconData:
                                      FluentIcons.chevron_right_24_regular,
                                  onTapDown: (_) => close(),
                                ),
                              ],
                            ),
                            ContentDivider(
                              color:
                                  Theme.of(context).colorScheme.surfaceBright,
                            ),
                            ...optionsMenuBuilder!(context),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
          ],
        ),
      ),
    );
  }

  @override
  double get maxExtent => 80.sc; // Maximum height of the header

  @override
  double get minExtent => 48.sc; // Minimum height of the header

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) {
    return true; // Rebuild whenever necessary
  }
}
