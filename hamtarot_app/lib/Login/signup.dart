import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hamtarot_app/Login/model.dart';
import 'package:provider/provider.dart';

class Signup extends StatefulWidget {
  @override
  _SignupState createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  final _formKey = GlobalKey<FormState>();
  final _auth = FirebaseAuth.instance;
  bool showProgress = false;
  String? email, password, username;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool _validateemail = false;
  bool _validatepassword = false;
  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Scaffold(
        appBar: AppBar(
          title: Text("Sing up"),
        ),
        body: SingleChildScrollView(
          padding: EdgeInsets.only(top: 15.0),
          child: Center(
            child: Column(
              children: <Widget>[
                Image.asset(
                  'assets/icon.png',
                  width: 280,
                  height: 320,
                ),
                Text(
                  "Sing up to Hamtarot",
                  style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 18.0,
                      color: Colors.brown[600]),
                ),
                SizedBox(
                  height: 20.0,
                ),
                Container(
                  width: 330,
                  child: TextField(
                      controller: emailController,
                      textAlign: TextAlign.center,
                      onChanged: (value) {
                        email = value;
                      }, // get value from TextField
                      decoration: InputDecoration(
                          hintText: "Enter your Email",
                          border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(32.0))),
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
                Material(
                  elevation: 5,
                  color: Colors.amber,
                  borderRadius: BorderRadius.circular(32.0),
                  child: Column(
                    children: [
                      MaterialButton(
                        onPressed: () async {
                          setState(() {
                            passwordController.text.isEmpty
                                ? _validatepassword = true
                                : _validatepassword = false;
                            emailController.text.isEmpty
                                ? _validateemail = true
                                : _validateemail = false;
                          });
                          if ((_formKey.currentState!.validate())) {
                            _formKey.currentState!.save();
                            context.read<Loginmodel>().email = email;

                            try {
                              final newUser = await _auth
                                ..createUserWithEmailAndPassword(
                                    email: email!, password: password!);
                              print(newUser.toString());
                              await Navigator.pushNamed(context, '/1');
                            } catch (e) {}
                          }
                        },
                        minWidth: 200.0,
                        height: 45.0,
                        child: Text(
                          "Sing up",
                          style: TextStyle(
                              fontWeight: FontWeight.w500, fontSize: 18.0),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
