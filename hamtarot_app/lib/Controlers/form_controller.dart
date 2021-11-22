import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hamtarot_app/Services/form_services.dart';
import 'package:hamtarot_app/model/form_model.dart';

class FormController {
  final Services service;
  List<Formregis> forms = List.empty();

  StreamController<bool> onSyncController = StreamController();
  Stream<bool> get OnSync => onSyncController.stream;

  FormController(this.service);

  Future<List<Formregis>> fetchForms(String? email) async {
    onSyncController.add(true);
    forms = await service.getForms();
    onSyncController.add(false);
    return forms;
  }

  Future<void> addForm(String form_name, String form_telnum, String form_mail,
      Timestamp form_resdate) async {
    await service.addForms(form_name, form_telnum, form_mail, form_resdate);
  }
}
