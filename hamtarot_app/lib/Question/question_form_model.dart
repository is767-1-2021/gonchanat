import 'package:flutter/material.dart';

class QuestionFormmodel extends ChangeNotifier {
  String? _name;
  String? _question;

  get name => this._name;
  set name(value) {
    this._name = value;
    notifyListeners();
    }

  get question => this._question;
  set question(value) {
    this._question = value;
    notifyListeners();
    }
}