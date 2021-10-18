import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, this.title}) : super(key: key);

  final String? title;

  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Image hora = Image.asset(
    'assets/q1.jpg',
    width: 500,
  );
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        // appBar: new AppBar(
        //   title: new Text('Hamtarot'),
        //   automaticallyImplyLeading: false,
        //  ),
        appBar: AppBar(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Icon(Icons.brightness_4_sharp, size: 30),
              Text(
                'HAMTAROT',
                style: TextStyle(fontSize: 25),
              ),
              Icon(Icons.brightness_4_sharp, size: 30)
            ],
          ),
          automaticallyImplyLeading: false,
        ),
        body: GridView.count(
          primary: false,
          padding: const EdgeInsets.all(20),
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          crossAxisCount: 2,
          children: <Widget>[
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, '/3');
              },
              child: Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Colors.white70,
                  borderRadius: BorderRadius.circular(200.0),
                  image: DecorationImage(
                    image: AssetImage('assets/card1.jfif'),
                    fit: BoxFit.cover,
                    //colorFilter: new ColorFilter.mode(
                    //   Colors.black.withOpacity(0.4), BlendMode.dstATop),
                  ),
                ),
                child: Center(
                  child: Text(
                    'ไพ่ 1 ใบ',
                    style: TextStyle(
                      fontSize: 40,
                      color: Colors.white,
                      //backgroundColor: Colors.brown[300],
                      /*  shadows: <Shadow>[
                        Shadow(
                          offset: Offset(10.0, 10.0),
                          blurRadius: 3.0,
                          color: Color.fromARGB(255, 0, 0, 0),
                        ),
                        Shadow(
                          offset: Offset(10.0, 10.0),
                          blurRadius: 8.0,
                          color: Color.fromARGB(125, 0, 0, 255),
                        ),
                      ],*/
                    ),
                  ),
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, '/4');
              },
              child: Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Colors.amber[900],
                  borderRadius: BorderRadius.circular(200.0),
                  image: DecorationImage(
                    image: AssetImage('assets/card3.jpg'),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Center(
                  child: Text(
                    'ไพ่ 3 ใบ',
                    style: TextStyle(fontSize: 40, color: Colors.white),
                  ),
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, '/5');
              },
              child: Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Colors.amber[900],
                  borderRadius: BorderRadius.circular(200.0),
                  image: DecorationImage(
                    image: AssetImage('assets/question.jpg'),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Center(
                  child: Text(
                    'ทายคำ',
                    style: TextStyle(fontSize: 40, color: Colors.white),
                  ),
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, '/6');
              },
              child: Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Colors.amber[900],
                  borderRadius: BorderRadius.circular(200.0),
                  image: DecorationImage(
                    image: AssetImage('assets/siamese.jpg'),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Center(
                  child: Text(
                    'เซียมซี',
                    style: TextStyle(fontSize: 40, color: Colors.white),
                  ),
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, '/2');
              },
              child: Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Colors.amber[900],
                  borderRadius: BorderRadius.circular(200.0),
                  image: DecorationImage(
                    image: AssetImage('assets/q1.jpg'),
                    fit: BoxFit.cover, //Image.asset('assets/q1.jpg'),)
                  ),
                ),
                child: Center(
                  child: Text(
                    'จองคิว',
                    style: TextStyle(fontSize: 40, color: Colors.white),
                  ),
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, '/9');
              },
              child: Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Colors.amber[900],
                  borderRadius: BorderRadius.circular(200.0),
                  image: DecorationImage(
                    image: AssetImage('assets/temp2.jpg'),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Center(
                  child: Text(
                    'ไหว้พระ',
                    style: TextStyle(fontSize: 40, color: Colors.white),
                  ),
                ),
              ),
            ),
            /* GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, '/12');
              },
              child: Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Colors.amber[900],
                  borderRadius: BorderRadius.circular(20.0),
                  image: DecorationImage(
                    image: AssetImage('assets/temp2.jpg'),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Center(
                  child: Text(
                    'tets',
                    style: TextStyle(fontSize: 40, color: Colors.white),
                  ),
                ),
              ),
            ),*/
          ],
        ));
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
