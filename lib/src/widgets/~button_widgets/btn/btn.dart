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

part '_btn_properties.g.dart';

// ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░

class Btn extends StatelessWidget {
  final BtnProperties? properties;
  final VoidCallback? onTap;
  final GestureTapDownCallback? onTapDown;
  final String? text;
  final Widget? child;

  static BtnProperties themeOf(BuildContext? context) {
    return DefaultThemes.of(context)?.themeOrNull<BtnProperties>() ??
        BtnProperties(
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(24.sc)),
          disabledDecoration: const BoxDecoration(),
          hoverDecoration: const BoxDecoration(),
          padding: EdgeInsets.symmetric(horizontal: 24.sc),
          textStyle: const TextStyle(),
          disabledTextStyle: const TextStyle(),
          hoverTextStyle: const TextStyle(),
        );
  }

  const Btn({
    super.key,
    this.properties,
    this.onTap,
    this.onTapDown,
    this.text,
    this.child,
  });

  @override
  Widget build(BuildContext context) {
    final p = properties ?? themeOf(context);
    final enabled = onTap != null || onTapDown != null;
    return TapBox(
      properties: TapBox.themeOf(context).copyWith(
        builder: (context, states, child) {
          return Container(
            constraints: const BoxConstraints(minWidth: 48.0, minHeight: 48.0),
            decoration: () {
              if (!enabled) {
                return p.disabledDecoration$;
              }
              if (states.contains(TapBoxState.HOVER)) {
                return p.hoverDecoration$;
              }
              return p.decoration$;
            }(),
            child: Padding(
              padding: p.padding$,
              child: DefaultTextStyle(
                style: () {
                  if (!enabled) {
                    return p.disabledTextStyle$;
                  }
                  if (states.contains(TapBoxState.HOVER)) {
                    return p.hoverTextStyle$;
                  }
                  return p.textStyle$;
                }(),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    if (child != null)
                      child
                    else if (text != null)
                      Text(text!, textAlign: TextAlign.center),
                  ],
                ),
              ),
            ),
          );
        },
      ),
      child: child,
    );
  }
}

// ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░

@GenerateDartModel(
  fields: {
    Field(fieldPath: ['decoration'], fieldType: BoxDecoration),
    Field(fieldPath: ['disabledDecoration'], fieldType: BoxDecoration),
    Field(fieldPath: ['hoverDecoration'], fieldType: BoxDecoration),
    Field(fieldPath: ['textStyle'], fieldType: TextStyle),
    Field(fieldPath: ['disabledTextStyle'], fieldType: TextStyle),
    Field(fieldPath: ['hoverTextStyle'], fieldType: TextStyle),
    Field(fieldPath: ['padding'], fieldType: EdgeInsets),
  },
  shouldInherit: true,
)
class _BtnProperties {
  const _BtnProperties();
}
