import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:siup/home/HomePage.dart';
import 'package:crypto/crypto.dart';
import 'package:siup/other/menu_dashboard.dart';
import 'package:siup/schedule/SchedulePage.dart';
import 'package:siup/notification/notifications.dart';
// import 'package:format_indonesia/format_indonesia.dart';

void main() {
  runApp(MyApp());
}

String username='';

class MyApp extends StatelessWidget {
  // get results => results;

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
        '/HomePage': (BuildContext context)=> new homePage(username: username),
        '/Login': (BuildContext context)=> new Login(),
        '/menudash' : (BuildContext context)=> new MenuDashboardPage(),
        '/Notifications' : (BuildContext context)=> new Notifications(username: username,),
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
  // TextEditingController results=new TextEditingController();

  String msg='';

  // get connect => connect;

  Future<List> _login() async {
    List<int> message = utf8.encode(pass.text);
    List<int> key = utf8.encode("O4ANlHJXXuqhS1nivZMXvMHF3bfIhLNahMFhb8FX1nLhAOoXHq3ipauyryGavSei3Fc0InQ89dmFhcFdByoUE97RwfespJWCnT2GswLXF2Nosqo0xgQKh6LAAsqyx9z1bmMd37CbPMmQXk239dKAXmDpYtf7Gjlsv9IhHvkeFhmoaqtE7snraaIjqK2T73grN7ICYIMV3dlSJi05ltz6QUzLGcjA3C4wrJRUyeMHVzbrINrAzCh781qQ6q7R6Q6");
    var hmac = new Hmac(sha512, key);
    var encodePassword = hmac.convert(message);

    final response = await http.post("http://10.0.2.2/flutter_siup/login.php", body: {
      "username": user.text,
      "password": encodePassword.toString(),
    });

    // final getSalt = await http.get("http://10.0.2.2/flutter_siup/getSalt.php");
    // var salt = json.encode(getSalt);

    // final response = await connect.query("SELECT salt FROM tmst_pengguna WHERE id = 8080");
    // var test = json.decode(response);
    // print(salt);

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

              // Container(
              //   width: 300.0,
              //   child: TextField(
              //       controller: user,
              //       textAlign: TextAlign.center,
              //       decoration: InputDecoration(
              //           border: new OutlineInputBorder(
              //               borderSide: new BorderSide(color: Colors.teal)),
              //           // icon: Icon(Icons.email, color: Colors.black, size: 60,),
              //           hintText: 'Username'
              //       ),
              //     ),
              // ),

              Container(
                width: 300,
                child: TextFormField(
                  controller: user,
                  keyboardType: TextInputType.emailAddress,
                  autofocus: false,
                  textAlign: TextAlign.center,
                  // initialValue: 'sathyabaman@gmail.com',
                  style: new TextStyle(fontWeight: FontWeight.normal, color: Colors.black),
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.email, color: Colors.black, size: 30),
                    hintText: 'Username',
                    contentPadding: new EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(10.0)),
                  ),
                ),
              ),

              SizedBox(
                height: 8,
              ),
              // Text("Password",style: TextStyle(fontSize: 18.0),),
              // Container(
              //   width: 300.0,
              //   child: TextField(
              //     controller: pass,
              //     obscureText: true,
              //     textAlign: TextAlign.center,
              //     decoration: InputDecoration(
              //         border: new OutlineInputBorder(
              //             borderSide: new BorderSide(color: Colors.teal)),
              //         // icon: Icon(Icons.lock, color: Colors.black, size: 60),
              //         hintText: 'Password'
              //     ),
              //   ),
              // ),

              Container(
                width: 300,
                child: TextFormField(
                  controller: pass,
                  // keyboardType: TextInputType.emailAddress,
                  autofocus: false,
                  textAlign: TextAlign.center,
                  obscureText: true,
                  // initialValue: 'sathyabaman@gmail.com',
                  style: new TextStyle(fontWeight: FontWeight.normal, color: Colors.black),
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.lock, color: Colors.black, size: 30),
                    hintText: 'Password',
                    contentPadding: new EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(10.0)),
                  ),
                ),
              ),

              SizedBox(
                height: 20,
              ),

              ButtonTheme(
                minWidth: 150.0,
                child: RaisedButton(
                  child: Text("Login",
                      style: TextStyle(fontSize: 15, color: Colors.white)),
                  onPressed: (){
                    _login();
                    print('salt');
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
              Align(
                alignment: Alignment.bottomCenter,
                child: InkWell(
                  child: Text("FORGOT USERNAME/PASSWORD?",
                      style: TextStyle(fontSize: 15, color: Colors.black)),
                  onTap: (){
                    _login();
                  },
                ),
              ),


              Text(msg,style: TextStyle(fontSize: 20.0,color: Colors.red),)

            ],
          ),
        ),
      ),
    );
  }
}
