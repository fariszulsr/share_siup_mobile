import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:siup/dashboard/dashboard.dart';
import 'package:siup/home/HomePage.dart';
import 'package:siup/home/GridHomePage.dart';
// import 'package:siup/other/menu_dashboard.dart';
import 'AdminPage.dart';
import 'package:crypto/crypto.dart';
import 'dart:convert';
import 'package:siup/other/menu_dashboard.dart';
import 'package:siup/schedule/SchedulePage.dart';

void main() {
  runApp(MyApp());
}

String username='';

class MyApp extends StatelessWidget {
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
      title: 'Login',
      home: new Login(),
      routes: <String,WidgetBuilder>{
        '/SchedulePage': (BuildContext context)=> new schedulePage(username: username,),
        '/HomePage': (BuildContext context)=> new homePage(username: username,),
        '/Login': (BuildContext context)=> new Login(),
        '/menudash' : (BuildContext context)=> new MenuDashboardPage(),
      },
    );
  }
}

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController user=new TextEditingController();
  TextEditingController pass=new TextEditingController();
  TextEditingController encode=new TextEditingController();

  String msg='';

  Future<List> _login() async {
    // List<int> message = utf8.encode(pass.text);
    // List<int> key = utf8.encode("O4ANlHJXXuqhS1nivZMXvMHF3bfIhLNahMFhb8FX1nLhAOoXHq3ipauyryGavSei3Fc0InQ89dmFhcFdByoUE97RwfespJWCnT2GswLXF2Nosqo0xgQKh6LAAsqyx9z1bmMd37CbPMmQXk239dKAXmDpYtf7Gjlsv9IhHvkeFhmoaqtE7snraaIjqK2T73grN7ICYIMV3dlSJi05ltz6QUzLGcjA3C4wrJRUyeMHVzbrINrAzCh781qQ6q7R6Q6");
    // var hmac = new Hmac(sha512, key);
    // var encodePassword = hmac.convert(message);

    final response = await http.post("http://10.0.2.2/flutter_siup/login.php", body: {
      "username": user.text,
      "password": pass.text,
    });

    var datauser = json.decode(response.body);

    if(datauser.length==0){
      setState(() {
        msg="Username atau Password salah";
      });
    }else{
      if(datauser!=null){
        Navigator.pushReplacementNamed(context, '/HomePage');
        print("homepage");
      }
      // else if(datauser[0]['level']=='member'){
      //   Navigator.pushReplacementNamed(context, '/MemberPage');
      // }

      setState(() {
        username= datauser[0]['username'];
      });

    }

    return datauser;
  }

  @override

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(centerTitle: true, title: Text("SIUP Parents"),),
      body: Container(
        child: Center(
          child: Column(
            children: <Widget>[

              Container(
                child: Image.asset('image/logosiup.png'),
                margin: const EdgeInsets.only(top: 20.0),
              ),

              SizedBox(
                height: 5,
              ),

              // Text("Username",style: TextStyle(fontSize: 18.0),),

              TextField(
                controller: user,
                textAlign: TextAlign.center,
                decoration: InputDecoration(
                    icon: Icon(Icons.email, color: Colors.black),
                    hintText: 'Username'
                ),
              ),

              // Text("Password",style: TextStyle(fontSize: 18.0),),
              TextField(
                controller: pass,
                obscureText: true,
                textAlign: TextAlign.center,
                decoration: InputDecoration(
                    icon: Icon(Icons.lock, color: Colors.black),
                    hintText: 'Password'
                ),
              ),

              SizedBox(
                height: 10,
              ),

              ButtonTheme(
                minWidth: 350.0,
                child: RaisedButton(
                  child: Text("Login",
                      style: TextStyle(fontSize: 15, color: Colors.white)),
                  onPressed: (){
                    _login();
                  },
                ),
              ),

              SizedBox(
                height: 10,
              ),

              // Visibility(
              //   visible: false,
              //   child: TextFormField(
              //       initialValue: "LastNamePlaceholder",
              //       validator: (val) {
              //         return val.isEmpty ? S.of(context).lastNameIsRequired : null;
              //       },
              //       decoration: InputDecoration(labelText: S.of(context).lastName),
              //       onSaved: (String value) {
              //         address.lastName = value;
              //       }),
              // )

              // ButtonTheme(
              //   child: RaisedButton(
              //     child: Text("FORGOT USERNAME/PASSWORD?",
              //       style: TextStyle(fontSize: 15, color: Colors.white)),
              //     onPressed: (){
              //       _login();
              //     },
              //   ),
              // ),

              Text(msg,style: TextStyle(fontSize: 20.0,color: Colors.red),)

            ],
          ),
        ),
      ),
    );
  }
}
