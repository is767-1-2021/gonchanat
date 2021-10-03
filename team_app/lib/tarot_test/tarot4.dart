// @dart=2.9

import 'package:flutter/material.dart';

class Reading extends StatefulWidget {
  @override
  ReadingState createState() => ReadingState();
}

class ReadingState extends State<Reading> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Multiple Tarot Reading'), centerTitle: true),
      body: Align(
          child: Stack(children: <Widget>[
        Positioned(
          top: 0.0,
          left: 5.0,
          child: InkWell(
            onLongPress: () {
              //Navigator.push(context, MaterialPageRoute(
              //builder: (context)=> FirstPage()));
            },
            child: Image(
              image: AssetImage('assets/card_back.png'),
              width: 100.0,
              height: 200.0,
            ),
          ),
        ),
        Positioned(
          top: 0.0,
          left: 40.0,
          child: InkWell(
            onTap: () {
              //Navigator.push(context, MaterialPageRoute(
              //builder: (context)=> FirstPage()));
            },
            child: Image(
              image: AssetImage('assets/card_back.png'),
              width: 100.0,
              height: 200.0,
            ),
          ),
        ),
      ])),
    );
  }
}
