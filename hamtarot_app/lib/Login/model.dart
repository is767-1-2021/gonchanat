import 'package:flutter/cupertino.dart';

class Loginmodel extends ChangeNotifier {
  String? _name;
  String? number;
  String? _email;

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

  get email => this._email;
  set email(value) {
    this._email = value;
    notifyListeners();
  }
}
