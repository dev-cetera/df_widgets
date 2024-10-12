import 'package:df_widgets/_common.dart';
import 'package:df_widgets/df_widgets.dart';
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
              selectedIcon: Icon(Icons.home),
              unselectedIcon: Icon(Icons.home_outlined),
              tapBoxProperties: TapBox.DEFAULT_PROPERTIES.copyWith(
                decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.circular(8.sc),
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
