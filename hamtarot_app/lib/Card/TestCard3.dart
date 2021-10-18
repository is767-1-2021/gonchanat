import 'package:flutter/material.dart';

class oneCardSelectinAnimation extends StatefulWidget {
  @override
  _oneCardSelectinAnimationState createState() =>
      _oneCardSelectinAnimationState();
}

int maxSelectedCards = 3;
int currentSelectedCards = 0;

class ListItem<T> {
  bool isSelected = false; //Selection property to highlight or not
  T data; //Data of the user
  ListItem(this.data); //Constructor to assign the data
}

class _oneCardSelectinAnimationState extends State<oneCardSelectinAnimation> {
  late List<ListItem<String>> list;
  @override
  void initState() {
    super.initState();
    populateData();
  }

  void populateData() {
    list = [];
    for (int i = 0; i < 21; i++) list.add(ListItem<String>("item $i"));
  }

  int numberOfSelectedCards = 7;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("List Selection${numberOfSelectedCards}"),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height * 0.3,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: list.length,
          itemBuilder: _getListItemTile,
        ),
      ),
    );
  }

  Widget _getListItemTile(BuildContext context, int index) {
    return GestureDetector(
      onTap: () {
        if (currentSelectedCards < maxSelectedCards &&
            !(list[index].isSelected)) {
          setState(() {
            list[index].isSelected = true;
            currentSelectedCards += 1;
          });
        }
      },
      onLongPress: () {
        if (currentSelectedCards > 0 && list[index].isSelected) {
          setState(() {
            list[index].isSelected = false;
            currentSelectedCards -= 1;
          });
        }
      },
      child: Container(
        width: MediaQuery.of(context).size.width * 0.3,
        height: MediaQuery.of(context).size.height * 0.3,
        margin: EdgeInsets.symmetric(vertical: 4),
        color: list[index].isSelected ? Colors.red[100] : Colors.white,
        child: Image.asset(
          "assets/card_back.png",
        ),
      ),
    );
  }
}
