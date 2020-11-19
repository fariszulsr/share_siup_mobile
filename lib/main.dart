import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Login',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.blue, primaryColor: Colors.black),
      home: Login(),
    );
  }
}

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.all(8),
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              child: Image.asset('image/logosiup.png'),
              margin: const EdgeInsets.only(top: 20.0),
              //   width: 100,
              //   height: 100,
              //   decoration:
              //       BoxDecoration(color: Colors.black87, shape: BoxShape.circle),
              //   child: Center(
              //     child: Icon(
              //       Icons.person,
              //       size: 50,
              //       color: Colors.white,
              //     ),
              //   ),
            ),
            SizedBox(
              height: 5,
            ),
            // Text(
            //   "Selamat Datang, Silahkan Masuk",
            //   style: TextStyle(fontSize: 20, color: Colors.black87),
            // ),
            TextFormField(
              decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black87)),
                  prefixIcon: Icon(
                    Icons.person,
                    size: 40,
                  ),
                  hintText: "Username",
                  hintStyle: TextStyle(color: Colors.black87),
                  labelText: "Username",
                  labelStyle: TextStyle(color: Colors.black87)),
            ),
            SizedBox(
              height: 20,
            ),
            TextFormField(
              obscureText: true,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black87)),
                prefixIcon: Icon(
                  Icons.lock,
                  size: 40,
                ),
                hintText: "Password",
                hintStyle: TextStyle(color: Colors.black87),
                labelText: "Password",
                labelStyle: TextStyle(color: Colors.black87),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Card(
              color: Colors.lightBlue,
              elevation: 5,
              child: Container(
                height: 50,
                child: InkWell(
                  splashColor: Colors.white,
                  onTap: () {},
                  child: Center(
                    child: Text("Login",
                        style: TextStyle(fontSize: 20, color: Colors.white)),
                  ),
                ),
              ),
            ),

            SizedBox(
              height: 50,
            ),

            Card(
              color: Colors.grey[200],
              elevation: 5,
              child: Container(
                height: 20,
                child: InkWell(
                  splashColor: Colors.lightBlue,
                  onTap: () {},
                  child: Center(
                    child: Text("FORGOT USERNAME/PASSWORD?",
                        style: TextStyle(fontSize: 15, color: Colors.black)),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}