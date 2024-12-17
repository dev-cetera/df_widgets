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

class BasicHeaderSearchBar extends StatefulWidget {
  //
  //
  //

  final Pod<bool>? pCollapsed;
  final Pod<String> pSearchQuery;
  final List<BasicSearchBarItem> sortOptionItems;
  final List<BasicSearchBarItem> filterOptionItems;
  final FocusNode focusNode;

  //
  //
  //

  const BasicHeaderSearchBar({
    super.key,
    this.pCollapsed,
    required this.pSearchQuery,
    this.sortOptionItems = const [],
    this.filterOptionItems = const [],
    required this.focusNode,
  });

  //
  //
  //

  @override
  State<BasicHeaderSearchBar> createState() => _State();
}

// ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░

class _State extends State<BasicHeaderSearchBar> {
  //
  //
  //

  late final _initiallyCollapsed = widget.pCollapsed?.value;
  final _textEditingController = TextEditingController();

  @override
  void initState() {
    super.initState();
    widget.focusNode.addListener(_handleUnfocused);
  }

  @override
  void dispose() {
    super.dispose();
    widget.focusNode.removeListener(_handleUnfocused);
    _textEditingController.dispose();
  }

  void _handleUnfocused() {
    widget.pCollapsed?.set(!widget.focusNode.hasFocus);
  }

  @override
  Widget build(BuildContext context) {
    final child = BlurryContainer(
      properties: BlurryContainer.themeOf(context).copyWith(
        containerProperties: BlurryContainer.themeOf(context).containerProperties$.copyWith(
              color: Theme.of(context).colorScheme.surfaceContainerLow,
            ),
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(16.sc),
          bottomRight: Radius.circular(16.sc),
        ),
      ),
      child: DividedColumn(
        children: [
          ContentDivider(
            thickness: 2.sc,
            color: Theme.of(context).colorScheme.surface,
          ),
          Padding(
            padding: EdgeInsets.all(8.sc),
            child: DividedRow(
              crossAxisAlignment: CrossAxisAlignment.center,
              divider: SizedBox(width: 8.sc),
              children: [
                IconButton(
                  onPressed: () {},
                  icon: Icon(
                    FluentIcons.search_24_regular,
                    color: Theme.of(context).colorScheme.onSurface,
                    size: 24.sc,
                  ),
                ),
                Expanded(
                  child: TextEdit(
                    properties: TextEdit.themeOf(context).copyWith(
                      controller: _textEditingController,
                      focusNode: widget.focusNode,
                      onSubmitted: (text) {
                        widget.pSearchQuery.set(text);
                      },
                      onTapOutside: (_) {
                        widget.pCollapsed?.set(true);
                      },
                      onChanged: (_) {
                        // TODO: Add deboucing here.
                      },
                    ),
                  ),
                ),
                if (widget.sortOptionItems.isNotEmpty)
                  BasicPopupMenu(
                    buttonBuilder: (context, open) {
                      return IconButton(
                        onPressed: open,
                        icon: Icon(
                          FluentIcons.arrow_sort_24_regular,
                          color: Theme.of(context).colorScheme.onSurface,
                          size: 24.sc,
                        ),
                      );
                    },
                    childrenBuilder: (context, close) => widget.sortOptionItems
                        .map(
                          (e) => TextButton.icon(
                            onPressed: () {
                              close();
                              e.onTap();
                            },
                            label: Text(
                              e.title,
                            ),
                            icon: Icon(
                              e.selected()
                                  ? FluentIcons.checkbox_checked_24_filled
                                  : FluentIcons.checkbox_unchecked_24_regular,
                              size: 24.sc,
                            ),
                          ),
                        )
                        .toList(),
                  ),
                if (widget.filterOptionItems.isNotEmpty)
                  BasicPopupMenu(
                    buttonBuilder: (context, open) {
                      return IconButton(
                        onPressed: open,
                        icon: Icon(
                          FluentIcons.filter_24_regular,
                          color: Theme.of(context).colorScheme.onSurface,
                          size: 24.sc,
                        ),
                      );
                    },
                    childrenBuilder: (context, close) => widget.filterOptionItems
                        .map(
                          (e) => TextButton.icon(
                            onPressed: () {
                              close();
                              e.onTap();
                            },
                            label: Text(
                              e.title,
                            ),
                            icon: Icon(
                              e.selected()
                                  ? FluentIcons.checkbox_checked_24_filled
                                  : FluentIcons.checkbox_unchecked_24_regular,
                              size: 24.sc,
                            ),
                          ),
                        )
                        .toList(),
                  ),
                if (widget.pCollapsed != null)
                  IconButton(
                    onPressed: () => widget.pCollapsed?.set(true),
                    icon: Icon(
                      FluentIcons.dismiss_24_regular,
                      color: Theme.of(context).colorScheme.onSurface,
                      size: 24.sc,
                    ),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
    if (widget.pCollapsed != null) {
      return PodBuilder(
        pod: widget.pCollapsed!,
        builder: (context, collapsedSnapshot) {
          final collapsed = collapsedSnapshot.value!;
          if (collapsed != true && _initiallyCollapsed == false) {
            widget.focusNode.requestFocus();
          }
          return CollapsableAnimator(
            duration: const Duration(milliseconds: 250),
            collapsed: collapsed == true,
            child: collapsedSnapshot.child,
          );
        },
        child: child,
      );
    } else {
      return child;
    }
  }
}

// ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░

class BasicSearchBarItem {
  //
  //
  //

  final String title;
  final void Function() onTap;
  final bool Function() selected;

  //
  //
  //

  const BasicSearchBarItem({
    required this.title,
    required this.onTap,
    required this.selected,
  });
}
