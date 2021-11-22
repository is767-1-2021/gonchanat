import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:hamtarot_app/Login/model.dart';
import 'package:provider/provider.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _formKey = GlobalKey<FormState>();
  final _auth = FirebaseAuth.instance;
  bool showProgress = false;
  String? email, password, username;
  TextEditingController userNameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool _validateemail = false;
  bool _validatepassword = false;
  @override
  void dispose() {
    userNameController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Scaffold(
        backgroundColor: Colors.brown[600],
        // appBar: AppBar(
        //   title: Text("Firebase Authentication"),
        // ),
        body: SingleChildScrollView(
          padding: EdgeInsets.only(top: 80.0),
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image.asset(
                'assets/icon.png',
                width: 280,
                height: 320,
              ),
              Text(
                "Sign in to allow your horoscope !",
                style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 18.0,
                    color: Colors.amber),
              ),
              SizedBox(
                height: 20.0,
              ),
              Container(
                width: 330,
                child: TextField(
                    controller: userNameController,
                    textAlign: TextAlign.center,
                    onChanged: (value) {
                      email = value;
                    }, // get value from TextField
                    decoration: InputDecoration(
                        hintText: "Enter your Email",
                        filled: true,
                        fillColor: const Color(0xFFFFF8E1),
                        errorStyle:
                            TextStyle(fontSize: 12.0, color: Colors.amber),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(32.0)),
                        ),
                        errorText: _validateemail
                            ? 'Please enter your email.'
                            : null)),
              ),
              SizedBox(
                height: 20.0,
              ),
              Container(
                width: 330,
                child: TextField(
                  controller: passwordController,
                  textAlign: TextAlign.center,
                  onChanged: (value) {
                    password = value; //get value from textField
                  },
                  decoration: InputDecoration(
                      hintText: "Enter your Password",
                      filled: true,
                      fillColor: const Color(0xFFFFF8E1),
                      errorStyle:
                          TextStyle(fontSize: 12.0, color: Colors.amber),
                      border: OutlineInputBorder(
                          borderRadius:
                              BorderRadius.all(Radius.circular(32.0))),
                      errorText: _validatepassword
                          ? 'Please enter your password.'
                          : null),
                  obscureText: true,
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    width: 120,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Colors.amber,
                        elevation: 5,
                        shape: new RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(32.0),
                        ),
                      ),
                      onPressed: () async {
                        setState(() {
                          passwordController.text.isEmpty
                              ? _validatepassword = true
                              : _validatepassword = false;
                          userNameController.text.isEmpty
                              ? _validateemail = true
                              : _validateemail = false;
                        });
                        if ((_formKey.currentState!.validate())) {
                          _formKey.currentState!.save();
                          context.read<Loginmodel>().email = email;
                          try {
                            final newUser =
                                await _auth.signInWithEmailAndPassword(
                                    email: email!, password: password!);
                            print(newUser.toString());
                            await Navigator.pushNamed(context, '/1');
                          } on FirebaseAuthException catch (e) {
                            if (e.code == 'user-not-found') {
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(SnackBar(
                                content: Text('email and password incorrect'),
                              ));
                            } else if (e.code == 'wrong-password') {
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(SnackBar(
                                content: Text('email and password incorrect'),
                              ));
                            }
                          }
                        }
                      },
                      child: Text(
                        "Sign in",
                        style: TextStyle(
                            fontWeight: FontWeight.w500, fontSize: 18.0),
                      ),
                    ),
                  ),
                  Container(
                    width: 120,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Colors.amber,
                        elevation: 5,
                        shape: new RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(32.0),
                        ),
                      ),
                      onPressed: () {
                        Navigator.pushNamed(context, '/13');
                      },
                      child: Text(
                        "Sign up",
                        style: TextStyle(
                            fontWeight: FontWeight.w500, fontSize: 18.0),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
