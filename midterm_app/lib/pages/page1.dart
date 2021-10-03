import 'package:flutter/material.dart';
import 'package:midterm_app/models/form_model.dart';
import 'package:provider/provider.dart';

import 'page2.dart';

class FirstPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('กรอกข้อมูลเพื่อเริ่มการทำนาย'),
        centerTitle: true,
      ),
      body: MyCustomForm(),
    );
  }
}

class MyCustomForm extends StatefulWidget {
  @override
  _MyCustomFormState createState() => _MyCustomFormState();
}

class _MyCustomFormState extends State<MyCustomForm> {
  final _formKey = GlobalKey<FormState>();
  String? _firstName;
  String? _lastName;
  int? _age;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          TextFormField(
            decoration: InputDecoration(
              border: UnderlineInputBorder(),
              labelText: 'ชื่อ',
              icon: Icon(Icons.business),
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'กรุณาใส่ชื่อ';
              }

              return null;
            },
            onSaved: (value) {
              _firstName = value;
            },
            initialValue: context.read<FormModel>().firstName,
          ),
          TextFormField(
            decoration: InputDecoration(
              border: UnderlineInputBorder(),
              labelText: 'นามสกุล',
              icon: Icon(Icons.family_restroom),
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'กรุณาใส่นามสกุล';
              }

              return null;
            },
            onSaved: (value) {
              _lastName = value;
            },
            initialValue: context.read<FormModel>().lastName,
          ),
          TextFormField(
            decoration: InputDecoration(
              border: UnderlineInputBorder(),
              labelText: 'อายุ',
              icon: Icon(Icons.ring_volume),
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'กรุณาใส่อายุ';
              }

              if (int.parse(value) < 18) {
                return 'Please enter valid age';
              }

              return null;
            },
            onSaved: (value) {
              _age = int.parse(value!);
            },
            initialValue: context.read<FormModel>().age.toString(),
          ),
          ElevatedButton(
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                _formKey.currentState!.save();

                context.read<FormModel>().firstName = _firstName;
                context.read<FormModel>().lastName = _lastName;
                context.read<FormModel>().age = _age;

                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => SecondPage()));
              }
            },
            child: Text('Validate'),
          ),
        ],
      ),
    );
  }
}
