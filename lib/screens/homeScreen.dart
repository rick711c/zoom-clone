import 'package:flutter/material.dart';
import 'package:flutter_application_1/authnetication/signInWithGoogle.dart';
import 'package:flutter_application_1/screens/history_meeting_screen.dart';
import 'package:flutter_application_1/screens/settings.dart';

import 'package:flutter_application_1/utls/colors.dart';
import 'package:flutter_application_1/widget/customButton.dart';
import 'package:flutter_application_1/widget/home_meeting_button.dart';

import 'createMeetingScreen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);
  static String route = '/HomeScreen';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _page = 0;
  onPageChanged(int page) {
    setState(() {
      _page = page;
    });
  }

  List<Widget> pages = [
    MeetingScreen(),
    const HistoryMeetingScreen(),
    const Text("contacts"),
    const settings(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: backgroundColor,
        title: const Text(
          "Meet & chat",
          style: TextStyle(color: Colors.black),
        ),
        elevation: 0,
        centerTitle: true,
      ),
      bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          currentIndex: _page,
          backgroundColor: footerColor,
          selectedItemColor: buttonColor,
          unselectedItemColor: Colors.white,
          onTap: onPageChanged,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.comment_bank),
              label: "Meet & chat",
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.lock_clock,
              ),
              label: "Meettings",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person_outline),
              label: "contacts",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.settings_outlined),
              label: "settings",
            ),
          ]),
      body: pages[_page],
    );
  }
}

class NewMeetingScreen extends StatelessWidget {
  const NewMeetingScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            HomeMeetingButton(
              text: "New Meeting",
              icon: Icons.videocam,
              onPressed: () {},
            ),
            HomeMeetingButton(
              text: "join Meeting",
              icon: Icons.add_box_rounded,
              onPressed: () {},
            ),
            HomeMeetingButton(
              text: "schedule Meeting",
              icon: Icons.calendar_today,
              onPressed: () {},
            ),
            HomeMeetingButton(
              text: "share screen",
              icon: Icons.arrow_upward,
              onPressed: () {},
            ),
          ],
        )
      ],
    );
  }
}
