// ignore_for_file: unused_import, avoid_web_libraries_in_flutter, file_names

//import 'dart:html';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/utls/utls.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthMethods {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  Stream<User?> get authChanges => _auth.authStateChanges();
  final GoogleSignIn googleSignIn = GoogleSignIn();
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  User get user => _auth.currentUser!;
  Future<bool> signInWithGoogle() async {
    bool res = false;
    try {
      //signin with google
      final GoogleSignInAccount? googleUser = await googleSignIn.signIn();
      final GoogleSignInAuthentication googleAuth =
          await googleUser!.authentication;
      //getting credentials for firebase
      final credential = GoogleAuthProvider.credential(
          idToken: googleAuth.idToken, accessToken: googleAuth.accessToken);
      //signin with the credentials in our app
      final UserCredential userCredential =
          await _auth.signInWithCredential(credential);
      User? user = userCredential.user;
      //storing user details to firebase
      if (user != null) {
        if (userCredential.additionalUserInfo!.isNewUser) {
          _firestore.collection('users').doc(user.uid).set({
            'userName': user.displayName,
            'userId': user.uid,
            'profilePic': user.photoURL,
            'phoneNumber': user.phoneNumber,
          });
        }
      }
      res = true;
      showSnackbar(
          "Welcome!", AuthMethods().user.displayName!, Colors.greenAccent);
    } on FirebaseAuthException catch (e) {
      showSnackbar("error!", e.message!, Colors.redAccent);
      res = false;
    }
    return res;
  }

  void signOut() async {
    try {
      _auth.signOut();
    } catch (e) {
      print(e);
    }
  }
}
