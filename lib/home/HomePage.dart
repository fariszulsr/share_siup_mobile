import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'griddashboard.dart';


// void main() => runApp(MaterialApp(home: Home()));

void main() {
  runApp(HomePage());
}

String username='';

class HomePage extends StatelessWidget {
  @override
  // Widget build(BuildContext context) {
  //   return MaterialApp(
  //     title: 'Login',
  //     debugShowCheckedModeBanner: false,
  //     theme: ThemeData(primarySwatch: Colors.blue, primaryColor: Colors.black),
  //     home: Login(),
  //   );
  // }
  Widget build(BuildContext context) {
    return new MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Home Page',
      home: new homePage(),
      routes: <String,WidgetBuilder>{
        // '/AdminPage': (BuildContext context)=> new AdminPage(username: username,),
        // '/HomePage': (BuildContext context)=> new MemberPage(username: username,),
        // '/MyHomePage': (BuildContext context)=> new Login(),
      },
    );
  }
}

class homePage extends StatefulWidget {

  final String username;
  homePage({this.username});
  @override
  _HomePageState createState() => _HomePageState(username);
}

class _HomePageState extends State<homePage> {

  final String username;
  _HomePageState(this.username);

    @override
    Widget build(BuildContext context) {

      var _currencies = ['Profil', 'Log out'];
      var _currentItemSelected = ['Profil'];

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

                      Text('Orang tua dari : ', style: TextStyle(fontSize: 18.0),),

                      Row(
                        children: <Widget>[
                          Text('$username', style: TextStyle(fontSize: 18.0),),
                          // DropdownButton<String>(
                          //   iconSize: 30,
                          //   items: <String>['Profil', 'Log out'].map((String value) {
                          //     return new DropdownMenuItem<String>(
                          //       value: value,
                          //       child: new Text(value),
                          //     );
                          //   }).toList(),
                          //   onChanged: (value) {},
                          // ),

                          DropdownButton<String>(
                            iconSize: 30,
                            items: _currencies.map((String dropDownStringItem){
                                    return DropdownMenuItem<String>(
                                      value: dropDownStringItem,
                                      child: Text(dropDownStringItem),
                                    );
                            }).toList(),
                            onChanged: (String newValueSelected){
                                setState(()=>_currentItemSelected);
                            }),

                        ],
                      ),

                      // RaisedButton(
                      //   child: Text("Log OUt"),
                      //   onPressed: (){
                      //     Navigator.pushReplacementNamed(context,'/MyHomePage');
                      //   },
                      // ),

                    ],
                  ),

                  Container(
                    child: Image.asset('image/logosiup.png', width: 115, height: 115),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 40,
            ),
            GridDashboard()
          ],
        ),
      );
    }
  }
