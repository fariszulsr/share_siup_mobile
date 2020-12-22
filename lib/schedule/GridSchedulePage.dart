import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:siup/dashboard/dashboard.dart';
import 'package:data_tables/data_tables.dart';
import 'package:horizontal_data_table/horizontal_data_table.dart';
// import 'package:dropdownfield/dropdownfield.dart';

String username = '';

class GridSchedulePage extends StatefulWidget {

  final String username;
  GridSchedulePage({this.username});
  @override
  _gridSchedulePage createState() => _gridSchedulePage(username);
}

class _gridSchedulePage extends State<GridSchedulePage> with TickerProviderStateMixin {
  final String username;

  _gridSchedulePage(this.username);

  // _gridHomePage({Key key, @required this.username}) : super(key: key);

  var dataTabel1 = new Container(
    color: Colors.white,
    // padding: EdgeInsets.fromLTRB(5.0, 0.0, 5.0, 0.0),
      child: Table(
        // border: TableBorder.symmetric(inside: BorderSide(width: 1, color: Colors.grey),),
        border: TableBorder(
            horizontalInside: BorderSide(width: 1, color: Colors.grey, style: BorderStyle.solid),
            left: BorderSide(color: Colors.blue, width: 1 ),
            right: BorderSide(color: Colors.blue, width: 1),
            bottom: BorderSide(color: Colors.blue, width: 1)),
        columnWidths: {
          0: FixedColumnWidth(100),
          1: FixedColumnWidth(100),
          2: FixedColumnWidth(100)
        },
        // headingRowColor: MaterialStateColor.resolveWith((states) => Colors.grey),
        children: [
          TableRow(
            decoration: BoxDecoration(
              color: Colors.grey, // To alternate between dark and light shades of the row's background color.
            ),
            children: [
              Text('NAMA EVENT', textAlign: TextAlign.center, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
              Text('TANGGAL AWAL', textAlign: TextAlign.center, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
              Text('TANGGAL AKHIR', textAlign: TextAlign.center, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15))
            ],
          ),
          TableRow(
            children: [
              Padding(padding: EdgeInsets.only(left: 5.0),
                child:  Text('Masa Pembayaran SPP Semester Ganjil'),
              ),
              Text('01 July 2019', textAlign: TextAlign.center),
              Text('02 August 2019', textAlign: TextAlign.center)
            ],
          ),
          TableRow(
            children: [
              Padding(padding: EdgeInsets.only(left: 5.0),
                child: Text('Pendaftaran Ulang Mahasiswa'),
              ),
              Text('05 August 2019', textAlign: TextAlign.center),
              Text('09 August 2019', textAlign: TextAlign.center)
            ],
          ),
          TableRow(
            children: [
              Padding(padding: EdgeInsets.only(left: 5.0),
                child: Text('Perwalian I Semester Ganjil'),
              ),
              Text('13 August 2019', textAlign: TextAlign.center),
              Text('14 August 2019', textAlign: TextAlign.center)
            ],
          ),
          TableRow(
            children: [
              Padding(padding: EdgeInsets.only(left: 5.0),
                child: Text('Cetak Kartu Studi Mahasiswa Semester Ganjil'),
              ),
              Text('13 August 2019', textAlign: TextAlign.center),
              Text('14 August 2019', textAlign: TextAlign.center)
            ],
          ),
          TableRow(
            children: [
              Padding(padding: EdgeInsets.only(left: 5.0),
                child: Text('Pengisian Nilai'),
              ),
              Text('19 August 2019', textAlign: TextAlign.center),
              Text('27 December 2019', textAlign: TextAlign.center)
            ],
          ),
          TableRow(
            children: [
              Padding(padding: EdgeInsets.only(left: 5.0),
                child: Text('Perkuliahan Semester Ganjil'),
              ),
              Text('19 August 2019', textAlign: TextAlign.center),
              Text('29 November 2019', textAlign: TextAlign.center)
            ],
          ),
          TableRow(
            children: [
              Padding(padding: EdgeInsets.only(left: 5.0),
                child: Text('Pengisian Survei'),
              ),
              Text('27 September 2019', textAlign: TextAlign.center),
              Text('06 October 2019', textAlign: TextAlign.center)
            ],
          ),
          TableRow(
            children: [
              Padding(padding: EdgeInsets.only(left: 5.0),
                child: Text('Perwalian II Semester Ganjil'),
              ),
              Text('30 September 2019', textAlign: TextAlign.center),
              Text('04 October 2019', textAlign: TextAlign.center)
            ],
          ),
          TableRow(
            children: [
              Padding(padding: EdgeInsets.only(left: 5.0),
                child: Text('Ujian Tengah Semester Ganjil'),
              ),
              Text('07 October 2019', textAlign: TextAlign.center),
              Text('12 October 2019', textAlign: TextAlign.center)
            ],
          ),
          TableRow(
            children: [
              Padding(padding: EdgeInsets.only(left: 5.0),
                child: Text('Pengumuman Nilai UTS Semester Ganjil'),
              ),
              Text('25 October 2019', textAlign: TextAlign.center),
              Text('25 October 2019', textAlign: TextAlign.center)
            ],
          ),
          TableRow(
            children: [
              Padding(padding: EdgeInsets.only(left: 5.0),
                child: Text('Perwalian Tambahan Semester Ganjil'),
              ),
              Text('25 November 2019', textAlign: TextAlign.center),
              Text('29 November 2019', textAlign: TextAlign.center)
            ],
          ),
          TableRow(
            children: [
              Padding(padding: EdgeInsets.only(left: 5.0),
                child: Text('Ujian Akhir Semester Ganjil'),
              ),
              Text('07 December 2019', textAlign: TextAlign.center),
              Text('14 December 2019', textAlign: TextAlign.center)
            ],
          ),
          TableRow(
            children: [
              Padding(padding: EdgeInsets.only(left: 5.0),
                child: Text('Pengumuman Nilai UAS Semester Ganjil'),
              ),
              Text('23 December 2019', textAlign: TextAlign.center),
              Text('23 December 2019', textAlign: TextAlign.center)
            ],
          ),
          TableRow(
            children: [
              Padding(padding: EdgeInsets.only(left: 5.0),
                child: Text('Pengisian Nilai Reevaluasi'),
              ),
              Text('02 January 2020', textAlign: TextAlign.center),
              Text('10 January 2020', textAlign: TextAlign.center)
            ],
          ),
        ],
      ),
    );

  var dataTabel2 = new Container(
    color: Colors.white,
    padding: EdgeInsets.all(20.0),
    child: Table(
      border: TableBorder.all(color: Colors.black),
      children: [
        TableRow(children: [
          Text('dataTabel2 1'),
          Text('dataTabel2 2'),
          Text('dataTabel2 3'),
        ]),
        TableRow(children: [
          Text('dataTabel2 4'),
          Text('dataTabel2 5'),
          Text('dataTabel2 6'),
        ])
      ],
    ),
  );

  var dataTabel3 = new Container(
    color: Colors.white,
    padding: EdgeInsets.all(20.0),
    child: Table(
      border: TableBorder.all(color: Colors.black),
      children: [
        TableRow(children: [
          Text('dataTabel3 1'),
          Text('dataTabel3 2'),
          Text('dataTabel3 3'),
        ]),
        TableRow(children: [
          Text('dataTabel3 4'),
          Text('dataTabel3 5'),
          Text('dataTabel3 6'),
        ])
      ],
    ),
  );

  @override
  Widget build(BuildContext context) {
    var color = Colors.lime;

    return Flexible(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primaryColor: Colors.blueAccent,
        ),
        home: DefaultTabController(
          length: 3,
          child:
          Scaffold(
            appBar:
            PreferredSize(
              preferredSize: Size.fromHeight(60.0),
              child: AppBar(
                centerTitle: true,
                title: Text('PERIODE 2019-1', style: TextStyle(fontSize: 15),),
                bottom: TabBar(
                  indicatorColor: Colors.grey,
                  labelColor: Colors.white,
                  unselectedLabelColor: Colors.black,
                  tabs: <Widget>[
                    Tab(text: 'Kalender Akademik',),
                    Tab(text: 'Jadwal Kuliah',),
                    Tab(text: 'Jadwal Ujian'),
                  ],
                ),
              ),
            ),

            body: TabBarView(
              children: [
                dataTabel1,
                dataTabel2,
                dataTabel3
              ],
            ),
            // bottomNavigationBar: BottomNavigationBar(
            //   currentIndex: _currentIndex,
            //   items: _navigationIconViews.map((x) => x.item).toList(),
            //   onTap: (int index) {
            //     setState(() {
            //       _currentIndex = index;
            //     });
            //   },
            // ),
          ),
        ),
      ),
    );
    // );
  }
}
