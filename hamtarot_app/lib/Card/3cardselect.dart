import 'dart:math';

import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:hamtarot_app/Card/3cardoutcome.dart';
import 'package:hamtarot_app/Controlers/3card.dart';
import 'package:hamtarot_app/Services/3card.dart';
import 'package:hamtarot_app/model/3card.dart';

class MyAppCard3 extends StatefulWidget {
  @override
  _MyAppCard3State createState() => _MyAppCard3State();
}

class _MyAppCard3State extends State<MyAppCard3> {
  late List<Item> itemList;
  late List<Item> selectedList;
  Services? service;
  ThreeCardController? controller;
  List<ThreeCard> threecard = List.empty();
  int randomIndex = Random().nextInt(3);

  @override
  void initState() {
    loadList();
    super.initState();

    service = ThreeCardServices();
    controller = ThreeCardController(service!);
  }

  loadList() {
    itemList = [];
    selectedList = [];
    itemList.add(Item("assets/card_back.png", 1));
    itemList.add(Item("assets/card_back.png", 2));
    itemList.add(Item("assets/card_back.png", 3));
    itemList.add(Item("assets/card_back.png", 4));
    itemList.add(Item("assets/card_back.png", 5));
    itemList.add(Item("assets/card_back.png", 6));
    itemList.add(Item("assets/card_back.png", 7));
    itemList.add(Item("assets/card_back.png", 8));
    itemList.add(Item("assets/card_back.png", 9));
    itemList.add(Item("assets/card_back.png", 10));
    itemList.add(Item("assets/card_back.png", 11));
    itemList.add(Item("assets/card_back.png", 12));
  }

  void getthreecard() async {
    var newthreecard = await controller!.fectthreecard();

    setState(() {
      threecard = newthreecard;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getAppBar(),
      body: Container(
        padding: EdgeInsets.only(top: 50),
        child: GridView.builder(
            itemCount: itemList.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4,
                childAspectRatio: 0.56,
                crossAxisSpacing: 2,
                mainAxisSpacing: 2),
            itemBuilder: (context, index) {
              return GridItem(
                  item: itemList[index],
                  isSelected: (bool value) {
                    setState(() {
                      if (value) {
                        selectedList.add(itemList[index]);
                      } else {
                        selectedList.remove(itemList[index]);
                      }
                    });
                    print("$index : $value");
                  },
                  key: Key(itemList[index].rank.toString()));
            }),
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
          index: 1,
        ),
      ),
    );
  }

  getAppBar() {
    return AppBar(
        title:
            Text(selectedList.length < 1 ? "กรุณาเลือกไพ่ 3 ใบ" : "ชะตาชีวิต"),
        centerTitle: true,
        automaticallyImplyLeading: false,
        actions: <Widget>[
          /* IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => MyHomePage(),
                  ),
                );
              },
              icon: Icon(Icons.home)),*/

          selectedList.length < 3
              ? Container()
              : InkWell(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      ElevatedButton(
                        onPressed: () async {
                          getthreecard();
                          setState(() {});
                          await showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                ThreeCard newthreecard = threecard[randomIndex];
                                return AlertDialog(
                                  content: Text('ดูผลการ์ด${newthreecard.id}'),
                                  contentPadding: EdgeInsets.all(30),
                                  actions: <Widget>[
                                    ElevatedButton(
                                        onPressed: () {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) =>
                                                    ResultRandom(
                                                  newthreecard: newthreecard,
                                                ),
                                              ));
                                          /*  Navigator.push(
                  context,MaterialPageRoute(
              builder: (context) => CardResult (newcard : newcard),
           ),*/
                                        },
                                        child:
                                            Center(child: Text('ดูคำทำนาย'))),
                                  ],
                                );
                              });
                        },
                        child: Text('ทำนาย'),
                      ),
                    ],
                  ),
                ),
        ]);
  }
}

class Item {
  String imageUrl;
  int rank;

  Item(this.imageUrl, this.rank);
}

class GridItem extends StatefulWidget {
  final Key key;
  final Item item;
  final ValueChanged<bool> isSelected;

  GridItem({required this.item, required this.isSelected, required this.key});

  @override
  _GridItemState createState() => _GridItemState();
}

class _GridItemState extends State<GridItem> {
  bool isSelected = false;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        setState(() {
          isSelected = !isSelected;
          widget.isSelected(isSelected);
        });
      },
      child: Stack(
        children: <Widget>[
          Image.asset(
            widget.item.imageUrl,
            color: Colors.black.withOpacity(isSelected ? 0.9 : 0),
            colorBlendMode: BlendMode.color,
          ),
        ],
      ),
    );
  }
}
