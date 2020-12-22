import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

String username='';

class Dashboard extends State {

  final String username;
  Dashboard({this.username});
  var _currencies = ['Profil', 'Log out'];
  var _currentItemSelected = ['Profil'];

  @override
  Widget build(BuildContext context) {

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

                        // DropdownButton<String>(
                        //   iconSize: 30,
                        //   items: _currencies.map((String dropDownStringItem){
                        //           return DropdownMenuItem<String>(
                        //             value: dropDownStringItem,
                        //             child: Text(dropDownStringItem),
                        //           );
                        //   }).toList(),
                        //   onChanged: (String newValueSelected){
                        //       setState(() {
                        //         this._currentItemSelected = newValueSelected as List<String>;
                        //       });
                        //   }),

                      ],
                    ),

                    RaisedButton(
                      child: Text("Log OUt"),
                      onPressed: (){
                        Navigator.pushReplacementNamed(context,'/Login');
                      },
                    ),

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
        ],
      ),
    );
  }
}
