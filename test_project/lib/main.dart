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
      //appBar: ,
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            BasicHeader(
              title: 'Home',
              optionsMenuTitle: 'Options',
              optionsMenuBuilder: (context) {
                return [
                  BasicBtn(
                    text: 'Profile',
                    onTap: () {},
                  ),
                  BasicBtn(
                    text: 'Settings',
                    onTap: () {},
                  ),
                  ContentDivider(
                    color: Theme.of(context).colorScheme.surfaceBright,
                  ),
                  BasicErrBtn(
                    text: 'Logout',
                    onTap: () {},
                  ),
                ];
              },
              onTapDownBack: (_) {},
            ),
            Padding(
              padding: EdgeInsets.all(12.sc),
              child: BasicShelf(
                items: [
                  BasicShelfItem(
                    titleText: 'Q&A',
                    bodyText: 'Common questions and answers',
                    onTap: () {},
                  ),
                  BasicShelfItem(
                    titleText: 'Text',
                    onTap: () {},
                  ),
                  BasicShelfItem(
                    titleText: 'Text',
                    onTap: () {},
                  ),
                ],
              ),
            ),
            ContentDivider.horizontal(
              children: const [
                ContentDividerChild(
                  alignment: ContentDividerAlignment.END,
                  child: Text(
                    'Hello',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                ContentDividerChild(
                  child: Text(
                    'World',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.all(24.sc),
              child: const BasicSurface(
                child: SizedBox(
                  width: double.infinity,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextEdit(),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(24.sc),
              child: const BasicSurface(
                child: SizedBox(
                  width: double.infinity,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  //@override
  Widget build1(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        shrinkWrap: true,
        slivers: [
          BasicSliverHeader(
            title: 'Home',
            optionsMenuTitle: 'Options',
            optionsMenuBuilder: (context) {
              return [
                BasicBtn(
                  text: 'Profile',
                  onTap: () {},
                ),
                BasicBtn(
                  text: 'Settings',
                  onTap: () {},
                ),
                ContentDivider(
                  color: Theme.of(context).colorScheme.surfaceBright,
                ),
                BasicErrBtn(
                  text: 'Logout',
                  onTap: () {},
                ),
              ];
            },
            onTapDownBack: (_) {},
          ),
          ...children(context).map((e) => SliverToBoxAdapter(
                child: Align(alignment: Alignment.centerLeft, child: e),
              )),
          // SliverToBoxAdapter(
          //   child: Container(
          //     padding: EdgeInsets.all(16),
          //     color: Colors.blueAccent,
          //     child: Text(
          //       'This is a normal widget',
          //       style: TextStyle(color: Colors.white, fontSize: 18),
          //     ),
          //   ),
          // ),
          //   Builder(builder: (context) {
          //     final items = children(context);
          //     return SliverList(
          //       delegate: SliverChildBuilderDelegate(
          //         (context, index) {
          //           return items[index];
          //         },
          //         childCount: items.length, // Number of items
          //       ),
          //     );
          //   }),
          // ],
        ],
      ),
    );
  }

  List<Widget> children(BuildContext context) {
    return [
      // Badge(
      //   backgroundColor: Colors.yellow,
      //   label: Text('HELLO'),
      //   child: Icon(Icons.add),
      // ),
      BasicBtn(
        text: 'Login',
        onTap: () {},
      ),
      BasicErrBtn(
        text: 'Logout',
        onTap: () {},
      ),
      BasicBackBtn(
        onTap: () {},
      ),
      BasicCheckBtn(
        pState: Pod(false),
        onTap: (pState) => pState.update((e) => !e),
      ),
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

      BasicNavigationBarBtn(
        pState: Pod(true),
        onTap: () {},
        iconBuilder: (state) {
          switch (state) {
            case NavigationBarItemState.SELECTED:
              return Icon(
                FluentIcons.home_24_filled,
                color: Theme.of(context).colorScheme.primary,
                size: 24.sc,
              );
            case NavigationBarItemState.UNSELECTED:
              return Icon(
                FluentIcons.home_24_regular,
                color: Theme.of(context).colorScheme.primary,
                size: 24.sc,
              );
            case NavigationBarItemState.DISABLED:
              return Icon(
                FluentIcons.home_24_regular,
                color:
                    Theme.of(context).colorScheme.primary.withSaturation(0.0),
                size: 24.sc,
              );
          }
        },
      ),

      // NavigationBarItem(
      //   properties: NavigationBarItemProperties(
      //     selected: true,
      //     selectedIcon: Icon(
      //       FluentIcons.home_24_filled,
      //       color: Colors.blue.shade900,
      //     ),
      //     unselectedIcon: Icon(
      //       FluentIcons.home_24_regular,
      //       color: Colors.blue.shade900,
      //     ),
      //     tapBoxProperties: TapBox.theme.copyWith(
      //       builder: (context, state, child) {
      //         return ExtrudedBox(
      //           properties: ExtrudedBox.theme.copyWith(
      //             max: 8.sc,
      //             color: Colors.blue.shade900,
      //             value: state != TapBoxState.TAP_DOWN ? 1.0 : 0.5,
      //           ),
      //           child: ColoredBox(
      //             color: state == TapBoxState.IDLE
      //                 ? Colors.blue.shade500
      //                 : state == TapBoxState.TAP_DOWN
      //                     ? Colors.blue.shade700
      //                     : Colors.blue.shade400,
      //             child: child,
      //           ),
      //         );
      //       },
      //     ),
      //   ),
      // ),
    ];
  }
}

void main() {
  DI.theme.register(
    TextEdit.theme.copyWith(cursorColor: Colors.white),
  );
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      themeMode: ThemeMode.dark,
      debugShowCheckedModeBanner: false,
      home: const Home(),
    );
  }
}
