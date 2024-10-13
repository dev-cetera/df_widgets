import 'package:df_widgets/_common.dart';
import 'package:df_widgets/df_widgets.dart';
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
          TapBox(
            properties: TapBox.DEFAULT_PROPERTIES.copyWith(
              builder: (context, state, child) {
                print(state);
                return Extruded(
                  properties: Extruded.DEFAULT_PROPERTIES.copyWith(
                    showExtrusion: state != TapBoxState.TAP_DOWN,
                  ),
                  child: ColoredBox(
                    color: state == TapBoxState.IDLE
                        ? Colors.yellow.shade600
                        : state == TapBoxState.TAP_DOWN
                            ? Colors.yellow.shade500
                            : Colors.yellow.shade400,
                    child: child,
                  ),
                );
              },
            ),
            child: const Padding(
              padding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
              child: Text(
                'LOG IN',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(100),
            child: NavigationBarItem(
              properties: NavigationBarItemProperties(
                selected: true,
                size: 80,
                selectedIcon: Icon(FluentIcons.home_24_filled),
                unselectedIcon: Icon(FluentIcons.home_24_regular),
                tapBoxProperties: TapBox.DEFAULT_PROPERTIES.copyWith(
                  builder: (context, state, child) {
                    return Extruded(
                      properties: Extruded.DEFAULT_PROPERTIES.copyWith(
                        showExtrusion: state != TapBoxState.TAP_DOWN,
                      ),
                      child: ColoredBox(
                        color: state == TapBoxState.IDLE
                            ? Colors.blue.shade600
                            : state == TapBoxState.TAP_DOWN
                                ? Colors.blue.shade500
                                : Colors.blue.shade400,
                        child: child,
                      ),
                    );
                  },
                ),
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
