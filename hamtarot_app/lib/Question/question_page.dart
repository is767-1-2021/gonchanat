import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:hamtarot_app/HomePage.dart';
import 'package:hamtarot_app/Question/question_form_model.dart';
import 'package:provider/provider.dart';

class QuestionPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ไพ่ทายคำ'),
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
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/card_back.png',
              width: 200,
              height: 300,
            ),
            Text(
              'ให้ไพ่ช่วยทำนายกัน',
              style: TextStyle(fontSize: 25, color: Colors.black54),
            ),
            QuestionForm(),
          ],
        ),
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
          // animationDuration: Duration(milliseconds: 200),
          index: 2,
        ),
      ),
    );
  }
}

class QuestionForm extends StatefulWidget {
  @override
  _QuestionFormState createState() => _QuestionFormState();
}

class _QuestionFormState extends State<QuestionForm> {
  final _formKey = GlobalKey<FormState>();
  String? _question;
  String? _name;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          TextFormField(
            decoration: InputDecoration(
              border: UnderlineInputBorder(),
              labelText: 'ชื่อของคุณ',
              icon: Icon(Icons.person_pin_rounded),
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'บอกชื่อกันหน่อย';
              }
              return null;
            },
            onSaved: (value) {
              _name = value;
            },
          ),
          TextFormField(
            decoration: InputDecoration(
              border: UnderlineInputBorder(),
              labelText: 'โปรดพิมพ์คำถามของคุณ',
              icon: Icon(Icons.question_answer_rounded),
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'เอ๊ะ ลืมใส่คำถามหรือเปล่านะ?';
              }
              return null;
            },
            onSaved: (value) {
              _question = value;
            },
          ),
          ElevatedButton(
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                _formKey.currentState!.save();

                context.read<QuestionFormmodel>().name = _name;
                context.read<QuestionFormmodel>().question = _question;

                Navigator.pushNamed(context, '/10');
              }
            },
            child: Text('ทำนาย'),
          ),
        ],
      ),
    );
  }
}
