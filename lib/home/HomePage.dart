import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:siup/home/HomeMenu.dart';
import 'package:siup/home/exdash.dart';
import '../home/GridHomePage.dart';
import 'package:siup/account/account.dart';
import 'package:siup/dashboard/dashboard.dart';
import 'package:siup/config/config.dart';
import 'package:siup/main.dart';

String username='';

class homePage extends StatefulWidget {
  // final String results;
  final String username;
  homePage({this.username});
  @override
  _HomePageState createState() => _HomePageState(username: username);
}

class _HomePageState extends State<homePage> {

  final String username;
  // final List<String> results;
  _HomePageState({this.username});
  var _currencies = ['Profil', 'Log out'];
  var _currentItemSelected = ['Profil'];

  int _selectedIndex = 0;
  static const TextStyle optionStyle =
  TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  final List<Widget> _children = [
    HomeMenu(),
    Account(),
  ];
  // static const List<Widget> _widgetOptions = <Widget>[
  //   Text(
  //     'Index 0: Home',
  //     style: optionStyle,
  //   ),
  //   Text(
  //     'Index 2: Account',
  //     style: optionStyle,
  //   ),
  // ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

    @override
    Widget build(BuildContext context) {

      return new WillPopScope(
        onWillPop: (){
          Navigator.pushReplacement(context,
              new MaterialPageRoute(builder: (context) => Login())
            /*homePage(username: username,)*/
          );
        },
        child: Scaffold(
        backgroundColor: Colors.white,
        body: _children[_selectedIndex],
        bottomNavigationBar: new Theme(data: Theme.of(context).copyWith(
          canvasColor: Colors.white,
          primaryColor: Colors.black,
        ), child: BottomNavigationBar(
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: _selectedIndex==0?Image.asset("image/home/user_icon.png", scale: 17, color: Colors.grey,)
                                     :Image.asset("image/home/user_icon.png", scale: 17, color: Colors.blue,),
              label: 'Account',
            ),
          ],
          selectedItemColor: Colors.blue,
          unselectedItemColor: Colors.grey,
          onTap: _onItemTapped,
          currentIndex: _selectedIndex,
        ),
        ),
        ),
      );
    }
  }

