import 'package:flutter/material.dart';
import 'package:hamtarot_app/Login/auth_page.dart';

class SignUpWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Stack(
        fit: StackFit.expand,
        children: [
          // CustomPaint(painter: BackgroundPainter()),
          buildSignUp(context),
        ],
      );

  Widget buildSignUp(BuildContext context) => Column(
        children: [
          Spacer(),
          Align(
            alignment: Alignment.centerLeft,
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 20),
              width: 175,
              child: Text(
                'Welcome Back To MyApp',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          Spacer(),
          Text('Login to continue'),
          SizedBox(height: 12),
          OutlineButton(
            child: Text('Sign In'),
            padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            highlightedBorderColor: Colors.black,
            borderSide: BorderSide(color: Colors.black),
            textColor: Colors.black,
            onPressed: () => Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => AuthPage()),
            ),
          ),
          SizedBox(height: 12),
          //GoogleSignupButtonWidget(),
          Spacer()
        ],
      );
}
