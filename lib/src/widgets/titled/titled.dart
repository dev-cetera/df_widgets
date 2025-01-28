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

class Titled extends StatelessWidget {
  //
  //
  //

  final String? titleText;
  final Widget? title;
  final TextStyle? style;
  final Widget? child;
  final double? spacing;

  //
  //
  //

  const Titled({
    super.key,
    this.titleText,
    this.title,
    this.style,
    this.spacing,
    this.child,
  });

  //
  //
  //

  @override
  Widget build(BuildContext context) {
    final hasTitleText = titleText?.isNotEmpty == true;
    final hasTitleWidget = title != null;
    final hatTitle = hasTitleText || hasTitleWidget;
    return DividedColumn(
      divider: SizedBox(
        height: spacing ?? 8.sc,
      ),
      children: [
        if (hatTitle) ...[
          DefaultTextStyle(
            style: style ?? const TextStyle(),
            child: hasTitleText
                ? Text(
                    titleText!,
                  )
                : title!,
          ),
        ],
        if (child != null) child!,
      ],
    );
  }
}
