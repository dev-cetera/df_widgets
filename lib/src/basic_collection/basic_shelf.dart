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

class BasicShelf extends StatelessWidget {
  final List<BasicShelfItem> items;
  const BasicShelf({super.key, required this.items});

  @override
  Widget build(BuildContext context) {
    final items1 =
        items
            .mapIndexed(
              (index, item) => BasicShelfItemWidget(
                item: item,
                index: index,
                itemCount: items.length,
              ),
            )
            .toList();
    return ListView.builder(
      shrinkWrap: true,
      itemCount: items1.length,
      itemBuilder: (context, index) {
        return items1[index];
      },
    );
  }
}

class BasicShelfItem {
  final Widget? title;
  final String? titleText;
  final Widget? body;
  final String? bodyText;
  final Widget? trailingIcon;
  final IconData? trailingIconData;
  final GestureTapDownCallback? onTapDown;
  final VoidCallback? onTap;
  const BasicShelfItem({
    this.title,
    this.titleText,
    this.body,
    this.bodyText,
    this.trailingIcon,
    this.trailingIconData,
    this.onTapDown,
    this.onTap,
  });
}

class BasicShelfItemWidget extends StatelessWidget {
  final int index;
  final int itemCount;
  final BasicShelfItem item;

  const BasicShelfItemWidget({
    super.key,
    required this.index,
    required this.itemCount,
    required this.item,
  });

  @override
  Widget build(BuildContext context) {
    return TapBox(
      properties: TapBox.themeOf(context).copyWith(
        builder: (context, states, child) {
          final borderSide = BorderSide(
            width: 2.sc,
            color: Theme.of(context).colorScheme.surfaceBright,
          );
          return Container(
            decoration: BoxDecoration(
              border: Border(
                top: index == 0 ? borderSide : BorderSide.none,
                bottom: borderSide,
                left: borderSide,
                right: borderSide,
              ),
              color:
                  states.contains(TapBoxState.HOVER)
                      ? Theme.of(context).colorScheme.surfaceBright
                      : Theme.of(context).colorScheme.surfaceContainer,
              borderRadius:
                  index == 0
                      ? BorderRadius.only(
                        topLeft: Radius.circular(24.sc),
                        topRight: Radius.circular(24.sc),
                      )
                      : index == itemCount - 1
                      ? BorderRadius.only(
                        bottomLeft: Radius.circular(24.sc),
                        bottomRight: Radius.circular(24.sc),
                      )
                      : BorderRadius.zero,
            ),
            child: child,
          );
        },
      ),
      onTap: item.onTap,
      onTapDown: item.onTapDown,
      child: Padding(
        padding: EdgeInsets.only(top: 12.sc, bottom: 12.sc, left: 12.sc),
        child: Row(
          children: [
            SizedBox(width: 12.sc),
            Expanded(
              child: DividedColumn(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                divider: SizedBox(height: 12.sc),
                children: [
                  if (item.titleText != null)
                    Text(
                      item.titleText!,
                      softWrap: true,
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        fontWeight: FONT_WEIGHT_BOLD,
                      ),
                    ),
                  if (item.bodyText != null)
                    Text(
                      item.bodyText!,
                      softWrap: true,
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color:
                            Theme.of(context).colorScheme.onSecondaryContainer,
                      ),
                    ),
                ],
              ),
            ),
            SizedBox(width: 12.sc),
            if (item.trailingIcon != null)
              item.trailingIcon!
            else
              BasicIconBtn(
                iconData:
                    item.trailingIconData ??
                    FluentIcons.chevron_right_24_regular,
                onTap: item.onTap,
                onTapDown: item.onTapDown,
              ),
          ],
        ),
      ),
    );
  }
}
