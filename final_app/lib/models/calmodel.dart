import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Cal {
  final String answer;
  final Timestamp historydate;

  Cal(this.answer, this.historydate);

  factory Cal.fromJson(
    Map<String, dynamic> json,
  ) {
    return Cal(
      json['answer'] as String,
      json['historydate'] as Timestamp,
    );
  }
}

class AllCal {
  final List<Cal> cal;
  AllCal(this.cal);

  factory AllCal.fromJson(List<dynamic> json) {
    List<Cal> cal;

    cal = json.map((index) => Cal.fromJson(index)).toList();

    return AllCal(cal);
  }

  factory AllCal.formSnapshot(QuerySnapshot s) {
    List<Cal> cal = s.docs.map((DocumentSnapshot ds) {
      return Cal.fromJson(ds.data() as Map<String, dynamic>);
    }).toList();

    return AllCal(cal);
  }
}

class CalProvider with ChangeNotifier {
  String? _answer;
  get answer => _answer;
  set answer(value) {
    this._answer = value;
    notifyListeners();
  }
}
