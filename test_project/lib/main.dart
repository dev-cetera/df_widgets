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
          NavigationBarItem(
            properties: NavigationBarItemProperties(
              selected: true,
              size: 50,
              selectedIcon: Icon(FluentIcons.home_24_filled),
              unselectedIcon: Icon(FluentIcons.home_24_regular),
              tapBoxProperties: TapBox.DEFAULT_PROPERTIES.copyWith(
                overlayHoverDecoration: BoxDecoration(
                  color: Colors.transparent,
                  border: Border.all(
                    color: Colors.black,
                    width: 3,
                  ),
                  shape: BoxShape.circle,
                ),
                overlayTapDecoration: BoxDecoration(
                  color: Colors.black.withAlpha(32),
                  border: Border.all(
                    color: Colors.black,
                    width: 3,
                  ),
                  shape: BoxShape.circle,
                ),
                decoration: BoxDecoration(
                  color: Colors.yellow[300],
                  shape: BoxShape.circle,
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
