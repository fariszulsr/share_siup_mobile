import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:siup/home/HomePage.dart';
import 'package:format_indonesia/format_indonesia.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grouped_list/grouped_list.dart';
import 'package:flutter_sticky_header/flutter_sticky_header.dart';
import 'package:siup/presensi/DetailPresensiPage.dart';

String username = '';
String title='';

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
      'title':'Mata Kuliah',
      'date':Waktu(DateTime.parse('2020-12-07')).format("MMMM y"),
      'deskripsi': 'Berpikir Kritis',
      'presentasi': '90',
    },
    {
      'id':2,
      'title':'Mata Kuliah',
      'date':Waktu(DateTime.parse('2020-11-07')).format("MMMM y"),
      'deskripsi': 'Kalkulus I',
      'presentasi': '76',
    },
    {
      'id':3,
      'title':'Mata Kuliah',
      'date':Waktu(DateTime.parse('2020-12-10')).format("MMMM y"),
      'deskripsi': 'Fisika Dasar I',
      'presentasi': '90',
    },
    {
      'id':4,
      'title':'Mata Kuliah',
      'date':Waktu(DateTime.parse('2020-11-10')).format("MMMM y"),
      'deskripsi': 'Tata Tulis Karya Ilmiah',
      'presentasi': '90',
    },
    {
      'id':5,
      'title':'Mata Kuliah',
      'date':Waktu(DateTime.parse('2020-12-17')).format("MMMM y"),
      'deskripsi': 'Kimia Dasar I',
      'presentasi': '90',
    },
    {
      'id':6,
      'title':'Mata Kuliah',
      'date':Waktu(DateTime.parse('2020-11-17')).format("MMMM y"),
      'deskripsi': 'Bahasa Inggris I',
      'presentasi': '90',
    },
    {
      'id':7,
      'title':'Mata Kuliah',
      'date':Waktu(DateTime.parse('2020-11-17')).format("MMMM y"),
      'deskripsi': 'Pengantar Tekonolgi dan Bisnis Energi',
      'presentasi': '90',
    },
  ];
  var your_number_of_rows = 7;

  get deskripsi => null;

  @override
  Widget build(BuildContext context) {

      return Flexible(
        flex: 1,
        child:
      //   ListView(children: <Widget>[
      //     Column(
      //       children: [
      //         Container(
      //           padding: EdgeInsets.only(top: 10, bottom: 10, left: 20),
      //           alignment: Alignment.centerLeft,
      //           child: Text('Semester Ganjil 2020/2021', style: GoogleFonts.lato(textStyle: TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),),),
      //         ),
      //         DataTable(
      //           headingRowColor: MaterialStateColor.resolveWith((states) => Colors.blue),
      //           // dataRowHeight: (MediaQuery.of(context).size.height - 200) / your_number_of_rows,
      //           columns: [
      //             DataColumn(
      //                 label: Text('Mata Kuliah', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white))),
      //             DataColumn(
      //                 label: Text('Kehadiran (%)', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white))),
      //           ],
      //           rows: [
      //             DataRow(cells: [
      //               DataCell(Text('Berpikir Kritis', style: TextStyle(fontSize: 18))),
      //               DataCell(Text('90', style: TextStyle(fontSize: 18))),
      //             ]),
      //             DataRow(cells: [
      //               DataCell(Text('Kalkulus I', style: TextStyle(fontSize: 18))),
      //               DataCell(Text('76', style: TextStyle(fontSize: 18))),
      //             ]),
      //             DataRow(cells: [
      //               DataCell(Text('Fisika Dasar I', style: TextStyle(fontSize: 18))),
      //               DataCell(Text('90', style: TextStyle(fontSize: 18))),
      //             ]),
      //             DataRow(cells: [
      //               DataCell(Text('Tata Tulis Karya Ilmiah', style: TextStyle(fontSize: 18))),
      //               DataCell(Text('90', style: TextStyle(fontSize: 18))),
      //             ]),
      //             DataRow(cells: [
      //               DataCell(Text('Kimia Dasar I', style: TextStyle(fontSize: 18))),
      //               DataCell(Text('90', style: TextStyle(fontSize: 18))),
      //             ]),
      //             DataRow(cells: [
      //               DataCell(Text('Bahasa Inggris I', style: TextStyle(fontSize: 18))),
      //               DataCell(Text('90', style: TextStyle(fontSize: 18))),
      //             ]),
      //             DataRow(cells: [
      //               DataCell(Text('Pengantar Teknologi dan Bisnis Energi', style: TextStyle(fontSize: 18))),
      //               DataCell(Text('60', style: TextStyle(fontSize: 18))),
      //             ]),
      //           ],
      //         ),
      //       ],
      //     ),
      //   ],
      // ),

        Column(
            children: [
              Container(
                padding: EdgeInsets.only(top: 10, bottom: 10, left: 20),
                alignment: Alignment.centerLeft,
                child: Text('Semester Ganjil 2020/2021', style: GoogleFonts.lato(textStyle: TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),),),
              ),
              Container(
                padding: EdgeInsets.only(bottom: 10, left: 10),
                // alignment: Alignment.centerLeft,
                color: Colors.blue,
                child: Row(
                  children: [
                    Expanded(child: Text('Mata Kuliah', style:  TextStyle(height: 3.0, fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white))),
                    Expanded(child: Text('Kehadiran (%)', style:  TextStyle(height: 3.0, fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white))),
                  ],
                ),
              ),

              Expanded(
                child:Container(
                  child: ListView.builder(
                    itemCount: _data == null ? 0 : _data.length,
                    itemBuilder: (BuildContext context, int index) {
                      return InkWell(
                        onTap: () {
                          if(_data[index]['id']!=null){
                            // Navigator.pushReplacementNamed(context, '/DetailPresensiPage');
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                              builder: (BuildContext context) => DetailPresensiPage(deskripsi: _data[index]['deskripsi'])),
                            );
                            print(_data[index]['deskripsi']);
                          }
                          // else if(_data[index]['id']==2){
                          //   // Navigator.pushReplacementNamed(context, '/DetailPresensiPage');
                          //   Navigator.push(
                          //     context,
                          //     MaterialPageRoute(
                          //         builder: (BuildContext context) => DetailPresensiPage(deskripsi: _data[index]['deskripsi'])),
                          //   );
                          //   print(_data[index]['deskripsi']);
                          // }

                        },
                        child: ListTile( //return new ListTile(
                          title: Row(
                            children: <Widget>[
                              Expanded(child: Text(_data[index]["deskripsi"], style: TextStyle(fontSize: 18),)),
                              Expanded(child: Padding(padding: EdgeInsets.only(left: 10), child: Text(_data[index]["presentasi"], style: TextStyle(fontSize: 18)),)),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
      );
  }
}