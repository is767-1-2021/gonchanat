import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:final_app2/models/calmodel.dart';

abstract class Services {
  Future<List<Cal>> getcal();
}

class CalServices extends Services {
  @override
  Future<List<Cal>> getcal() async {
    QuerySnapshot snapshot = // read DB
        await FirebaseFirestore.instance
            .collection('cal_history')
            //  .where('id',isGreaterThan: 1) // select data
            .get();

    AllCal cal = AllCal.formSnapshot(snapshot);
    return cal.cal;
  }
}
