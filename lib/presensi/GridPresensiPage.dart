import 'package:flutter/material.dart';
import 'package:siup/home/HomePage.dart';
import 'package:format_indonesia/format_indonesia.dart';
import 'package:grouped_list/grouped_list.dart';
import 'package:flutter_sticky_header/flutter_sticky_header.dart';

String username = '';

class GridPresensiPage extends StatefulWidget {

  final String username;
  GridPresensiPage({this.username});
  @override
  _gridPresensiPage createState() => _gridPresensiPage(username);
}

class _gridPresensiPage extends State<GridPresensiPage> with TickerProviderStateMixin {
  final String username;

  _gridPresensiPage(this.username);

  final List<String> entries = <String>[
    'Masa Perkuliahan Semester Ganjil',
    'Masa Perkuliahan Semester Genap',
    'Masa Perwalian Semester Ganjil',
    'Masa Perwalian Semester Genap',
    'Masa Pembayaran Semester Ganjil',
    'Masa Pembayaran Semester Genap',
    'Masa Perwalian Semester Ganjil',
    'Masa Perwalian Semester Genap',
  ];

  final List<String> date = <String>[
    Waktu(DateTime.parse('2020-05-07')).format("EEEE, d MMM yyyy"),
    Waktu(DateTime.parse('2020-05-17')).format("EEEE, d MMM yyyy"),
    Waktu(DateTime.parse('2020-05-27')).format("EEEE, d MMM yyyy"),
    Waktu(DateTime.parse('2020-06-07')).format("EEEE, d MMM yyyy"),
    Waktu(DateTime.parse('2020-06-17')).format("EEEE, d MMM yyyy"),
    Waktu(DateTime.parse('2020-05-05')).format("EEEE, d MMM yyyy"),
    Waktu(DateTime.parse('2020-05-15')).format("EEEE, d MMM yyyy"),
    Waktu(DateTime.parse('2020-05-27')).format("EEEE, d MMM yyyy"),

  ];
  List _data = [
    {
      'id':1,
      'title':'test1',
      'author':'Faris 1',
      'date':Waktu(DateTime.parse('2020-12-07')).format("MMMM y"),
      'group':'Android',
      'deskripsi': 'Masa Perkuliahan Semester Ganjil',
      'image':'https://picsum.photos/200/300?random=1'
    },
    {
      'id':2,
      'title':'test2',
      'author':'Faris 2',
      'date':Waktu(DateTime.parse('2020-11-07')).format("MMMM y"),
      'group':'IOS',
      'deskripsi': 'Masa Perkuliahan Semester Genap',
      'image':'https://picsum.photos/200/300?random=2'
    },
    {
      'id':3,
      'title':'test3',
      'author':'Faris 3',
      'date':Waktu(DateTime.parse('2020-12-10')).format("MMMM y"),
      'group':'Android',
      'deskripsi': 'Masa Perwalian Semester Ganjil',
      'image':'https://picsum.photos/200/300?random=3'
    },
    {
      'id':4,
      'title':'test4',
      'author':'Faris 4',
      'date':Waktu(DateTime.parse('2020-11-10')).format("MMMM y"),
      'group':'IOS',
      'deskripsi': 'Masa Perwalian Semester Genap',
      'image':'https://picsum.photos/200/300?random=4'
    },
    {
      'id':5,
      'title':'test5',
      'author':'Faris 5',
      'date':Waktu(DateTime.parse('2020-12-17')).format("MMMM y"),
      'group':'android',
      'deskripsi': 'Masa Pengisian KRS Semester Ganjil',
      'image':'https://picsum.photos/200/300?random=5'
    },
    {
      'id':6,
      'title':'test6',
      'author':'Faris 6',
      'date':Waktu(DateTime.parse('2020-11-17')).format("MMMM y"),
      'group':'IOS',
      'deskripsi': 'Masa Pengisian KRS Semester Genap',
      'image':'https://picsum.photos/200/300?random=5'
    },
  ];

  @override
  Widget build(BuildContext context) {

      return Flexible(
        child: GroupedListView(
          elements: _data,
          groupBy: (item) => item['date'],
          groupSeparatorBuilder: (groupValue) => Padding(
            padding: EdgeInsets.only(bottom: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Flexible(
                  child: Row(
                    children: [
                      Expanded(
                        flex: 10,
                        child: Container(
                          // margin: EdgeInsets.only(right: 8),
                          color: Colors.blue,
                          child: Padding(
                            padding: const EdgeInsets.only(top: 8, bottom: 8, left: 10),
                            child: Text(groupValue,textAlign: TextAlign.start,
                              style: TextStyle(fontSize: 18, color: Colors.white,fontWeight: FontWeight.bold),),
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
                padding: EdgeInsets.all(8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      flex: 8,
                      child: Container(
                        padding: EdgeInsets.only(bottom:8),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(left:8, right: 8),
                              child: Text(item['deskripsi'],
                                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
          groupComparator: (group1, group2) => group1.compareTo(group2),
          itemComparator: (item1, item2) => item1['title'].compareTo(item2['title']),
          useStickyGroupSeparators: true,
          floatingHeader: false,
          order: GroupedListOrder.ASC,
        ),
      );
  }
}