import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:hamtarot_app/Form/View_form.dart';
import 'package:hamtarot_app/Login/login.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, this.title}) : super(key: key);

  final String? title;

  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final user = FirebaseAuth.instance.currentUser;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Icon(Icons.brightness_4_sharp, size: 30),
              Text(
                'HAMTAROT',
                style: TextStyle(fontSize: 25),
              ),
            ],
          ),
          actions: [
            Theme(
              data: Theme.of(context).copyWith(
                  textTheme: TextTheme().apply(bodyColor: Colors.black),
                  dividerColor: Colors.white,
                  iconTheme: IconThemeData(color: Colors.white)),
              child: PopupMenuButton<int>(
                color: Colors.black,
                itemBuilder: (context) => [
                  PopupMenuItem<int>(value: 0, child: Text(user!.email!)),
                  // PopupMenuItem<int>(
                  //  value: 1, child: Text("Privacy Policy page")),
                  PopupMenuDivider(),
                  PopupMenuItem<int>(
                    value: 3,
                    child: Row(
                      children: [
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
                        Text("Home"),
                      ],
                    ),
                  ),
                  PopupMenuItem<int>(
                    value: 3,
                    child: Row(
                      children: [
                        IconButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => RegisView(),
                                ),
                              );
                            },
                            icon: Icon(Icons.history)),
                        Text("History"),
                      ],
                    ),
                  ),
                  PopupMenuItem<int>(
                    value: 3,
                    child: Row(
                      children: [
                        IconButton(
                            onPressed: () async {
                              await FirebaseAuth.instance.signOut().then(
                                  (value) => Navigator.of(context)
                                      .pushAndRemoveUntil(
                                          MaterialPageRoute(
                                              builder: (context) => Login()),
                                          (route) => false));
                            },
                            icon: Icon(Icons.logout)),
                        Text("Logout"),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ]),
      body: SingleChildScrollView(
        child: Column(children: [
          Center(
            child: Container(
                padding: EdgeInsets.only(bottom: 30),
                child: Image.asset('assets/banner.png')),
          ),
          Container(
            height: 75,
            width: 350,
            child: GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, '/3');
              },
              child: Card(
                color: Colors.brown[900],
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(100.0)),
                elevation: 5,
                child: Center(
                  child: Row(children: [
                    Container(
                      padding: EdgeInsets.only(left: 100),
                      decoration: BoxDecoration(
                        color: Colors.white70,
                        borderRadius: BorderRadius.circular(150.0),
                        image: DecorationImage(
                          image: AssetImage('assets/card1.jfif'),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Container(
                        padding: EdgeInsets.only(left: 10),
                        child: Text('ทำนายทายทัก',
                            style:
                                TextStyle(color: Colors.white, fontSize: 20)))
                  ]),
                ),
              ),
            ),
          ),
          Container(
            height: 75,
            width: 350,
            child: GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, '/4');
              },
              child: Card(
                color: Colors.brown[900],
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(100.0)),
                elevation: 5,
                child: Center(
                  child: Row(children: [
                    Container(
                      padding: EdgeInsets.only(left: 100),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(150.0),
                        image: DecorationImage(
                          image: AssetImage('assets/card3.jpg'),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Container(
                        padding: EdgeInsets.only(left: 10),
                        child: Text('ชะตาชีวิต',
                            style:
                                TextStyle(color: Colors.white, fontSize: 20)))
                  ]),
                ),
              ),
            ),
          ),
          Container(
            height: 75,
            width: 350,
            child: GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, '/5');
              },
              child: Card(
                color: Colors.brown[900],
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(100.0)),
                elevation: 5,
                child: Center(
                  child: Row(children: [
                    Container(
                      padding: EdgeInsets.only(left: 100),
                      decoration: BoxDecoration(
                        color: Colors.white70,
                        borderRadius: BorderRadius.circular(150.0),
                        image: DecorationImage(
                          image: AssetImage('assets/question.jpg'),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Container(
                        padding: EdgeInsets.only(left: 10),
                        child: Text('ไพ่ทายคำ',
                            style:
                                TextStyle(color: Colors.white, fontSize: 20)))
                  ]),
                ),
              ),
            ),
          ),
          Container(
            height: 75,
            width: 350,
            child: GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, '/6');
              },
              child: Card(
                color: Colors.brown[900],
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(100.0)),
                elevation: 5,
                child: Center(
                  child: Row(children: [
                    Container(
                      padding: EdgeInsets.only(left: 100),
                      decoration: BoxDecoration(
                        color: Colors.white70,
                        borderRadius: BorderRadius.circular(150.0),
                        image: DecorationImage(
                          image: AssetImage('assets/siamese.jpg'),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Container(
                        padding: EdgeInsets.only(left: 10),
                        child: Text('เซียมซี',
                            style:
                                TextStyle(color: Colors.white, fontSize: 20)))
                  ]),
                ),
              ),
            ),
          ),
          Container(
            height: 75,
            width: 350,
            child: GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, '/2');
              },
              child: Card(
                color: Colors.brown[900],
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(100.0)),
                elevation: 5,
                child: Center(
                  child: Row(children: [
                    Container(
                      padding: EdgeInsets.only(left: 100),
                      decoration: BoxDecoration(
                        color: Colors.white70,
                        borderRadius: BorderRadius.circular(150.0),
                        image: DecorationImage(
                          image: AssetImage('assets/q1.jpg'),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Container(
                        padding: EdgeInsets.only(left: 10),
                        child: Text('จองคิวดูดวง',
                            style:
                                TextStyle(color: Colors.white, fontSize: 20)))
                  ]),
                ),
              ),
            ),
          ),
          Container(
            height: 75,
            width: 350,
            child: GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, '/9');
              },
              child: Card(
                color: Colors.brown[900],
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(100.0)),
                elevation: 5,
                child: Center(
                  child: Row(children: [
                    Container(
                      padding: EdgeInsets.only(left: 100),
                      decoration: BoxDecoration(
                        color: Colors.white70,
                        borderRadius: BorderRadius.circular(150.0),
                        image: DecorationImage(
                          image: AssetImage('assets/temp2.jpg'),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Container(
                        padding: EdgeInsets.only(left: 10),
                        child: Text('ไหว้พระเสริมดวง',
                            style:
                                TextStyle(color: Colors.white, fontSize: 20))),
                  ]),
                ),
              ),
            ),
          ),
        ]),
      ),
    );
  }
}

class BottomHome extends StatefulWidget {
  @override
  State createState() {
    return _BottomHomeState();
  }
}

class _BottomHomeState extends State {
  //int _currentIndex = 0;
  //final List _children = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(),
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
                icon: Icon(Icons.fence, size: 30, color: Colors.black)),
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
          index: 4,
        ),
      ),
    );
  }
}
