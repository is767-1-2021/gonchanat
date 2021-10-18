import 'dart:math';

import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:hamtarot_app/HomePage.dart';
import 'package:hamtarot_app/Question/question_form_model.dart';
import 'package:hamtarot_app/Question/question_page.dart';

import 'package:provider/provider.dart';

class AnswerPage extends StatefulWidget {
  @override
  _AnswerPageState createState() => _AnswerPageState();
}

class _AnswerPageState extends State<AnswerPage> {
  final number = Random().nextInt(3) + 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ผลคำทำนาย'),
        //automaticallyImplyLeading: false,
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
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.all(10.0),
              child: Consumer<QuestionFormmodel>(
                builder: (context, form, child) {
                  return Text('ผลการทำนายของคุณ ${form.name}',
                      style: TextStyle(fontSize: 25));
                },
              ),
            ),
            number == 1
                ? Container(
                    child: Padding(
                      padding: EdgeInsets.only(right: 20, left: 20),
                      child: Column(
                        children: [
                          Text('ไพ่หนึ่งเหรียญ',
                              style: TextStyle(fontSize: 20)),
                          Image.asset(
                            'assets/card_front1.png',
                            width: 200,
                            height: 300,
                          ),
                          Consumer<QuestionFormmodel>(
                            builder: (context, form, child) {
                              return Text(
                                  'จากคำถาม ${form.question} \nไพ่ใบนี้บงบอกถึงการเปลี่ยนแปลง แต่ไม่สามารถระบุได้ว่าจะหมุนไปทิศทางไหน จะดีหรือร้ายก็ไม่ทราบแน่ชัด');
                            },
                          ),
                        ],
                      ),
                    ),
                  )
                : SizedBox(),
            number == 2
                ? Container(
                    child: Padding(
                      padding: EdgeInsets.only(right: 20, left: 20),
                      child: Column(
                        children: [
                          Text('ไพ่สองเหรียญ', style: TextStyle(fontSize: 20)),
                          Image.asset(
                            'assets/card_front2.png',
                            width: 200,
                            height: 300,
                          ),
                          Consumer<QuestionFormmodel>(
                            builder: (context, form, child) {
                              return Center(
                                child: Text(
                                    'จากคำถาม ${form.question} \nไพ่ใบนี้เป็นความโดดเด่นโดยเฉพาะในด้านความคิด อารมณ์ เปรียบเสมือนแสงอาทิตย์ที่ส่องสว่าง ให้ความสดใสแก่ทุกชีวิต ไพ่จึงหมายถึง ความสุข ความร่าเริง ความแจ่มใส ทุกๆอย่างกำลังเป็นไปในทางที่ดี และตัวดอกทานตะวันที่หมายถึงความหวัง ทำให้ไพ่ใบนี้ดูสดใสขึ้นไปอีก '),
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                  )
                : SizedBox(),
            number == 3
                ? Container(
                    child: Padding(
                      padding: EdgeInsets.only(right: 20, left: 20),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('ไพ่สามเหรียญ', style: TextStyle(fontSize: 20)),
                          Image.asset(
                            'assets/card_front3.png',
                            width: 200,
                            height: 300,
                          ),
                          Consumer<QuestionFormmodel>(
                            builder: (context, form, child) {
                              return Text(
                                  'จากคำถาม ${form.question} ไพ่ใบนี้บอกว่า ควรระวังเกี่ยวกับการพัง การเกิดภัยพิบัติ การเกิดอุบัติเหตุ หรือการเปลี่ยนแปลง');
                            },
                          ),
                        ],
                      ),
                    ),
                  )
                : SizedBox(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                ElevatedButton(
                  onPressed: () {
                    //code resetform ตอนย้อนกลับ
                    Navigator.pushAndRemoveUntil<QuestionForm>(
                      //ชื่อคลาสฟอร์ม
                      context,
                      MaterialPageRoute<QuestionForm>(
                        builder: (BuildContext context) =>
                            QuestionPage(), //ชื่อคลาสเพจ
                      ),
                      (route) => false,
                    );
                  },
                  child: Text('ทำนายใหม่อีกครั้ง'),
                ),
                /*  ElevatedButton(
                  onPressed: () {},
                  child: Text('แชร์คำทำนาย'),
                ),*/

                ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/9');
                  },
                  child: Text('ไหว้พระเสริมบุญ'),
                ),
              ],
            ),
            /*  ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/9');
              },
              child: Text('ไหว้พระเสริมบุญ'),
            ),*/
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
                  Navigator.pop(context, '/3');
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
          //  animationDuration: Duration(milliseconds: 200),
          index: 2,
        ),
      ),
    );
  }
}
