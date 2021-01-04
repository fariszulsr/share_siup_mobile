import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';
// import 'package:http/http.dart' as http;
import 'package:siup/account/account.dart';
import 'package:siup/home/HomePage.dart';
import 'package:crypto/crypto.dart';
import 'package:siup/other/menu_dashboard.dart';
import 'package:siup/schedule/SchedulePage.dart';
import 'package:siup/notification/notifications.dart';
import 'package:postgres/postgres.dart';
import 'package:siup/presensi/PresensiPage.dart';
import 'package:siup/presensi/DetailPresensiPage.dart';

void main() {
  runApp(MyApp());
}

String username='';
String password='';
int id = 0;

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
        '/Account' : (BuildContext context)=> new Account(),
        '/PresensiPage' : (BuildContext context)=> new PresensiPage(),
        '/DetailPresensiPage' : (BuildContext context)=> new DetailPresensiPage(),
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
  String salt_test='';
  List<int> cekId = new List<int>();
  int roleCek = 0;

  // get connect => connect;

  Future<List> _login() async {
    // List<int> message = utf8.encode(pass.text);
    // List<int> key = utf8.encode("O4ANlHJXXuqhS1nivZMXvMHF3bfIhLNahMFhb8FX1nLhAOoXHq3ipauyryGavSei3Fc0InQ89dmFhcFdByoUE97RwfespJWCnT2GswLXF2Nosqo0xgQKh6LAAsqyx9z1bmMd37CbPMmQXk239dKAXmDpYtf7Gjlsv9IhHvkeFhmoaqtE7snraaIjqK2T73grN7ICYIMV3dlSJi05ltz6QUzLGcjA3C4wrJRUyeMHVzbrINrAzCh781qQ6q7R6Q6");
    // var hmac = new Hmac(sha512, key);
    // var encodePassword = hmac.convert(message);

    // final response = await http.post("http://10.0.2.2/flutter_siup/login.php", body: {
    //   "username": user.text,
    //   "password": encodePassword.toString(),
    // });

    // final getSalt = await http.get("http://10.0.2.2/flutter_siup/getSalt.php");
    // var salt = json.encode(getSalt);

    final connect = PostgreSQLConnection("10.0.2.2", 5432, "siup", username: 'postgres', password: 'root');
    await connect.open();
    List<List<dynamic>> salt = await connect.query("SELECT salt FROM tmst_pengguna WHERE username = @username",substitutionValues: {"username":user.text});
    for (final row in salt){
      salt_test = row[0];
    }
    List<int> message = utf8.encode(pass.text);
    var key = utf8.encode(salt_test);
    var hmac = new Hmac(sha512, key);
    Digest encodePassword = hmac.convert(message);
    final datauser = await connect.query("SELECT * FROM tmst_pengguna WHERE username = @username AND password = @password", substitutionValues: {"username": user.text, "password": '$encodePassword'});
    for (final row in datauser){
      id = row[0];
      username = row[1];
    }
    var cekRole = await connect.query("SELECT * FROM tran_pengguna_sistem WHERE id_pengguna = @id", substitutionValues: {"id":id});
    for (var value in cekRole){
      cekId.add(value[1]);
    }

    for (final row in cekId) {
      if (row == 9){
        roleCek = 1;
      }
      else{
        roleCek = 0;
      }
    }
    print(datauser.length);

    if(datauser.length==0){
      setState(() {
        msg="Username atau Password salah";
      });
    }else{
      if(datauser!=null){
        if(roleCek == 0){
          setState(() {
            msg="User bukan merupakan orangtua mahasiswa";
          });
        }
        else{
          if(roleCek == 1){
            Navigator.pushReplacementNamed(context, '/HomePage');
            print("homepage");
          }
          setState(() {
            username= username;
            id=id;
          });
        }
      }
    }

    print(username);
    return datauser;
  }

  @override

  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(centerTitle: true, title: Text("SIUP Parents"),),
      resizeToAvoidBottomPadding: false,
      body: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                child: Image.asset('image/logosiup.png', width: 200, height: 200,),
                margin: const EdgeInsets.only(top: 10.0),
              ),

              SizedBox(
                height: 15,
              ),

              Container(
                width: 300,
                child: TextFormField(
                  controller: user,
                  keyboardType: TextInputType.emailAddress,
                  autofocus: false,
                  textAlign: TextAlign.center,
                  style: new TextStyle(fontWeight: FontWeight.normal, color: Colors.black, fontSize: 20.0),
                  textAlignVertical: TextAlignVertical.center,
                  decoration: InputDecoration(
                    prefixIcon: Image.asset('image/home/user_icon.png', color: Colors.lightGreen, scale: 15),
                    hintText: 'Username',
                    contentPadding: new EdgeInsets.symmetric(vertical: 5.0, horizontal: 5.0),
                    // border: OutlineInputBorder(borderRadius: BorderRadius.circular(10.0)),
                  ),
                ),
              ),

              SizedBox(
                height: 8,
              ),

              Container(
                width: 300,
                child: TextFormField(
                  controller: pass,
                  // keyboardType: TextInputType.emailAddress,
                  autofocus: false,
                  textAlign: TextAlign.center,
                  obscureText: true,
                  style: new TextStyle(fontWeight: FontWeight.normal, color: Colors.black, fontSize: 20.0),
                  textAlignVertical: TextAlignVertical.center,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.lock, color: Colors.lightGreen, size: 30),
                    hintText: 'Password',
                    contentPadding: new EdgeInsets.symmetric(vertical: 5.0, horizontal: 5.0),
                    // border: OutlineInputBorder(borderRadius: BorderRadius.circular(10.0)),
                  ),
                ),
              ),

              SizedBox(
                height: 10,
              ),

              Container(
                width: 300,
                child: Align(
                  alignment: Alignment.centerRight,
                  child: InkWell(
                    child: Text("Forget Password",
                        style: TextStyle(fontSize: 18, color: Colors.blue, decoration: TextDecoration.underline)),
                    onTap: (){
                      _login();
                    },
                  ),
                ),
              ),

              SizedBox(
                height: 20,
              ),

              ButtonTheme(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18.0),
                ),
                minWidth: 300.0,
                child: RaisedButton(
                  child: Text("Log In",
                      style: TextStyle(fontSize: 20, color: Colors.white)),
                  onPressed: (){
                    _login();
                    print('salt');
                  },
                ),
              ),

              SizedBox(
                height: 10,
              ),

              Text(msg,style: TextStyle(fontSize: 20.0,color: Colors.red),),
            ],
          ),
        ),
      ),
    );
  }
}
