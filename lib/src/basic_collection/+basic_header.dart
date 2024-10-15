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

import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';

import '/_common.dart';

// ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░

class BasicHeader extends StatefulWidget implements PreferredSizeWidget {
  const BasicHeader({
    super.key,
  });

  @override
  State<BasicHeader> createState() => _BasicHeaderState();

  @override
  Size get preferredSize => Size(double.infinity, 80.sc);
}

class _BasicHeaderState extends State<BasicHeader> {
  @override
  Widget build(BuildContext context) {
    return BlurryContainer(
      properties: BlurryContainer.theme.copyWith(
        color: Theme.of(context).colorScheme.surfaceContainer,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(24.sc),
          bottomRight: Radius.circular(24.sc),
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          BasicBackBtn(
            onTap: () {},
          ),
          SizedBox(width: 8.sc),
          Text(
            'Home',
            style: Theme.of(context).textTheme.headlineSmall,
          ),
          const Spacer(),
          AnchoredPopup(
            buttonBuilder: (context, open) => BasicIconBtn(
              iconData: FluentIcons.more_vertical_24_regular,
              onTapDown: (_) => open(),
            ),
            onTapDownBackground: (close) {
              close();
            },
            itemBuilder: (context, close) {
              return Material(
                color: Colors.transparent,
                child: SlideAnimator(
                  direction: SlideAnimatorDirection.RIGHT_TO_LEFT,
                  child: IntrinsicHeight(
                    child: BlurryContainer(
                      properties: BlurryContainer.theme.copyWith(
                        color: Theme.of(context).colorScheme.surfaceContainerHighest,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(24.sc),
                          bottomLeft: Radius.circular(24.sc),
                        ),
                        width: 0.4 * MediaQuery.sizeOf(context).width,
                      ),
                      child: DividedColumn(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding: EdgeInsets.all(12.sc),
                                child: Text(
                                  'Options',
                                  style: Theme.of(context).textTheme.headlineSmall,
                                ),
                              ),
                              BasicIconBtn(
                                iconData: FluentIcons.chevron_right_24_regular,
                                onTapDown: (_) => close(),
                              ),
                            ],
                          ),
                          ContentDivider(
                            color: Theme.of(context).colorScheme.primary,
                          ),
                          BasicBtn(
                            text: 'Profile',
                            onTap: () {},
                          ),
                          BasicBtn(
                            text: 'Settings',
                            onTap: () {},
                          ),
                          ContentDivider(
                            color: Theme.of(context).colorScheme.primary,
                          ),
                          BasicErrBtn(
                            text: 'Logout',
                            onTap: () {},
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => Size(double.infinity, 80.sc);
}
