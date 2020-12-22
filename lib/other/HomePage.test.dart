import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:siup/dashboard/dashboard.dart';

String username = '';

class HomePageTest extends StatefulWidget {

  final String username;
  HomePageTest({this.username});
  @override
  _HomePage createState() => _HomePage(username);
}

class _HomePage extends State {
  final String username;
  _HomePage(this.username);
  Items item1 = new Items(
    title: "Jadwal",
    img: "image/home/jadwal.png",
    // subtitle: "March, Wednesday",
    // event: "3 Events",
  );

  Items item2 = new Items(
    title: "Presensi",
    img: "image/home/absensi.png",
    // subtitle: "Bocali, Apple",
    // event: "4 Items",
  );
  Items item3 = new Items(
    title: "Pembayaran",
    img: "image/home/card.png",
    // subtitle: "Lucy Mao going to Office",
    // event: "",
  );
  Items item4 = new Items(
    title: "Data Mahasiswa",
    img: "image/home/data_mahasiswa.png",
    // subtitle: "Rose favirited your Post",
    // event: "",
  );
  Items item5 = new Items(
    title: "Transkrip",
    img: "image/home/transkrip.png",
    // subtitle: "Homework, Design",
    // event: "4 Items",
  );
  Items item6 = new Items(
    title: "Pelanggaran",
    img: "image/home/violation.png",
    // subtitle: "",
    // event: "2 Items",
  );

  @override
  Widget build(BuildContext context) {
    List<Items> myList = [item1, item2, item3, item4, item5, item6];
    var color = Colors.lime;
    return Container(
      color: Colors.white,
      child: GridView.count(
          childAspectRatio: 1.0,
          padding: EdgeInsets.only(left: 16, right: 16),
          crossAxisCount: 2,
          crossAxisSpacing: 18,
          mainAxisSpacing: 18,
          children: myList.map((data) {
            return Container(
              decoration: BoxDecoration(
                  color: Colors.lime, borderRadius: BorderRadius.circular(10)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Image.asset(
                    data.img,
                    width: 42,
                  ),
                  SizedBox(
                    height: 14,
                  ),
                  Text(
                    data.title,
                    style: GoogleFonts.openSans(
                        textStyle: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w600)),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  // Text(
                  //   data.subtitle,
                  //   style: GoogleFonts.openSans(
                  //       textStyle: TextStyle(
                  //           color: Colors.white38,
                  //           fontSize: 10,
                  //           fontWeight: FontWeight.w600)),
                  // ),
                  // SizedBox(
                  //   height: 14,
                  // ),
                  // Text(
                  //   data.event,
                  //   style: GoogleFonts.openSans(
                  //       textStyle: TextStyle(
                  //           color: Colors.white70,
                  //           fontSize: 11,
                  //           fontWeight: FontWeight.w600)),
                  // ),
                ],
              ),
            );
          }).toList()),
    );
  }
}

class Items {
  String title;
  // String subtitle;
  String event;
  String img;
  Items({this.title, /*this.subtitle, this.event,*/ this.img});
}
