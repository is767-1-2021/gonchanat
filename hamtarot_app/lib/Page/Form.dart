import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:hamtarot_app/Form/datetime_picker_formfield.dart';
import 'package:hamtarot_app/Form/email_validator.dart';
import 'package:hamtarot_app/HomePage.dart';
import 'package:hamtarot_app/model/DataFormModel.dart';
import 'package:intl/intl.dart'; // DateFormat
import 'package:provider/provider.dart'; //read model
//import 'package:flutter/services.dart';

class FormPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('จองคิวดูดวง'),
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => MyHomePage(),
                  ),
                );
              },
              icon: Icon(Icons.home)),
        ],
      ),
      body: BookingForm(),
      bottomNavigationBar: //BottomHome(),
          SingleChildScrollView(
        child: CurvedNavigationBar(
          color: Color(0xFF6d4c41),
          backgroundColor: Color(0xFFFFF8E1),
          buttonBackgroundColor: Color(0xFF6d4c41),
          height: 50,
          items: <Widget>[
            IconButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/3');
                },
                icon: Icon(Icons.crop_portrait, size: 30, color: Colors.black)),
            IconButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/4');
                },
                icon: Icon(Icons.amp_stories_rounded,
                    size: 30, color: Colors.black)),
            IconButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/5');
                },
                icon: Icon(Icons.quiz, size: 30, color: Colors.black)),
            IconButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/6');
                },
                icon:
                    Icon(Icons.battery_unknown, size: 30, color: Colors.black)),
            IconButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/2');
                },
                icon: Icon(Icons.date_range_rounded,
                    size: 30, color: Colors.black)),
            IconButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/9');
                },
                icon: Icon(Icons.account_balance_rounded,
                    size: 30, color: Colors.black)),
          ],
          // animationDuration: Duration(milliseconds: 200),
          index: 4,
        ),
      ),
    );
  }
}

class BookingForm extends StatefulWidget {
  @override
  _BookingFormState createState() => _BookingFormState();
}

class _BookingFormState extends State<BookingForm> {
  //TextEditingController _controller = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  final format2 = DateFormat("yyyy-MM-dd HH:mm");
  String? _name;
  String? _telnum;
  String? _mail;
  DateTime? _resdate;
  DateTime? value;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            TextFormField(
              decoration: InputDecoration(
                border: UnderlineInputBorder(),
                labelText: 'ชื่อ-นามสกุล',
                icon: Icon(Icons.people),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'กรุณาระบุชื่อ-นามสกุล';
                }
                return null;
              },
              onSaved: (value) {
                _name = value;
              },
              // initialValue: context.read<DataFormModel>().Name,
            ),
            TextFormField(
              decoration: InputDecoration(
                border: UnderlineInputBorder(),
                labelText: 'เบอร์โทรศัพท์',
                icon: Icon(Icons.phone),
              ),
              keyboardType: TextInputType.number,
              maxLength: 10,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'กรุณาระบุเบอร์โทรศัพท์';
                } else if (value.length < 10) {
                  return 'คุณระบุเบอร์โทรศัพท์ไม่ครบ';
                }
                return null;
              },
              onSaved: (value) {
                _telnum = value;
              },
              // initialValue: context.read<DataFormModel>().telnum,
            ),
            TextFormField(
              //controller: _controller,
              decoration: InputDecoration(
                border: UnderlineInputBorder(),
                labelText: 'E-mail',
                icon: Icon(Icons.email),
                hintText: 'ตัวอย่าง email@tu.com',
                // hintStyle: TextStyle(color: Colors.black45),
                // errorStyle: TextStyle(color: Colors.redAccent),
                // prefixIcon: Icon(Icons.event_note),
                //  suffixIcon: IconButton(
                //    onPressed: () => _controller.clear(),
                //    icon: Icon(Icons.clear),
                //  ),
              ),
              validator: (email) =>
                  email != null && !EmailValidator.validate(email)
                      ? 'กรุณาระบุ E-mail ไม่ถูกต้อง'
                      : null,
              onSaved: (value) {
                _mail = value;
              },
              //   initialValue: context.read<DataFormModel>().mail,
            ),
            DateTimeField(
              decoration: const InputDecoration(
                border: UnderlineInputBorder(),
                labelText: 'เลือกวันเวลาที่ต้องการ',
                icon: Icon(Icons.event_note),
              ),
              format: format2,
              onShowPicker: (context, currentValue) async {
                final date = await showDatePicker(
                    context: context,
                    firstDate: DateTime(2000),
                    initialDate: currentValue ?? DateTime.now(),
                    lastDate: DateTime(2100));

                if (date != null) {
                  final time = await showTimePicker(
                    context: context,
                    initialTime:
                        TimeOfDay.fromDateTime(currentValue ?? DateTime.now()),
                    builder: (context, child) => MediaQuery(
                        data: MediaQuery.of(context)
                            .copyWith(alwaysUse24HourFormat: true),
                        child: child!),
                  );

                  return DateTimeField.combine(date, time);
                } else {
                  return currentValue;
                }
              },
              validator: (value) {
                if (value == null) {
                  return 'กรุณาระบุ วันเวลาที่ต้องการ';
                }
                return null;
              },
              onSaved: (value) => _resdate = value,
              // initialValue: context.read<DataFormModel>().resdate,
            ),
            Row(
              children: <Widget>[
                Expanded(
                  flex: 2,
                  child: ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        _formKey.currentState!.save();

                        context.read<DataFormModel>().Name = _name;
                        context.read<DataFormModel>().telnum = _telnum;
                        context.read<DataFormModel>().mail = _mail;
                        context.read<DataFormModel>().resdate = _resdate;
                        Navigator.pushNamed(context, '/7');
                      }
                    },
                    child: const Text('ลงนัดหมาย'),
                  ),
                ),
              ],
            ),
            Row(
              children: <Widget>[
                Expanded(
                  flex: 2,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.red, // background
                      onPrimary: Colors.white, // foreground
                    ),
                    onPressed: () {
                      showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: Text('จะลบใช่มั้ย'),
                              content: Text('ข้อมูลที่คุณกรอกจะโดนลบ'),
                              actions: <Widget>[
                                TextButton(
                                  onPressed: () {
                                    _formKey.currentState!.reset();
                                    Navigator.pop(context);
                                  },
                                  child: Text('ล้างข้อมูล'),
                                ),
                                TextButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  child: Text('ยกเลิก'),
                                ),
                              ],
                            );
                          });
                    },
                    child: Text('ล้างข้อมูล'),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
