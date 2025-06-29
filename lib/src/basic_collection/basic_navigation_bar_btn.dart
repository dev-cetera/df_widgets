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

import '/_common.dart';

// ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░

class BasicNavigationBarBtn extends StatelessWidget {
  final VoidCallback? onTap;
  final GestureTapDownCallback? onTapDown;
  final ValueListenable<bool> pState;
  final EdgeInsetsGeometry? padding;
  final _IconBuilder? iconBuilder;
  final Widget? child;

  const BasicNavigationBarBtn({
    super.key,
    required this.pState,
    this.onTap,
    this.onTapDown,
    this.padding,
    this.iconBuilder,
    this.child,
  });

  @override
  Widget build(BuildContext context) {
    final enabled = onTap != null || onTapDown != null;
    return PodBuilder(
      pod: pState,
      builder: (context, snapshot) {
        final state = snapshot.value.unwrap().unwrap();
        final icon = iconBuilder?.call(
          context,
          enabled
              ? state
                  ? NavigationBarItemState.SELECTED
                  : NavigationBarItemState.UNSELECTED
              : NavigationBarItemState.DISABLED,
        );
        assert(icon != null || child != null);
        return BasicIconBtn(
          onTap: onTap,
          onTapDown: onTapDown,
          child: Padding(
            padding: padding ?? EdgeInsets.all(16.sc),
            child: icon ?? child,
          ),
        );
      },
    );
  }
}

// ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░

typedef _IconBuilder = Widget Function(BuildContext context, NavigationBarItemState state);

enum NavigationBarItemState { SELECTED, UNSELECTED, DISABLED }
