// @dart=2.9

import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';

class FlipAnimationDemo extends StatefulWidget {
  @override
  _FlipAnimationDemoState createState() => _FlipAnimationDemoState();
}

class _FlipAnimationDemoState extends State<FlipAnimationDemo> {
  double _height;
  double _width;

  @override
  Widget build(BuildContext context) {
    _height = MediaQuery.of(context).size.height;
    _width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text('OutCome'),
        centerTitle: true,
      ),
      body: Container(
        width: _width,
        height: _height,
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
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            color: Colors.brown[600],
                          ),
                        ),
                        Text(
                          'The Fool',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.w600),
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
                  'ปัจจุบัน',
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
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            color: Colors.brown[600],
                          ),
                        ),
                        Text(
                          'The Lovers',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.w600),
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
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            color: Colors.brown[600],
                          ),
                        ),
                        Text(
                          'The Sun',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.w600),
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
    );
  }
}
