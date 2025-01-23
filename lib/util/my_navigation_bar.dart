import 'package:flutter/material.dart';
import 'package:flutter_boxicons/flutter_boxicons.dart';
import 'package:todoapp_practice/pages/about_page%20.dart';
import 'package:todoapp_practice/pages/home_page.dart';
import 'package:todoapp_practice/pages/settings_page.dart';

class MyNavigationBar extends StatefulWidget {
  const MyNavigationBar({super.key});

  @override
  State<MyNavigationBar> createState() => _MyNavigationBarState();
}

class _MyNavigationBarState extends State<MyNavigationBar> {
//----Variables[+]----
  int NavigationIndex = 0;
  List<Widget> Pages = [
    //home
    HomePage(),
    //settings
    SettingsPage(),
    //about
    AboutPage()
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: NavigationIndex,
        children: Pages,
      ),
      bottomNavigationBar: NavigationBar(
        height: 60,
        indicatorColor: Colors.grey[200],
        backgroundColor: Colors.grey[300],
        selectedIndex: NavigationIndex,
        onDestinationSelected: (index) => setState(
          () => NavigationIndex = index,
        ),
        destinations: [
          //home
          NavigationDestination(
            icon: Icon(Icons.home),
            label: "HOME",
            enabled: true,
          ),
          //settings
          NavigationDestination(
            icon: Icon(Icons.settings),
            label: "SETTINGS",
            enabled: false,
          ),
          NavigationDestination(
            icon: Icon(Boxicons.bx_user),
            label: "About",
            enabled: true,
          ),
        ],
      ),
    );
  }
}
