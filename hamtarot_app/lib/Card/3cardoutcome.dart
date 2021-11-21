import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';
import 'package:hamtarot_app/HomePage.dart';
import 'package:hamtarot_app/model/3card.dart';

class ResultRandom extends StatefulWidget {
  final ThreeCard newthreecard;
  const ResultRandom({Key? key, required this.newthreecard}) : super(key: key);

  @override
  _ResultRandomState createState() => _ResultRandomState();
}

class _ResultRandomState extends State<ResultRandom> {
  late double _height;
  late double _width;

  @override
  Widget build(BuildContext context) {
    _height = MediaQuery.of(context).size.height;
    _width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
          title: Text('ผลคำทำนาย'),
          centerTitle: true,
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
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.only(top: 50),
            //width: _width,
            height: 500,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Column(
                  children: [
                    Text(
                      'อดีต',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                          fontStyle: FontStyle.italic,
                          fontWeight: FontWeight.w600,
                          letterSpacing: 0.0),
                    ),
                    Container(
                      width: 100,
                      height: 150,
                      margin: EdgeInsets.only(top: 10),
                      child: FlipCard(
                        direction: FlipDirection.HORIZONTAL, // default
                        front: Stack(
                          alignment: Alignment.center,
                          children: [
                            Container(
                              child: Image(
                                image:
                                    NetworkImage('${widget.newthreecard.img}'),
                                width: 100.0,
                                height: 150.0,
                                //decoration: BoxDecoration(
                                //borderRadius: BorderRadius.all(Radius.circular(10)),
                                //color: Colors.blue.shade400,
                              ),
                            ),
                          ],
                        ),
                        back: Stack(
                          alignment: Alignment.center,
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10)),
                                color: Colors.brown[600],
                              ),
                            ),
                            Text(
                              '${widget.newthreecard.id}',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w600),
                            ),
                            Text(widget.newthreecard.past,
                                style: TextStyle(fontSize: 16)),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Center(
                      child: Text(
                        'ปัจจุบัน',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                            fontStyle: FontStyle.italic,
                            fontWeight: FontWeight.w600,
                            letterSpacing: 0.0),
                      ),
                    ),
                    Container(
                      width: 100,
                      height: 150,
                      margin: EdgeInsets.only(top: 10),
                      child: FlipCard(
                        direction: FlipDirection.HORIZONTAL, // default
                        front: Stack(
                          alignment: Alignment.center,
                          children: [
                            Container(
                              child: Image(
                                image: AssetImage('assets/card_back.png'),
                                width: 100.0,
                                height: 150.0,
                                //decoration: BoxDecoration(
                                //borderRadius: BorderRadius.all(Radius.circular(10)),
                                //color: Colors.blue.shade400,
                              ),
                            ),
                          ],
                        ),
                        back: Stack(
                          alignment: Alignment.center,
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10)),
                                color: Colors.brown[600],
                              ),
                            ),
                            Center(
                              child: Text(
                                'Lovers',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                    fontWeight: FontWeight.w600),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Text(
                      'อนาคต',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                          fontStyle: FontStyle.italic,
                          fontWeight: FontWeight.w600,
                          letterSpacing: 0.0),
                    ),
                    Container(
                      width: 100,
                      height: 150,
                      margin: EdgeInsets.only(top: 10),
                      child: FlipCard(
                        direction: FlipDirection.HORIZONTAL, // default
                        front: Stack(
                          alignment: Alignment.center,
                          children: [
                            Container(
                              child: Image(
                                image: AssetImage('assets/card_back.png'),
                                width: 100.0,
                                height: 150.0,
                                //decoration: BoxDecoration(
                                //borderRadius: BorderRadius.all(Radius.circular(10)),
                                //color: Colors.blue.shade400,
                              ),
                            ),
                          ],
                        ),
                        back: Stack(
                          alignment: Alignment.center,
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10)),
                                color: Colors.brown[600],
                              ),
                            ),
                            Center(
                              child: Text(
                                'The Sun',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                    fontWeight: FontWeight.w600),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/4');
                },
                child: Text('ทำนายอีกครั้ง'),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/9');
                },
                child: Text('ไหว้พระเสริมบุญ'),
              ),
            ],
          ),
        ],
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
          index: 1,
        ),
      ),
    );
  }
}
