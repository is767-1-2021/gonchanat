import 'package:flutter/material.dart';
import 'package:hamtarot_app/Siamese/model.dart';

import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => Namemodel(),
        ),
      ],
      child: MyAppsiamese(),
    ),
  );
}

/*mixin GoogleFonts {
  static latoTextTheme(TextTheme textTheme) {}

  static promptTextTheme(TextTheme textTheme) {}
}*/

class MyAppsiamese extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('เลือกวัด'),
        automaticallyImplyLeading: false,
      ),
      body: GridView.count(
        mainAxisSpacing: 10.0,
        crossAxisSpacing: 10.0,
        crossAxisCount: 2,
        children: [
          GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, '/11');
            },
            child: Container(
              color: Colors.brown,
              child: Text('A'),
            ),
          ),
          Container(
            color: Colors.brown[300],
            child: Center(child: Text('วัดแขก')),
          ),
          Container(
            color: Colors.brown[300],
            child: Center(child: Text('วัดจีน')),
          ),
          Container(
            color: Colors.brown[300],
            child: Center(child: Text('Random')),
          ),
        ],
      ),
    );
  }
}
