import 'package:flutter/material.dart';

class MultipleReading2 extends StatefulWidget {
  //final Key key;
  //final Item item;
  //final ValueChanged<bool> isSelected;

  //const MultipleReading2({this.item, this.isSelected, this.key});

  @override
  MyHomePageState createState() => MyHomePageState();
}

class MyHomePageState extends State<MultipleReading2> {
  bool isSelected = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Multiple Tarot Reading'), centerTitle: true),
      body: Align(
          child: Stack(children: <Widget>[
        Positioned(
          bottom: 0.0,
          left: 5.0,
          child: InkWell(
            onLongPress: () {
              //Navigator.push(context, MaterialPageRoute(
              //builder: (context)=> FirstPage()));
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
          bottom: 0.0,
          left: 40.0,
          child: InkWell(
            onTap: () {
              //Navigator.push(context, MaterialPageRoute(
              //builder: (context)=> FirstPage()));
            },
            child: Image(
              image: AssetImage('assets/card_back.png'),
              fit: BoxFit.cover,
              width: 200.0,
              height: 300.0,
            ),
          ),
        ),
      ])),
    );
  }
}
