import 'package:flutter/material.dart';
import 'package:midterm_app/models/form_model.dart';
import 'package:provider/provider.dart';

class FourthPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Fourth Page'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(children: [
          Padding(
            padding: EdgeInsets.all(20.0),
            child: Consumer<FormModel>(
              builder: (context, form, child) {
                return Text('${form.firstName} ${form.lastName} ${form.age}');
              },
            ),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pushNamed(context, '/2');
            },
            child: Text('Fill this form please'),
          ),
        ]),
      ),
    );
  }
}
