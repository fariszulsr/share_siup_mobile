import 'package:flutter/material.dart';
import 'package:siup/home/HomePage.dart';
import 'package:siup/account/account.dart';

class Tabbar extends StatefulWidget {
  Tabbar({this.screens});

  static const Tag = "Tabbar";
  final List<Widget> screens;
  @override
  State<StatefulWidget> createState() {
    return _TabbarState();
  }
}

class _TabbarState extends State<Tabbar> {
  int _selectedIndex = 0;
  Widget currentScreen;
  final List<Widget> _children = [
    homePage(),
    Account(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    // var _l10n = PackedLocalizations.of(context);

    Expanded(
      child: Scaffold(
        body: _children[_selectedIndex],
        bottomNavigationBar: new Theme(data: Theme.of(context).copyWith(
          canvasColor: Colors.white,
          primaryColor: Colors.black,
        ),
        child: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.account_circle),
              label: 'Account',
            ),
          ],
          selectedItemColor: Colors.amber,
          unselectedItemColor: Colors.grey,
          onTap: _onItemTapped,
          currentIndex: _selectedIndex,
        ),
      ),
    ),
    );
  }

  void onTabTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
}