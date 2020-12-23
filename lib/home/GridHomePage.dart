import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:siup/dashboard/dashboard.dart';

String username = '';

class GridHomePage extends StatefulWidget {

  final String username;
  GridHomePage({this.username});
  @override
  _gridHomePage createState() => _gridHomePage(username);
}

class _gridHomePage extends State {
  final String username;
  _gridHomePage(this.username);
  // _gridHomePage({Key key, @required this.username}) : super(key: key);
  Items item1 = new Items(
      id: 1,
      title: "Jadwal",
      img: "image/home/jadwal.png",
    // subtitle: "March, Wednesday",
    // event: "3 Events",
  );

  Items item2 = new Items(
    id: 2,
    title: "Presensi",
    img: "image/home/absensi.png",
    // subtitle: "Bocali, Apple",
    // event: "4 Items",
  );
  Items item3 = new Items(
    id: 3,
    title: "Pembayaran",
    img: "image/home/card.png",
    // subtitle: "Lucy Mao going to Office",
    // event: "",
  );
  Items item4 = new Items(
    id: 4,
    title: "Data Mahasiswa",
    img: "image/home/data_mahasiswa.png",
    // subtitle: "Rose favirited your Post",
    // event: "",
  );
  Items item5 = new Items(
    id: 5,
    title: "Transkrip",
    img: "image/home/transkrip.png",
    // subtitle: "Homework, Design",
    // event: "4 Items",
  );
  Items item6 = new Items(
    id: 6,
    title: "Pelanggaran",
    img: "image/home/violation.png",
    // subtitle: "",
    // event: "2 Items",
  );

  @override
  Widget build(BuildContext context) {
    List<Items> myList = [item1, item2, item3, item4, item5, item6];
    var color = Colors.lime;

    return Flexible(
      // backgroundColor: Colors.white,
      // body:
      // Column(
      //   children: <Widget>[
      //     new Expanded(
            child: GridView.count(
              childAspectRatio: 1.0,
              padding: EdgeInsets.only(left: 16, right: 16),
              crossAxisCount: 2,
              crossAxisSpacing: 18,
              mainAxisSpacing: 18,
              children: myList.map((data) {
                return InkWell(
                  onTap: () {
                  // Navigator.push(context,MaterialPageRoute(builder: (context)=> '/Login'));
                    if (data.id == 1){
                      Navigator.pushReplacementNamed(context, '/SchedulePage');
                    }
                    else if (data.id == 2){
                      Navigator.pushReplacementNamed(context, '/Notifications');
                    }
                    print("tap");
                  },
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.lime, borderRadius: BorderRadius.circular(10)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Image.asset(
                      data.img,
                      width: 85,
                    ),
                    SizedBox(
                      height: 14,
                    ),
                    Text(
                      data.title,
                      style: GoogleFonts.baloo(
                        textStyle: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.w400,
                            letterSpacing: 1.0,
                        )),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                  ],
                ),
              ),
            );
          }).toList()),
          );
    //     ],
    //   ),
    // );
  }
}

class Items {
  int id;
  String title;
  // String subtitle;
  String event;
  String img;
  Items({this.title, this.id, /*this.event,*/ this.img});
}
