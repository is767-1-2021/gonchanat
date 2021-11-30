import 'package:final_app2/controlers/calcontroler.dart';
import 'package:final_app2/models/calmodel.dart';
import 'package:final_app2/pages/calculator.dart';
import 'package:final_app2/services/calservice.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

String getTime(var time) {
  final DateFormat formatter =
      DateFormat('dd/MM/yyyy, hh:mm aa'); //your date format here
  var date = time.toDate();
  return formatter.format(date);
}

class Historypage extends StatefulWidget {
  @override
  _HistorypageState createState() => _HistorypageState();
}

class _HistorypageState extends State<Historypage> {
  Services? service;
  CalController? controller;
  List<Cal> cal = List.empty();
  bool isloading = false;
  final user = FirebaseAuth.instance.currentUser;

  @override
  void initState() {
    super.initState();
    service = CalServices();
    controller = CalController(service!);
    // controller!.onSync
    //     .listen((bool synState) => setState(() => isLoading = synState));
    getcal();
  }

  void getcal() async {
    var newcal = await controller!.fectcal();

    setState(() {
      cal = newcal;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[600],
      appBar: AppBar(
          backgroundColor: Colors.blueGrey[700],
          title: Text('Your History'),
          automaticallyImplyLeading: false,
          actions: [
            IconButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => MyCalculatorPage(),
                    ),
                  );
                },
                icon: Icon(Icons.backspace)),
          ]),
      body: ListView.separated(
        itemCount: cal.isEmpty ? 1 : cal.length,
        itemBuilder: (context, index) {
          if (cal.isEmpty) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text("ไม่พบข้อมูล"),
              ],
            );
          }

          return Row(
            children: [
              Container(
                padding: EdgeInsets.only(right: 5, left: 10),
                child: Row(
                  children: [Icon(Icons.history_edu)],
                ),
              ),
              Expanded(
                child: Container(
                  padding: EdgeInsets.only(right: 5, left: 5),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text('Answer :' + cal[index].answer,
                          style: TextStyle(color: Colors.white)),
                      Text(
                          'วันที่ :' +
                              getTime(cal[index].historydate).toString(),
                          style: TextStyle(
                              color: Colors.white)), //+ history[index].result
                    ],
                  ),
                ),
              ),
            ],
          );
        },
        separatorBuilder: (BuildContext context, int index) {
          return Divider(
            color: Colors.white,
          );
        },
      ),
    );
  }
}
