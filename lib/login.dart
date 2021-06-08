import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:siup/home/HomePage.dart';
import 'package:siup/main.copy.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light.copyWith(statusBarColor: Colors.transparent));
    return Scaffold(
      body: Container(
        color: Colors.white,
        // decoration: BoxDecoration(
        //   gradient: LinearGradient(
        //       colors: [Colors.blue, Colors.teal],
        //       begin: Alignment.topCenter,
        //       end: Alignment.bottomCenter),
        // ),
        child: _isLoading ? Center(child: CircularProgressIndicator()) : ListView(
          children: <Widget>[
            headerSection(),
            textSection(),
            buttonSection(),
          ],
        ),
      ),
    );
  }

  signIn(String email, pass) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    Map data = {
      'username': email,
      'password': pass
    };
    var jsonResponse = null;
    var response = await http.post("https://siup.universitaspertamina.ac.id/mobile/v1/login", body: data);
    if(response.statusCode == 200) {
      jsonResponse = json.decode(response.body);
      if(jsonResponse != null) {
        setState(() {
          _isLoading = true;
        });
        sharedPreferences.setString("token", jsonResponse['token']);
        Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (BuildContext context) => homePage()), (Route<dynamic> route) => false);
      }
    }
    else {
      setState(() {
        _isLoading = false;
      });
      print(response.body);
    }
  }

  Container buttonSection() {
    return Container(
        width: MediaQuery.of(context).size.width,
        height: 40.0,
        padding: EdgeInsets.symmetric(horizontal: 15.0),
        margin: EdgeInsets.only(top: 15.0),
        child: ButtonTheme(
          colorScheme: Theme.of(context).colorScheme.copyWith(primary: Colors.blue),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(18.0),
          ),
          minWidth: 300.0,
          child: RaisedButton(
            child: Text("Log In",
                style: TextStyle(fontSize: 20, color: Colors.white)),
            onPressed: emailController.text == "" || passwordController.text == "" ? null : (){
              setState(() {
                // _login();
                _isLoading = true;
              });
              signIn(emailController.text, passwordController.text);
            },
          ),
        ),
    );

    // return Container(
    //   width: MediaQuery.of(context).size.width,
    //   height: 40.0,
    //   padding: EdgeInsets.symmetric(horizontal: 15.0),
    //   margin: EdgeInsets.only(top: 15.0),
    //   child: RaisedButton(
    //     onPressed: emailController.text == "" || passwordController.text == "" ? null : () {
    //       setState(() {
    //         _isLoading = true;
    //       });
    //       signIn(emailController.text, passwordController.text);
    //     },
    //     elevation: 0.0,
    //     color: Colors.purple,
    //     child: Text("Sign In", style: TextStyle(color: Colors.white70)),
    //     shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
    //   ),
    // );
  }

  final TextEditingController emailController = new TextEditingController();
  final TextEditingController passwordController = new TextEditingController();

  Container textSection() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 20.0),
      child: Column(
        children: <Widget>[

          TextFormField(
              controller: emailController,
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

          SizedBox(
            height: 10,
          ),

          TextFormField(
              controller: passwordController,
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

          SizedBox(
            height: 10,
          ),

          Container(
            // width: 300,
            child: Align(
              alignment: Alignment.centerRight,
              child: InkWell(
                child: Text("Forget Password",
                    style: TextStyle(fontSize: 18, color: Colors.blue, decoration: TextDecoration.underline)),
                onTap: (){
                  // _login();
                },
              ),
            ),
          ),

          // TextFormField(
          //   controller: emailController,
          //   cursorColor: Colors.white,
          //
          //   style: TextStyle(color: Colors.white70),
          //   decoration: InputDecoration(
          //     icon: Icon(Icons.email, color: Colors.white70),
          //     hintText: "Email",
          //     border: UnderlineInputBorder(borderSide: BorderSide(color: Colors.white70)),
          //     hintStyle: TextStyle(color: Colors.white70),
          //   ),
          // ),
          // SizedBox(height: 30.0),
          // TextFormField(
          //   controller: passwordController,
          //   cursorColor: Colors.white,
          //   obscureText: true,
          //   style: TextStyle(color: Colors.white70),
          //   decoration: InputDecoration(
          //     icon: Icon(Icons.lock, color: Colors.white70),
          //     hintText: "Password",
          //     border: UnderlineInputBorder(borderSide: BorderSide(color: Colors.white70)),
          //     hintStyle: TextStyle(color: Colors.white70),
          //   ),
          // ),
        ],
      ),
    );
  }

  Container headerSection() {
    return Container(
      margin: EdgeInsets.only(top: 20.0),
      // padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 30.0),
      child: Image.asset('image/logosiup.png', width: 150, height: 150,),
      // Text("Code Land",
      //     style: TextStyle(
      //         color: Colors.white70,
      //         fontSize: 40.0,
      //         fontWeight: FontWeight.bold)),
    );
    Container(
      child: Image.asset('image/logosiup.png', width: 200, height: 200,),
      margin: const EdgeInsets.only(top: 10.0),
    );
  }
}