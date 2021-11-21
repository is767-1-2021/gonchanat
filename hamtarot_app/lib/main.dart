import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hamtarot_app/Card/card1.dart';
import 'package:hamtarot_app/Card/3cardselect.dart';
import 'package:hamtarot_app/HomePage.dart';
import 'package:hamtarot_app/Page/Form.dart';
import 'package:hamtarot_app/Page/form_show.dart';
import 'package:hamtarot_app/Question/answer_page.dart';
import 'package:hamtarot_app/Question/question_form_model.dart';
import 'package:hamtarot_app/Question/question_page.dart';
import 'package:hamtarot_app/Siamese/ListView.dart';
import 'package:hamtarot_app/Siamese/result.dart';
import 'package:hamtarot_app/Siamese/shake.dart';
import 'package:provider/provider.dart';
import 'Siamese/model.dart';
import 'model/DataFormModel.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => DataFormModel(),
        ),
        ChangeNotifierProvider(
          create: (context) => Namemodel(),
        ),
        ChangeNotifierProvider(
          create: (context) => QuestionFormmodel(),
        ),
      ],
      child: MyAppHamtarot(),
    ),
  );
}

class MyAppHamtarot extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        // title: 'Hamtarot_M',
        theme: ThemeData(
          primaryColor: Colors.brown[600],
          primarySwatch: Colors.amber,
          accentColor: Colors.red,
          //backgroundColor: Colors.red,
          scaffoldBackgroundColor: const Color(0xFFFFF8E1),
          // backgroundColor: Color.am,
          // textTheme: TextTheme(
          //   bodyText2: TextStyle(color: Colors.purple),
          //  ),
          textTheme: GoogleFonts.promptTextTheme(
            Theme.of(context).textTheme,
          ),
        ),
        initialRoute: '/1',
        routes: <String, WidgetBuilder>{
          '/1': (context) => MyHomePage(),
          '/2': (context) => FormPage(), //form
          '/7': (context) => Showdata(), //form
          '/3': (context) => MyAppCard1(), //card1
          '/4': (context) => MyAppCard3(), //card3
          '/5': (context) => QuestionPage(), //question
          '/10': (context) => AnswerPage(), //question
          '/6': (context) => ShakePage(), //siamese
          '/8': (context) => ResultPage(), //siamese
          '/9': (context) => ThingView(),
        });
  }
}
