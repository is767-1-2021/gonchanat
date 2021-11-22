import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:hamtarot_app/model/form_model.dart';

abstract class Services {
  Future<List<Formregis>> getForms();
  final user = FirebaseAuth.instance.currentUser;
  Future<void> addForms(String form_name, String form_telnum, String form_mail,
      Timestamp form_resdate);
}

class firebaseService extends Services {
  @override
  Future<List<Formregis>> getForms() async {
    QuerySnapshot snapshot = await FirebaseFirestore.instance
        .collection('ham_form')
        //.where('id', isGreaterThan: 2)
        .where('form_mail', isEqualTo: user!.email)
        //.where('form_telnum', isEqualTo: '1122334455')
        // .orderBy('form_resdate')
        .get();

    AllForms forms = AllForms.fromsnapshot(snapshot);
    return forms.forms;
  }

  @override
  Future<void> addForms(String form_name, String form_telnum, String form_mail,
      Timestamp form_resdate) async {
    CollectionReference addForms =
        FirebaseFirestore.instance.collection('ham_form');
    //firebaseService auth = firebaseService.instance;
    //String uid = auth.currentUser.uid.toString();
    addForms.add({
      'form_name': form_name,
      'form_telnum': form_telnum,
      'form_mail': form_mail,
      'form_resdate': form_resdate
    });
    return;
  }
}
