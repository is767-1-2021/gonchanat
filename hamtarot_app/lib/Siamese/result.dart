import 'dart:ui';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:hamtarot_app/HomePage.dart';
import 'package:hamtarot_app/Siamese/model.dart';
import 'dart:math';
import 'package:provider/provider.dart';

class ResultPage extends StatefulWidget {
  @override
  _ResultPageState createState() => _ResultPageState();
}

class _ResultPageState extends State<ResultPage> {
  final number = Random().nextInt(4) + 1;
  bool heart = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text('ผลคำทำนาย'),
          automaticallyImplyLeading: false,
          actions: [
            IconButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => MyHomePage(),
                    ),
                  );
                },
                icon: Icon(Icons.home)),
          ]),
      body: SingleChildScrollView(
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Container(
                padding: EdgeInsets.only(top: 15),
                child: Consumer<Namemodel>(
                  builder: (context, form, child) {
                    return Container(
                      padding: EdgeInsets.only(bottom: 10),
                      child: Text('คุณ ${form.Name} ได้เซียมซีเลขที่ $number',
                          style: TextStyle(fontSize: 20, color: Colors.black)),
                    );
                  },
                ),
              ),
            ),
            number == 1
                ? Container(
                    padding: EdgeInsets.only(top: 20, right: 20, left: 20),
                    width: 300,
                    height: 350,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage('assets/H1.png'),
                            fit: BoxFit.fill)),
                    child: Column(
                      children: [
                        Container(
                          padding: EdgeInsets.only(bottom: 15),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.brightness_4_sharp),
                              Text(
                                'เซียมซีวัดแฮมทาโร่',
                                style: TextStyle(
                                    fontSize: 22, color: Colors.black),
                              ),
                              Icon(Icons.brightness_4_sharp)
                            ],
                          ),
                        ),
                        Text(
                          '   เลขที่ $number ดีนักประจักจิต ในลิขิตบอก  แจ้งแห่งนุสนธิ์ จงสมหวังดังที่มีกังวล หาลาภผลก็ได้ดังใจหมาย ถ้าหญิงชายหาคู่ที่ชูชิด ต้องสมคิดมั่นคงอย่าสงสัย ถามหาลาภลาภก็มีดีกระไร ถามถึงไข้ก็เบาบรรเทาลง ถามถึงที่พึ่งก็หนึ่งแน่ ไม่ปรวนแปรเหลวเลือนให้เชือนหลง ถามถึงบุตรในครรภ์นั้นมั่นคง เป็นชายยงแน่แล้วไม่ แคล้ว เอย ฯ',
                          style: TextStyle(fontSize: 16),
                        ),
                      ],
                    ),
                  )
                : SizedBox(),
            number == 2
                ? Container(
                    padding: EdgeInsets.only(top: 20, right: 20, left: 20),
                    width: 300,
                    height: 350,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage('assets/S1.png'),
                            fit: BoxFit.fill)),
                    child: Column(
                      children: [
                        Container(
                          padding: EdgeInsets.only(bottom: 15),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.brightness_4_sharp),
                              Text(
                                'เซียมซีวัดแฮมทาโร่',
                                style: TextStyle(
                                    fontSize: 22, color: Colors.black),
                              ),
                              Icon(Icons.brightness_4_sharp)
                            ],
                          ),
                        ),
                        Text(
                          '   เลขที่ $number ปองหาถ้าลําบาก เหมือนนกจากรังบินขึ้นเวหา ต้องแดดเผาเศร้าอารมณ์ระทมอุรา หาเลี้ยงตนแต่พอปากลําบากกาย ต้องรอใจไว้ท่าช้า ๆ ก่อน จึงจะผ่อนให้เบาบรรเทาหาย ฤดูนี้มีแต่ไม่ใคร่สบาย ยิ่งขวนขวายยิ่งช้ำแสนรําคาญ เปรียบพฤกษาหน้าแล้งไม่มีฝน ทั้งดอกผลก็ไม่สดรสก็ไม่หวาน ถามความจริงใดไม่ได้การต่อนาน ๆ ปลายปีจึงดีเอย ฯ',
                          style: TextStyle(fontSize: 16),
                        ),
                      ],
                    ),
                  )
                : SizedBox(),
            number == 3
                ? Container(
                    padding: EdgeInsets.only(top: 20, right: 20, left: 20),
                    width: 300,
                    height: 350,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage('assets/S2.png'),
                            fit: BoxFit.fill)),
                    child: Column(
                      children: [
                        Container(
                          padding: EdgeInsets.only(bottom: 15),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.brightness_4_sharp),
                              Text(
                                'เซียมซีวัดแฮมทาโร่',
                                style: TextStyle(
                                    fontSize: 22, color: Colors.black),
                              ),
                              Icon(Icons.brightness_4_sharp)
                            ],
                          ),
                        ),
                        Text(
                          ' เลขที่ $number ตามตําราทายว่าเห็น ถ้าหวังเป็นลาภยศต้องขวนขวาย จึงจะสมอารมณ์มาตรไม่คลาดคลาย ลําบากกายสักหน่อยหนึ่งจึงจะดี เป็นแน่ใจในตําราไม่ช้านัก เช่นไม้ปักบนเนินไม่เดินหนี ถามถึงลาภที่หาถ้าจะมี ถามถึงคนที่ปองยังสองใจ ถามถึงคู่ชู้เช่นคําที่ว่า จะมีมามั่งคงไม่สงสัย แต่เดือนนี้ลําบากแสนยากใจ ต้องรอไปสักนิดสมคิดเอย ฯ',
                          style: TextStyle(fontSize: 16),
                        ),
                      ],
                    ),
                  )
                : SizedBox(),
            number == 4
                ? Container(
                    padding: EdgeInsets.only(top: 20, right: 20, left: 20),
                    width: 300,
                    height: 350,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage('assets/H2.png'),
                            fit: BoxFit.fill)),
                    child: Column(
                      children: [
                        Container(
                          padding: EdgeInsets.only(bottom: 15),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.brightness_4_sharp),
                              Text(
                                'เซียมซีวัดแฮมทาโร่',
                                style: TextStyle(
                                    fontSize: 22, color: Colors.black),
                              ),
                              Icon(Icons.brightness_4_sharp)
                            ],
                          ),
                        ),
                        Text(
                          ' เลขที่ $number เสร็จหวังดังประสงค์ที่จํานง จะได้ดังหมายมั่น อีกไม่ช้าม้าตัวทองของสําคัญ จะมาพลันพาเหาะไปเหมาะใจ คนที่หนีของที่หาย ก็ได้กลับคู่ที่รักห่างชิดพิสมัย จะกลับคืนชื่นชิดสนิทใน คิดสิ่งไรก็จะเสร็จสําเร็จการ ตามตําราท่านว่าได้เมื่อพระราเมศร์ ได้ดวงเนตรสีดามาสถาน ตั้งแต่นี้มีสุขทุกข์ไม่นาน ที่คิดการหามิตรสมคิดเอย ฯ',
                          style: TextStyle(fontSize: 16),
                        ),
                      ],
                    ),
                  )
                : SizedBox(),
            Container(
              padding: EdgeInsets.only(right: 35, left: 260),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  IconButton(
                      icon: heart
                          ? Icon(
                              Icons.favorite,
                              color: Colors.grey,
                            )
                          : Icon(
                              Icons.favorite,
                              color: Colors.pink[200],
                            ),
                      onPressed: () {
                        setState(() {
                          heart = !heart;
                        });
                      }),
                  Icon(Icons.save_alt_rounded)
                ],
              ),
            ),
            Container(
                child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                    //style: ElevatedButton.styleFrom(
                    //  onPrimary: Colors.black, primary: Colors.amber[200]),
                    onPressed: () async {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: Center(
                                child: Row(
                              children: [
                                Text(
                                  'คำเตือน',
                                  style: TextStyle(color: Colors.redAccent),
                                ),
                                Icon(Icons.error_outline_rounded,
                                    color: Colors.pink, size: 20),
                              ],
                            )),
                            content: Text('ไม่ควรเขย่าเกินอาทิตย์ละ 1 ครั้ง'),
                          );
                        },
                      );
                      await Future.delayed(const Duration(milliseconds: 3000),
                          () {
                        setState(() {});
                      });

                      await Navigator.pushNamed(context, '/6');
                    },
                    child: Text(
                      'เขย่าอีกครั้ง',
                      style: TextStyle(fontWeight: FontWeight.w600),
                    )),
                ElevatedButton(
                    // style: ElevatedButton.styleFrom(
                    //    onPrimary: Colors.black, primary: Colors.amber[200]),
                    onPressed: () {
                      Navigator.pushNamed(context, ('/9'));
                    },
                    child: Text(
                      'ไหว้พระเสริมบุญ',
                      style: TextStyle(fontWeight: FontWeight.w600),
                    ))
              ],
            )),
          ],
        ),
      ),
      bottomNavigationBar: SingleChildScrollView(
        child: CurvedNavigationBar(
          color: Color(0xFF6d4c41),
          backgroundColor: Color(0xFFFFF8E1),
          buttonBackgroundColor: Color(0xFF6d4c41),
          height: 50,
          items: <Widget>[
            IconButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/3');
                },
                icon: Icon(Icons.crop_portrait, size: 30, color: Colors.black)),
            IconButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/4');
                },
                icon: Icon(Icons.amp_stories_rounded,
                    size: 30, color: Colors.black)),
            IconButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/5');
                },
                icon: Icon(Icons.quiz, size: 30, color: Colors.black)),
            IconButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/6');
                },
                icon:
                    Icon(Icons.battery_unknown, size: 30, color: Colors.black)),
            IconButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/2');
                },
                icon: Icon(Icons.date_range_rounded,
                    size: 30, color: Colors.black)),
            IconButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/9');
                },
                icon: Icon(Icons.account_balance_rounded,
                    size: 30, color: Colors.black)),
          ],
          // animationDuration: Duration(milliseconds: 200),
          index: 3,
        ),
      ),
    );
  }
}
