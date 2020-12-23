import 'package:flutter/material.dart';
import 'package:siup/home/HomePage.dart';
import 'package:intl/intl.dart';
import 'package:format_indonesia/format_indonesia.dart';

String username = '';

class Notifications extends StatefulWidget {

  final String username;
  Notifications({this.username});
  @override
  _notifications createState() => _notifications(username);
}

class _notifications extends State<Notifications> with TickerProviderStateMixin {
  final String username;

  _notifications(this.username);
  // DateTime now = DateTime.now();
  var dataTabel1 = new Container(
    color: Colors.white,
    child: Table(
      columnWidths: {
        0: FixedColumnWidth(100)
      },
      children: [
        TableRow(
          decoration: BoxDecoration(
            color: Colors.white38,
          ),
          children: [
            Text(Waktu(DateTime.now()).format("EEEE, d MMM yyyy"), style: TextStyle(fontWeight: FontWeight.bold),),
          ],
        ),
      ],
    ),
  );

  var dataTabel2 = new Container(
    color: Colors.white,
    // padding: EdgeInsets.fromLTRB(5.0, 0.0, 5.0, 0.0),
    child: Table(
      border: TableBorder(
        top: BorderSide(width: 1, color: Colors.grey, style: BorderStyle.solid),
        bottom: BorderSide(width: 1, color: Colors.grey, style: BorderStyle.solid)
      ),
        columnWidths: {
          0: FixedColumnWidth(100),
        },
        children: [
          TableRow(
            decoration: BoxDecoration(
              color: Colors.white,
            ),
            children: [
              Text('Masa Perkuliahan Semester Ganjil', style: TextStyle(fontSize: 20),),
              // Text('Masa Perkuliahan Semester Genap', style: TextStyle(fontSize: 20),),
            ],
          ),
        ],
      ),
    );

  @override
  Widget build(BuildContext context) {
    // var color = Colors.lime;
    return new WillPopScope(
        onWillPop: (){
          Navigator.pushReplacement(context,
              new MaterialPageRoute(builder: (context) => homePage(username: username,))
          );
        },

    child: Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title:Text("Notifications", style: TextStyle(color: Colors.black),),
        backgroundColor: Colors.white,
        leading: GestureDetector(
          onTap: (){
            Navigator.pushReplacementNamed(context, '/HomePage');
          },
          child: Icon(Icons.arrow_back_ios, color: Colors.black,),
        ),
      ),
      body: Column(
          children:<Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Table(
                children: [
                  TableRow(
                    children: [
                      dataTabel1,
                    ]
                  ),
                  TableRow(
                    children:[
                      dataTabel2,
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}