import 'package:flutter/material.dart';

class DataFormModel extends ChangeNotifier {
  String? _Name;
  String? _telnum;
  String? _mail;
  DateTime? _resdate;

  get Name => this._Name;

  set Name(value) {
    this._Name = value;
    notifyListeners();
  }

  get telnum => this._telnum;

  set telnum(value) {
    this._telnum = value;
    notifyListeners();
  }

  get mail => this._mail;

  set mail(value) {
    this._mail = value;
    notifyListeners();
  }

  get resdate => this._resdate;

  set resdate(value) {
    this._resdate = value;
    notifyListeners();
  }
}
