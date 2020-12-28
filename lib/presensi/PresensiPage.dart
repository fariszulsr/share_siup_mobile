import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../presensi/GridPresensiPage.dart';
import 'package:siup/account/account.dart';
import 'package:siup/main.dart';
import 'package:siup/home/HomePage.dart';

String username='';

class PresensiPage extends StatefulWidget {
  // final String results;
  final String username;
  PresensiPage({this.username});
  @override
  _presensiPage createState() => _presensiPage(username: username);
}

class _presensiPage extends State<PresensiPage> {

  final String username;
  // final List<String> results;
  _presensiPage({this.username});
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
            new MaterialPageRoute(builder: (context) => homePage())
          /*homePage(username: username,)*/
        );
      },
      child: Scaffold(
      backgroundColor: Colors.white,
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(80),
          child: AppBar(
            // primary: false,
            centerTitle: false,
            title:Text("Absensi", style: TextStyle(color: Colors.blue),),
            backgroundColor: Colors.white,
            leading: GestureDetector(
              onTap: (){
                Navigator.pushReplacementNamed(context, '/HomePage');
              },
              child: Icon(Icons.arrow_back_ios, color: Colors.blue,),
            ),
            actions: [
              Padding(
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
            ],
          ),
        ),
      body: Column(
        children: <Widget>[
          GridPresensiPage()
        ],
      ),
    ),
    );
  }
}

