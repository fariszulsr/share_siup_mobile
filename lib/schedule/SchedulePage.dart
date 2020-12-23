import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:siup/home/exdash.dart';
import '../home/GridHomePage.dart';
import 'package:siup/dashboard/dashboard.dart';
import 'package:siup/schedule/GridSchedulePage.dart';
import 'package:siup/home/HomePage.dart';
import 'package:dropdownfield/dropdownfield.dart';

String username='';

class schedulePage extends StatefulWidget {

  final String username;
  schedulePage({this.username});
  @override
  _SchedulePageState createState() => _SchedulePageState(username);
}

class _SchedulePageState extends State<schedulePage> {

  final String username;
  _SchedulePageState(this.username);
  var _currencies = ['Profil', 'Log out'];
  var _currentItemSelected = ['Profil'];

    @override
    Widget build(BuildContext context) {

      return new WillPopScope(
        onWillPop: (){
          Navigator.pushReplacement(context,
            new MaterialPageRoute(builder: (context) => homePage(username: username,))
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
                          // Text('$username', style: TextStyle(fontSize: 18.0),),
                          Container(
                            child: Image.asset('image/logosiup.png', width: 80, height: 80),
                          ),
                        ],
                      ),

                      // RaisedButton(
                      //   child: Text("Log OUt"),
                      //   onPressed: (){
                      //     Navigator.pushReplacementNamed(context,'/Login');
                      //     print('logout');
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
            // SizedBox(
            //   height: 10,
            // ),
            Text('Kalender Akademik dan Jadwal Kuliah', textAlign: TextAlign.center, style: TextStyle(fontWeight: FontWeight.bold, color: Colors.blueGrey, fontSize: 20),),

            GridSchedulePage()
            // exDash()
          ],
        ),
      ),
      );
    }
  }

