import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/authnetication/signInWithGoogle.dart';
import 'package:flutter_application_1/widget/customButton.dart';

class settings extends StatelessWidget {
  const settings({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(
          backgroundImage: NetworkImage(AuthMethods().user.photoURL!),
        ),
        SizedBox(
          height: 10,
        ),
        Text(AuthMethods().user.displayName!),
        coustomButton(text: "LogOut", onpressed: AuthMethods().signOut),
      ],
    );
  }
}
