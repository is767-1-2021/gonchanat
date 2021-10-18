import 'dart:async';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:hamtarot_app/HomePage.dart';
import 'package:hamtarot_app/Siamese/model.dart';

import 'dart:math' as match;

import 'package:provider/provider.dart';

class ShakePage extends StatefulWidget {
  @override
  _ShakePageState createState() => _ShakePageState();
}

class _ShakePageState extends State<ShakePage>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<double> animation;
  final _formKey = GlobalKey<FormState>();
  String? _name;

  @override
  void initState() {
    super.initState();

    animationController = AnimationController(
      duration: Duration(milliseconds: 150),
      vsync: this,
    );
    animationController.stop();
    animation = Tween<double>(begin: -0.1, end: 0.01 * match.pi)
        .chain(CurveTween(curve: Curves.easeInOut))
        .animate(animationController)
          ..addListener(() {
            setState(() {});
          });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text('เสี่ยงดูได้ทุกที่ ทุกเวลา'),
          automaticallyImplyLeading: false,
          titleTextStyle: TextStyle(
              color: Colors.white60, fontSize: 16, fontWeight: FontWeight.bold),
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
        child: Container(
          color: Colors.amber[50],
          padding: EdgeInsets.only(top: 20),
          child: Column(
            children: [
              Container(
                width: 300,
                padding: EdgeInsets.only(left: 20),
                child: Row(
                  children: [
                    Container(
                        padding: EdgeInsets.only(right: 5, bottom: 5),
                        child: Icon(
                          Icons.tungsten_outlined,
                          color: Colors.amber[600],
                          size: 30,
                        )),
                    Text('วิธีการเสี่ยงเซียมซี',
                        style: TextStyle(
                            fontSize: 22, fontWeight: FontWeight.w600)),
                  ],
                ),
              ),
              Container(
                width: 300,
                padding: EdgeInsets.only(left: 40, top: 10),
                child: Row(
                  children: [
                    Text('1.สงบจิต คิดสิ่งที่อยากรู้',
                        style: TextStyle(fontSize: 16)),
                  ],
                ),
              ),
              Form(
                key: _formKey,
                child: Container(
                  width: 300,
                  padding: EdgeInsets.only(left: 40, right: 50),
                  child: Column(
                    children: [
                      TextFormField(
                        decoration: InputDecoration(
                          hintText: '2.โปรดระบุชื่อของคุณ',
                          hintStyle:
                              TextStyle(fontSize: 16, color: Colors.black),
                          border: UnderlineInputBorder(),

                          // labelText: '2.โปรดระบุชื่อของคุณ',
                          // // labelStyle:
                          //     TextStyle(fontSize: 14, color: Colors.black)
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return '*';
                          }

                          return null;
                        },
                        onSaved: (value) {
                          _name = value;
                        },
                        initialValue: context.read<Namemodel>().Name,
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                width: 300,
                padding: EdgeInsets.only(left: 40, bottom: 10, top: 5),
                child: Row(
                  children: [
                    Text('3.กด', style: TextStyle(fontSize: 16)),
                    Icon(Icons.touch_app_outlined),
                    Text('เพื่อเริ่มทำนายได้เลย!',
                        style: TextStyle(fontSize: 16))
                  ],
                ),
              ),
              Center(
                  child: Transform.rotate(
                      angle: animation.value,
                      child: Container(
                        width: 250,
                        height: 300,
                        padding: EdgeInsets.only(top: 20),
                        child: ClipOval(
                          child: Image.asset(
                            'assets/seamsee_box.png',
                            scale: 2,
                          ),
                        ),
                      ))),
              IconButton(
                icon: Icon(Icons.touch_app_outlined),
                iconSize: 40,
                onPressed: () async {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();
                    context.read<Namemodel>().Name = _name;
                    animationController.repeat();

                    await Future.delayed(const Duration(milliseconds: 5000),
                        () {
                      setState(() {
                        animationController.stop();
                      });
                    });
                    Navigator.pushNamed(context, '/8');
                    // await showDialog(
                    //   context: context,
                    //   builder: (BuildContext context) {
                    //     return AlertDialog(
                    //       title: Text(''),
                    //       content: Text('โปรดกดดูคำทำนาย'),
                    //       actions: <Widget>[
                    //         ElevatedButton(
                    //             onPressed: () {
                    //               Navigator.push(
                    //                   context,
                    //                   MaterialPageRoute(
                    //                     builder: (context) =>
                    //                         ResultPage(),
                    //                   ));
                    //             },
                    //             child: Text('ดูคำทำนาย'))
                    //       ],
                    //     );
                    //   },
                    // );

                  } else
                    () {
                      setState(() {});
                    };
                },
              ),
            ],
          ),
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
          //  animationDuration: Duration(milliseconds: 200),
          index: 3,
        ),
      ),
    );
  }
}
