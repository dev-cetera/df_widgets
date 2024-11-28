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

import 'package:df_pod/df_pod.dart';
import 'package:flutter/widgets.dart';

import '../tap_box.dart/tap_box.dart';

// ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░

class ToggleBtn extends StatelessWidget {
  final Pod<bool> pState;
  final _OnTap? onTap;
  final _OnTapDown? onTapDown;
  final _ChildBuilder? childBuilder;
  final TapBoxProperties? defaultTapBoxProperties;
  final _TapBoxPropertyBuilder? tapBoxProperyBuilder;

  const ToggleBtn({
    super.key,
    required this.pState,
    this.onTap,
    this.onTapDown,
    this.childBuilder,
    this.defaultTapBoxProperties,
    this.tapBoxProperyBuilder,
  });

  @override
  Widget build(BuildContext context) {
    return PodBuilder(
      pod: pState,
      builder: (context, snapshot) {
        final state = snapshot.value!;
        final p = defaultTapBoxProperties ?? TapBox.theme;
        return TapBox(
          properties: tapBoxProperyBuilder?.call(state, p),
          onTap: onTap != null ? () => onTap?.call(pState) : null,
          onTapDown: onTapDown != null
              ? (details) => onTapDown?.call(details, pState)
              : null,
          child: childBuilder?.call(context, state),
        );
      },
    );
  }
}

// ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░

typedef _TapBoxPropertyBuilder = TapBoxProperties Function(
  bool state,
  TapBoxProperties defaultTapBoxProperties,
);
typedef _ChildBuilder = Widget Function(BuildContext context, bool state);
typedef _OnTap = void Function(Pod<bool> pState);
typedef _OnTapDown = void Function(TapDownDetails details, Pod<bool> pState);
