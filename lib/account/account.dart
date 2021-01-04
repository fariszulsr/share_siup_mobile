import 'package:flutter/material.dart';
import 'package:siup/home/HomePage.dart';
import 'package:grouped_list/grouped_list.dart';
import 'package:format_indonesia/format_indonesia.dart';
// import 'package:intl/intl.dart';

String username = '';

class Account extends StatefulWidget {

  final String username;
  Account({this.username});
  @override
  _account createState() => _account(username);
}

class _account extends State<Account> with TickerProviderStateMixin {
  final String username;
  _account(this.username);
  final List<String> entries = <String>['A', 'B', 'C'];
  final List<int> colorCodes = <int>[600, 500, 100];
  List _data = [
    {
      'id':1,
      'type':'ACCOUNT',
      'deskripsi': 'Profile',
    },
    {
      'id':2,
      'type':'ACCOUNT',
      'deskripsi': 'Ganti Password',
    },
    // {
    //   'id':3,
    //   'type':'ACCOUNT',
    //   'deskripsi': 'Privacy and Security',
    // },
    {
      'id':4,
      'type':'ACCOUNT',
      'deskripsi': 'Log Out',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return new WillPopScope(
      onWillPop: () {
        Navigator.pushReplacement(context,
            new MaterialPageRoute(
                builder: (context) => homePage(username: username,))
        );
      },
      child: Scaffold(
        appBar: AppBar(
          centerTitle: false,
          title: Text("Options", style: TextStyle(color: Colors.blue),),
          backgroundColor: Colors.white,
          leading: GestureDetector(
            onTap: () {
              Navigator.pushReplacementNamed(context, '/HomePage');
            },
            child: Icon(Icons.close, color: Colors.blue,),
          ),
        ),
        body:
        GroupedListView(
          elements: _data,
          groupBy: (item) => item['type'],
          groupSeparatorBuilder: (groupValue) => Padding(
            padding: EdgeInsets.only(bottom: 8, top: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Flexible(
                  child: Row(
                    children: [
                      Expanded(
                        flex: 10,
                        child: Container(
                          // margin: EdgeInsets.only(right: 8),
                          color: Colors.white38,
                          child: Padding(
                            padding: const EdgeInsets.only(top: 8, bottom: 8, left: 15),
                            child: Text(groupValue,textAlign: TextAlign.start,
                              style: TextStyle(fontSize: 18, color: Colors.grey,fontWeight: FontWeight.bold),),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ) ,
            // Text('${groupValue}'),
          ),
          itemBuilder: (context,item){
            return Card(
              elevation: 1.0,
              // margin: EdgeInsets.symmetric(horizontal: 10, vertical: 6),
              child: Container(
                padding: EdgeInsets.all(10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      flex: 10,
                      child: Container(
                        padding: EdgeInsets.only(bottom:8),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(left:8, right: 8),
                              child: GestureDetector(
                                onTap: () {
                                  if(item['id']==4){
                                    Navigator.pushReplacementNamed(context, '/Login');
                                  }
                                },
                                child: Text(item['deskripsi'],
                                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.only(right: 5),
                        child: Container(
                          alignment: Alignment.centerRight,
                          margin: EdgeInsets.only(right: 5),
                          child: GestureDetector(
                            onTap: () {
                              if(item['id']==4){
                                Navigator.pushReplacementNamed(context, '/Login');
                              }
                            },
                            child: Icon(Icons.arrow_forward_ios, color: Colors.grey,),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
          groupComparator: (group1, group2) => group1.compareTo(group2),
          itemComparator: (item1, item2) => item1['id'].compareTo(item2['id']),
          useStickyGroupSeparators: true,
          floatingHeader: false,
          order: GroupedListOrder.ASC,
        ),
        ),
      );
  }
}