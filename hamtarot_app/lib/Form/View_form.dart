//import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hamtarot_app/HomePage.dart';
import 'package:hamtarot_app/Login/login.dart';
import 'package:hamtarot_app/Services/form_services.dart';

import 'package:hamtarot_app/Controlers/form_controller.dart';
import 'package:hamtarot_app/model/form_model.dart';
import 'package:intl/intl.dart'; //add this import statement for using DateTime class

String getTime(var time) {
  final DateFormat formatter =
      DateFormat('dd/MM/yyyy, hh:mm aa'); //your date format here
  var date = time.toDate();
  return formatter.format(date);
}

class RegisView extends StatefulWidget {
  @override
  _RegisViewState createState() => _RegisViewState();
}

class _RegisViewState extends State<RegisView> {
  Services? service;
  FormController? controller;

  List<Formregis> forms = List.empty();
  bool isloading = false;
  final user = FirebaseAuth.instance.currentUser;
  @override
  void initState() {
    super.initState();
    service = firebaseService();
    controller = FormController(service!);

    getForms();
  }

  void getForms() async {
    var newForms = await controller!.fetchForms(user!.email);

    setState(() {
      forms = newForms;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('ข้อมูลการลงทะเบียนจองคิว'),
          //automaticallyImplyLeading: false,
          actions: [
            Theme(
              data: Theme.of(context).copyWith(
                  textTheme: TextTheme().apply(bodyColor: Colors.black),
                  dividerColor: Colors.white,
                  iconTheme: IconThemeData(color: Colors.white)),
              child: PopupMenuButton<int>(
                color: Colors.black,
                itemBuilder: (context) => [
                  PopupMenuItem<int>(value: 0, child: Text(user!.email!)),
                  // PopupMenuItem<int>(
                  //  value: 1, child: Text("Privacy Policy page")),
                  PopupMenuDivider(),
                  PopupMenuItem<int>(
                    value: 3,
                    child: Row(
                      children: [
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
                        Text("Home"),
                      ],
                    ),
                  ),
                  PopupMenuItem<int>(
                    value: 3,
                    child: Row(
                      children: [
                        IconButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => MyHomePage(),
                                ),
                              );
                            },
                            icon: Icon(Icons.history)),
                        Text("History"),
                      ],
                    ),
                  ),
                  PopupMenuItem<int>(
                    value: 3,
                    child: Row(
                      children: [
                        IconButton(
                            onPressed: () async {
                              await FirebaseAuth.instance.signOut().then(
                                  (value) => Navigator.of(context)
                                      .pushAndRemoveUntil(
                                          MaterialPageRoute(
                                              builder: (context) => Login()),
                                          (route) => false));
                            },
                            icon: Icon(Icons.logout)),
                        Text("Logout"),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ]),
      body: ListView.separated(
        itemCount: forms.isEmpty ? 1 : forms.length,
        itemBuilder: (context, index) {
          if (forms.isEmpty) {
            return Text("ไม่พบข้อมูล");
          }

          return Row(
            children: [
              Row(
                children: [Icon(Icons.date_range_rounded)],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  //Icon(Icons.ac_unit),
                  Text("ชื่อ-นามสกุล : " + forms[index].form_name,
                      style: TextStyle(
                          color: Colors.grey[800],
                          fontWeight: FontWeight.bold,
                          fontSize: 18)),
                  Text("เบอร์โทรศัพท์ : " + forms[index].form_telnum),
                  Text("E-mail : " + forms[index].form_mail),
                  Text("วันที่จองคิว : " +
                      getTime(forms[index].form_resdate).toString()),
                  // Timestamp.fromDate(forms[index].form_resdate).toString(),
                  // Timestamp.fromDate(TimeOfDay.now()),
                ],
              ),
            ],
          );

          /*  return ListTile(
              title: Text(forms[index].form_name),
              subtitle: Text(forms[index].form_mail),
              leading: ConstrainedBox(
                constraints: BoxConstraints(
                  minWidth: 44,
                  minHeight: 44,
                  maxWidth: 55,
                  maxHeight: 55,
                ),
                //child: Image.asset(thing.image, fit: BoxFit.cover),
              ),
              onTap: () {
                /*Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ThingDetail(thing: thing)));*/
              },
            );*/
        },
        separatorBuilder: (BuildContext context, int index) {
          return Divider(
            color: Colors.black,
          );
        },
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
          index: 4,
        ),
      ),
    );
  }
}
