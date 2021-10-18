import 'dart:math';

import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';
import 'package:hamtarot_app/HomePage.dart';

class MyAppCard1 extends StatefulWidget {
  //MyAppCard1({Key? key, required this.title}) : super(key: key);
  //final String title;

  @override
  _MyAppCard1State createState() => _MyAppCard1State();
}

class _MyAppCard1State extends State<MyAppCard1> {
  get body => null;
  TabBar get _tabBar => TabBar(
        tabs: [
          Tab(text: 'ความรัก', icon: Icon(Icons.favorite)),
          Tab(text: 'การงาน', icon: Icon(Icons.accessibility)),
          Tab(text: 'การเงิน', icon: Icon(Icons.account_balance)),
        ],
      );

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 0,
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: Text('ทำนายทายทัก'),
          automaticallyImplyLeading: false,
          bottom: PreferredSize(
            preferredSize: _tabBar.preferredSize,
            child: ColoredBox(
              color: Colors.brown,
              child: _tabBar,
            ),
          ),
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
        body: //Column(
            //  Center(
            Stack(
          children: <Widget>[
            Container(
              height: 500.0,
              child: Stack(children: <Widget>[
                Positioned(
                  top: 50.0,
                  left: 5.0,
                  child: InkWell(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => FirstPage()));
                    },
                    child: Image(
                      image: AssetImage('assets/card_back.png'),
                      fit: BoxFit.cover,
                      width: 200.0,
                      height: 300.0,
                    ),
                  ),
                ),
                Positioned(
                  top: 50.0,
                  left: 30.0,
                  child: InkWell(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => FirstPage()));
                    },
                    child: Image(
                      image: AssetImage('assets/card_back.png'),
                      fit: BoxFit.cover,
                      width: 200.0,
                      height: 300.0,
                    ),
                  ),
                ),
                Positioned(
                  top: 50.0,
                  left: 60.0,
                  child: InkWell(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => FirstPage()));
                    },
                    child: Image(
                      image: AssetImage('assets/card_back.png'),
                      fit: BoxFit.cover,
                      width: 200.0,
                      height: 300.0,
                    ),
                  ),
                ),
                Positioned(
                  top: 50.0,
                  left: 90.0,
                  child: InkWell(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => FirstPage()));
                    },
                    child: Image(
                      image: AssetImage('assets/card_back.png'),
                      fit: BoxFit.cover,
                      width: 200.0,
                      height: 300.0,
                    ),
                  ),
                ),
                Positioned(
                  top: 50.0,
                  left: 120.0,
                  child: InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => FirstPage()));
                      },
                      child: Image(
                        image: AssetImage('assets/card_back.png'),
                        fit: BoxFit.cover,
                        width: 200.0,
                        height: 300.0,
                      )),
                ),
                Positioned(
                  top: 50.0,
                  left: 150.0,
                  child: InkWell(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => FirstPage()));
                    },
                    child: Image(
                      image: AssetImage('assets/card_back.png'),
                      fit: BoxFit.cover,
                      width: 200.0,
                      height: 300.0,
                    ),
                  ),
                ),
                Positioned(
                  top: 50.0,
                  left: 180.0,
                  child: InkWell(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => FirstPage()));
                    },
                    child: Image(
                      image: AssetImage('assets/card_back.png'),
                      fit: BoxFit.cover,
                      width: 200.0,
                      height: 300.0,
                    ),
                  ),
                ),
              ]),
            ),
          ],
        ),
        // ],
        //),
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
                  icon:
                      Icon(Icons.crop_portrait, size: 30, color: Colors.black)),
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
                  icon: Icon(Icons.battery_unknown,
                      size: 30, color: Colors.black)),
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
            index: 0,
          ),
        ),
      ),
    );
  }
}

class FirstPage extends StatefulWidget {
  @override
  _FirstPageState createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  GlobalKey<FlipCardState> cardKey = GlobalKey<FlipCardState>();

  static var listImagesnotFound = [
    //"assets/joker.png",
    //"assets/king.png",
    //"assets/queen.png",
    "assets/card_result-1.png",
    "assets/card_result-2.png",
    "assets/card_result-3.png"
  ];
  static var _random = Random();
  var imageToShow =
      listImagesnotFound[_random.nextInt(listImagesnotFound.length)];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ทำนาย'),
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
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Container(
              // margin: EdgeInsets.only(left: 50.0, right: 50.0, bottom: 4.0),
              alignment: Alignment.center,
              child: FlipCard(
                direction: FlipDirection.HORIZONTAL,
                front: Container(
                    width: 200,
                    height: 300,
                    child: Image.asset(
                      'assets/card_back.png',
                    )),
                back: Container(
                  width: 300,
                  height: 500,
                  child: Image.asset(imageToShow.toString()),
                ),
              ),
            ),
          ),
          // Center(
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/3');
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
          //),
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
                  Navigator.pushNamed(context, '/3');
                },
                icon: Icon(Icons.quiz, size: 30, color: Colors.black)),
            IconButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/5');
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
          index: 0,
        ),
      ),
      /*floatingActionButton: FloatingActionButton.extended(
          elevation: 2.0,
          icon: const Icon(Icons.refresh),
          label: const Text('ทำนายอีกครั้ง'),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => MyAppCard1(
                    //title: '',
                    ),
              ),
            );
          },
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat*/
    );
  }
}
