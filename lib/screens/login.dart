// ignore_for_file: camel_case_types, prefer_const_literals_to_create_immutables, prefer_const_constructors, duplicate_ignore

//import 'dart:html';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/authnetication/signInWithGoogle.dart';
import 'package:flutter_application_1/screens/homeScreen.dart';
import 'package:flutter_application_1/widget/customButton.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';

class loginScreen extends StatefulWidget {
  const loginScreen({Key? key}) : super(key: key);
  static String route = '/login';
  @override
  State<loginScreen> createState() => _loginScreenState();
}

class _loginScreenState extends State<loginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        child: Column(
          children: [
            Container(
              height: 400,
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/images/background.png'),
                    fit: BoxFit.fill),
              ),
              child: Stack(
                children: [
                  Positioned(
                    left: 30,
                    height: 200,
                    width: 80,
                    child: Container(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('assets/images/light-1.png'),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    left: 130,
                    height: 150,
                    width: 80,
                    child: Container(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('assets/images/light-2.png'),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    left: 300,
                    height: 200,
                    width: 80,
                    child: Container(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('assets/images/connect-icon1.png'),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    child: Center(
                      child: Container(
                        margin: EdgeInsets.only(top: 50),
                        child: Text(
                          "Login",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 40,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
            //buttons
            Container(
              margin: EdgeInsets.only(top: 50),
              child: Column(
                children: [
                  SignInButton(
                    Buttons.Google,
                    onPressed: () async {
                      bool res = await AuthMethods().signInWithGoogle();
                      if (res == true) {
                        Navigator.pushNamed(context, HomeScreen.route);
                      }
                    },
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  SignInButton(
                    Buttons.FacebookNew,
                    onPressed: () async {
                      bool res = await AuthMethods().signInWithGoogle();
                      if (res == true) {
                        Navigator.pushNamed(context, HomeScreen.route);
                      }
                    },
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  SignInButton(
                    Buttons.Apple,
                    onPressed: () async {
                      bool res = await AuthMethods().signInWithGoogle();
                      if (res == true) {
                        Navigator.pushNamed(context, HomeScreen.route);
                      }
                    },
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
