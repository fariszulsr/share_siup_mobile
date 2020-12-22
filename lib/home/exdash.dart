import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class exDash extends StatelessWidget {
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
    var list = ['Jadwal', 'Presensi', 'Pembayaran', 'Data Mahasiswa', 'Transkrip', 'Pelanggaran'];
    var color = Colors.lime;
    var myGridView = new GridView.builder(
        itemCount: myList.length,
        gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        padding: EdgeInsets.only(left: 16, right: 16),
        itemBuilder: (context, index){
          return new GestureDetector(
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.lime, borderRadius: BorderRadius.circular(10)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  // Image.asset(
                  //   data.img,
                  //   width: 42,
                  // ),
                  SizedBox(
                    height: 14,
                  ),
                  Text(
                    list[index],
                    style: GoogleFonts.openSans(
                        textStyle: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w600)),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                ],
              ),
            ),
            onTap: (){
              Navigator.pushReplacementNamed(context, '/AdminPage');
            },
          );
        },
    );

    return new Flexible(
      child: myGridView,
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
