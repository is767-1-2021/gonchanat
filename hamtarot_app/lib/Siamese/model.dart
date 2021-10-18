import 'package:flutter/cupertino.dart';

class Namemodel extends ChangeNotifier {
  String? _name;
  String? number;


  get Name => this._name;

  set Name(value) {
    this._name = value;
    notifyListeners();
  }

  get Number => this.number;

  set Number(value) {
    this.number = value;
    notifyListeners();
  }

}