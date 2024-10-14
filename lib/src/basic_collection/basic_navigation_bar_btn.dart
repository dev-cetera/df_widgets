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

class BasicNavigationBarBtn extends StatelessWidget {
  final _OnTap? onTap;
  final _OnTapDown? onTapDown;
  final Pod<bool> pState;

  final _IconBuilder? iconBuilder;
  final Widget? child;

  const BasicNavigationBarBtn({
    super.key,
    required this.pState,
    this.onTap,
    this.onTapDown,
    this.iconBuilder,
    this.child,
  });

  @override
  Widget build(BuildContext context) {
    final enabled = onTap != null || onTapDown != null;
    return PodBuilder(
      pod: pState,
      builder: (context, snapshot) {
        final state = snapshot.value!;

        final icon = iconBuilder?.call(
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
          child: icon ?? child,
        );
      },
    );
  }
}

// ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░

typedef _OnTap = void Function(Pod<bool> pState);
typedef _OnTapDown = void Function(TapDownDetails details, Pod<bool> pState);
typedef _IconBuilder = Widget Function(NavigationBarItemState state);

enum NavigationBarItemState {
  SELECTED,
  UNSELECTED,
  DISABLED,
}
