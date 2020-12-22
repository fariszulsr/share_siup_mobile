import 'package:flutter/material.dart';

class AdminPage extends StatelessWidget {

  AdminPage({this.username});
  final String username;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(centerTitle: true, title: Text("Welcome Admin"),),
      body: Column(
        children: <Widget>[
          Text('Hallo $username', style: TextStyle(fontSize: 20.0),),

          RaisedButton(
            child: Text("Log OUt"),
            onPressed: (){
              Navigator.pushReplacementNamed(context,'/Login');
            },
          ),
        ],
      ),
    );
  }
}