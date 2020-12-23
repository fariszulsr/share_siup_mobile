import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:siup/home/exdash.dart';
import '../home/GridHomePage.dart';
import 'package:siup/dashboard/dashboard.dart';
import 'package:siup/config/config.dart';

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
  static const List<Widget> _widgetOptions = <Widget>[
    Text(
      'Index 0: Home',
      style: optionStyle,
    ),
    Text(
      'Index 2: Account',
      style: optionStyle,
    ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

    @override
    Widget build(BuildContext context) {

      return Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          children: <Widget>[
            SizedBox(
              height: 30,
            ),

            Padding(
              padding: EdgeInsets.only(left: 16, right: 16),
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
                            child: Image.asset('image/logosiup.png', width: 80, height: 80),
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
                    right: 0.0,
                    child: Padding(
                      padding: const EdgeInsets.only(right: 5),
                      child: IconButton(
                        icon: Icon(Icons.circle_notifications),
                        iconSize: 40.0,
                        color: Colors.amber,
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
        bottomNavigationBar: new Theme(data: Theme.of(context).copyWith(
          canvasColor: Colors.white,
          primaryColor: Colors.black,
        ), child: BottomNavigationBar(
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
          currentIndex: _selectedIndex,
          selectedItemColor: Colors.amber,
          unselectedItemColor: Colors.grey,
          onTap: _onItemTapped,
          ),
        ),
      );
    }
  }

