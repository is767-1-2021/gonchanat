import 'package:cloud_firestore/cloud_firestore.dart';

class Formregis {
  //final int id;
  final String form_name;
  final String form_telnum;
  final String form_mail;
  final Timestamp form_resdate;

  Formregis(
      this.form_name, this.form_telnum, this.form_mail, this.form_resdate);

  factory Formregis.fromJson(
    Map<String, dynamic> json,
  ) {
    return Formregis(
      // json['id'] as int,
      json['form_name'] as String,
      json['form_telnum'] as String,
      json['form_mail'] as String,
      json['form_resdate'] as Timestamp,
    );
  }
}

class AllForms {
  final List<Formregis> forms;
  AllForms(this.forms);

  factory AllForms.fromJson(List<dynamic> json) {
    List<Formregis> forms;

    forms = json.map((index) => Formregis.fromJson(index)).toList();
    return AllForms(forms);
  }

  factory AllForms.fromsnapshot(QuerySnapshot s) {
    List<Formregis> forms = s.docs.map((DocumentSnapshot ds) {
      return Formregis.fromJson(ds.data() as Map<String, dynamic>);
    }).toList();
    return AllForms(forms);
  }
}
