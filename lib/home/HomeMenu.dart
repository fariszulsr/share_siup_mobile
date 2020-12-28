import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:siup/home/exdash.dart';
import '../home/GridHomePage.dart';
import 'package:siup/account/account.dart';
import 'package:siup/dashboard/dashboard.dart';
import 'package:siup/config/config.dart';
import 'package:siup/main.dart';
import 'package:siup/home/HomePage.dart';

String username='';

class HomeMenu extends StatefulWidget {
  // final String results;
  final String username;
  HomeMenu({this.username});
  @override
  _HomeMenuState createState() => _HomeMenuState(username: username);
}

class _HomeMenuState extends State<HomeMenu> {

  final String username;
  // final List<String> results;
  _HomeMenuState({this.username});
  var _currencies = ['Profil', 'Log out'];
  var _currentItemSelected = ['Profil'];

  int _selectedIndex = 0;
  static const TextStyle optionStyle =
  TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  final List<Widget> _children = [
    homePage(),
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
        body: Column(
          children: <Widget>[
            SizedBox(
              height: 30,
            ),

            Padding(
              padding: EdgeInsets.only(left: 16, right: 16, bottom: 50),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      SizedBox(
                        height: 4,
                      ),

                      // Text('Orang tua dari : ', style: TextStyle(fontSize: 18.0),),

                      Row(
                        children: <Widget>[
                          //     Text('$username', style: TextStyle(fontSize: 18.0),),

                          Container(
                            child: Padding(
                              padding: const EdgeInsets.only(left: 10),
                              child: Image.asset('image/logosiup.png', width: 80, height: 80),
                            ),
                          ),
                        ],
                      ),

                      // RaisedButton(
                      //   child: Text("Log OUt"),
                      //   onPressed: (){
                      //     // Navigator.pushReplacementNamed(context,'/Login');
                      //     print('homepage');
                      //   },
                      // ),

                    ],
                  ),
                  Positioned(
                    // right: 0.0,
                    child: Padding(
                      padding: const EdgeInsets.only(right: 5),
                      child: IconButton(
                        icon: Icon(Icons.notifications),
                        iconSize: 40.0,
                        color: Colors.blue,
                        onPressed: (){
                          Navigator.pushReplacementNamed(context, '/Notifications');
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
            GridHomePage()
          ],
        ),
        ),
      );
  }
}

