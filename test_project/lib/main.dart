import 'package:df_widgets/_common.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          // Badge(
          //   backgroundColor: Colors.yellow,
          //   label: Text('HELLO'),
          //   child: Icon(Icons.add),
          // ),
          PlasticCheckBtn(
            pState: Pod(false),
            onTap: (pState) => pState.update((e) => !e),
          ),
          PlasticCheckBtn(
            pState: Pod(false),
          ),
          // ToggleBtn(
          //   pState: Pod(false),
          //   childBuilder: (context, state) {
          //     if (state) {
          //       return Icon(
          //         FluentIcons.checkbox_checked_24_filled,
          //         color: Colors.green.shade900,
          //         size: 24.sc,
          //       );
          //     } else {
          //       return Icon(
          //         FluentIcons.checkbox_unchecked_24_filled,
          //         color: Colors.blueGrey.shade800,
          //         size: 24.sc,
          //       );
          //     }
          //   },
          //   onTap: (pState) {
          //     pState.update((e) => !e);
          //   },
          //   tapBoxProperyBuilder: (s, defaultTapBoxProperties) => defaultTapBoxProperties.copyWith(
          //     builder: (context, state, child) {
          //       return ExtrudedBox(
          //         properties: ExtrudedBox.DEFAULT_PROPERTIES.copyWith(
          //           max: 8.sc,
          //           color: !s ? Colors.blueGrey.shade800 : Colors.green.shade900,
          //           value: !s ? 1.0 : 0.5,
          //         ),
          //         child: ColoredBox(
          //           color: s
          //               ? Colors.green.shade400
          //               : state == TapBoxState.TAP_DOWN
          //                   ? !s
          //                       ? Colors.blueGrey.shade600
          //                       : Colors.green.shade700
          //                   : !s
          //                       ? Colors.blueGrey.shade300
          //                       : Colors.green.shade400,
          //           child: child,
          //         ),
          //       );
          //     },
          //   ),
          // ),

          NavigationBarItem(
            properties: NavigationBarItemProperties(
              selected: true,
              selectedIcon: Icon(
                FluentIcons.home_24_filled,
                color: Colors.blue.shade900,
              ),
              unselectedIcon: Icon(
                FluentIcons.home_24_regular,
                color: Colors.blue.shade900,
              ),
              tapBoxProperties: TapBox.theme.copyWith(
                builder: (context, state, child) {
                  return ExtrudedBox(
                    properties: ExtrudedBox.theme.copyWith(
                      max: 8.sc,
                      color: Colors.blue.shade900,
                      value: state != TapBoxState.TAP_DOWN ? 1.0 : 0.5,
                    ),
                    child: ColoredBox(
                      color: state == TapBoxState.IDLE
                          ? Colors.blue.shade400
                          : state == TapBoxState.TAP_DOWN
                              ? Colors.blue.shade700
                              : Colors.blue.shade400,
                      child: child,
                    ),
                  );
                },
              ),
            ),
          ),

          NavigationBarItem(
            properties: NavigationBarItemProperties(
              selected: true,
              selectedIcon: Icon(
                FluentIcons.home_24_filled,
                color: Colors.blue.shade900,
              ),
              unselectedIcon: Icon(
                FluentIcons.home_24_regular,
                color: Colors.blue.shade900,
              ),
              tapBoxProperties: TapBox.theme.copyWith(
                builder: (context, state, child) {
                  return ExtrudedBox(
                    properties: ExtrudedBox.theme.copyWith(
                      max: 8.sc,
                      color: Colors.blue.shade900,
                      value: state != TapBoxState.TAP_DOWN ? 1.0 : 0.5,
                    ),
                    child: ColoredBox(
                      color: state == TapBoxState.IDLE
                          ? Colors.blue.shade500
                          : state == TapBoxState.TAP_DOWN
                              ? Colors.blue.shade700
                              : Colors.blue.shade400,
                      child: child,
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Home(),
    );
  }
}
