import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:siup/presensi/PresensiPage.dart';
import '../presensi/GridPresensiPage.dart';
import 'package:siup/account/account.dart';
import 'package:siup/main.dart';
import 'package:siup/home/HomePage.dart';

String username='';

class DetailPresensiPage extends StatefulWidget {
  final String deskripsi;
  // final String username;
  DetailPresensiPage({this.deskripsi});
  @override
  _detailPresensiPage createState() => _detailPresensiPage(deskripsi:deskripsi);
}

class _detailPresensiPage extends State<DetailPresensiPage> {

  final String deskripsi;
  // final String username;
  // final List<String> results;
  _detailPresensiPage({String this.deskripsi});

  int _selectedIndex = 0;
  static const TextStyle optionStyle =
  TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
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

    return new WillPopScope(
      onWillPop: (){
        Navigator.pushReplacement(context,
            new MaterialPageRoute(builder: (context) => PresensiPage())
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
            title: Column(
              children: [
                Text(deskripsi, style: TextStyle(color: Colors.blue),),
              ],
            ),
            backgroundColor: Colors.white,
            leading: GestureDetector(
              onTap: (){
                // Navigator.pushReplacementNamed(context, '/DetailPresensiPage');
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (BuildContext context) => PresensiPage(username:username)),
                );
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
          // GridPresensiPage()
        ],
      ),
    ),
    );
  }
}

