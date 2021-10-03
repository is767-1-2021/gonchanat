import 'package:flutter/material.dart';

class MultipleReading extends StatefulWidget {
  @override
  MyHomePageState createState() => MyHomePageState();
}

@override
class MyHomePageState extends State<MultipleReading> {
  //var selected = isSelected;
  var isSelected = false;
  var mycolor = Colors.amber[200];

  List<Widget> _cards = [];
  void _initCards() {
    double cardHeight = 350 / 2;
    double cardWidth = 1300 / 20;
    for (int i = 0; i < 20; i++) {
      _cards.add(Positioned(
        left: ((i >= 10) ? i - 10 : i) * cardWidth / 2,
        bottom: (i >= 10) ? 0.7 * cardHeight : 0,
        child: GestureDetector(
          onLongPress: () => print('object'),
          child: Card(
            color: mycolor,
            elevation: 10,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            child: Container(width: cardWidth, height: cardHeight),
          ),
        ),
      ));
    }
  }

  void toggleSelection() {
    setState(() {
      if (isSelected) {
        mycolor = Colors.amber[200];
        isSelected = false;
      } else {
        mycolor = Colors.grey[300];
        isSelected = true;
      }
    });
  }

  @override
  void initState() {
    super.initState();
    _initCards();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Multiple Tarot Reading'),
        centerTitle: true,
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 15.0),
        child: Stack(children: _cards),
        decoration: BoxDecoration(
          color: Colors.brown[600],
        ),
      ),
    );
  }
}

late final GestureLongPressCallback? onLongPress;
