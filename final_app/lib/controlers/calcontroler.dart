import 'dart:async';

import 'package:final_app2/models/calmodel.dart';
import 'package:final_app2/services/calservice.dart';

class CalController {
  final Services service;
  List<Cal> cal = List.empty();

  StreamController<bool> onSyncController =
      StreamController(); // checking status stream onsync (on process / finish)
  Stream<bool> get onSync => onSyncController.stream;

  CalController(this.service);

  Future<List<Cal>> fectcal() async {
    onSyncController.add(true); // stream connected
    cal = await service.getcal();
    onSyncController.add(false); // stop connected
    return cal;
  }
}
