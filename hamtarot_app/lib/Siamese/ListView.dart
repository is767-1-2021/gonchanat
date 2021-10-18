import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:hamtarot_app/HomePage.dart';

class Thingmenu {
  String name;
  String detail;
  String image;

  Thingmenu(this.name, this.detail, this.image);
}

class ThingView extends StatefulWidget {
  @override
  _ThingViewState createState() => _ThingViewState();
}

class _ThingViewState extends State<ThingView> {
  List<Thingmenu> menu = [
    Thingmenu('วัดแขก', 'เสริมดวงความรัก', 'assets/temp1.jpg'),
    Thingmenu('วัดเล่งเน่ยยี่', 'เสริมดวงการเรียน', 'assets/temp2.jpg')
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text('รวมวัดดังเสริมดวง'),
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
      body: ListView.builder(
          itemCount: menu.length,
          itemBuilder: (BuildContext context, int index) {
            Thingmenu thing = menu[index];
            return ListTile(
              title: Text(thing.name),
              subtitle: Text(thing.detail),
              leading: ConstrainedBox(
                constraints: BoxConstraints(
                  minWidth: 44,
                  minHeight: 44,
                  maxWidth: 55,
                  maxHeight: 55,
                ),
                child: Image.asset(thing.image, fit: BoxFit.cover),
              ),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ThingDetail(thing: thing)));
              },
            );
          }),
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
          index: 5,
        ),
      ),
    );
  }
}

class ThingDetail extends StatelessWidget {
  final Thingmenu thing;
  const ThingDetail({Key? key, required this.thing}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('รายละเอียดวัด'),
        //automaticallyImplyLeading: false,
      ),
      body: Column(
        children: [
          Container(
              padding: EdgeInsets.only(top: 20),
              child: Text(
                thing.name,
                style: TextStyle(fontSize: 24),
              )),
          Center(
            child: Image.asset(
              thing.image,
              width: 300,
              height: 400,
            ),
          ),
          Text('รายละเอียดวัด : อยู่ระหว่างการจัดทำข้อมูล'),
          Container(
              padding: EdgeInsets.only(top: 20),
              child: ElevatedButton(
                  onPressed: () {},
                  style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all<Color>(Colors.amber)),
                  child: Text(
                    'ขอทราบเส้นทาง',
                    style: TextStyle(color: Colors.black),
                  )))
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
          //animationDuration: Duration(milliseconds: 200),
          index: 5,
        ),
      ),
    );
  }
}
