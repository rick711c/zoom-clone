// ignore_for_file: prefer_const_constructors

//import 'dart:js';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/authnetication/signInWithGoogle.dart';
import 'package:flutter_application_1/screens/homeScreen.dart';
import 'package:flutter_application_1/screens/login.dart';
import 'package:flutter_application_1/screens/video_call_screen.dart';

import 'package:flutter_application_1/utls/colors.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get/get.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
    // ignore: unnecessary_new
    new GetMaterialApp(
      theme: ThemeData.light(),
      routes: {
        loginScreen.route: (context) => loginScreen(),
        HomeScreen.route: (context) => HomeScreen(),
        videoCallScreen.route: (context) => videoCallScreen(),
      },
      home: StreamBuilder(
        stream: AuthMethods().authChanges,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          if (snapshot.hasData) {
            return const HomeScreen();
          }
          return const loginScreen();
        },
      ),
    ),
  );
}
