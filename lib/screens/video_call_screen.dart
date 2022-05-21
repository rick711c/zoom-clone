// ignore_for_file: camel_case_types, prefer_const_constructors

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/authnetication/signInWithGoogle.dart';
import 'package:flutter_application_1/utls/colors.dart';
import 'package:flutter_application_1/utls/jitsi_meeting_methods.dart';
import 'package:flutter_application_1/widget/meeting_options.dart';
import 'package:jitsi_meet/jitsi_meet.dart';

class videoCallScreen extends StatefulWidget {
  const videoCallScreen({Key? key}) : super(key: key);
  static String route = '/videoCallScreen';

  @override
  State<videoCallScreen> createState() => _videoCallScreenState();
}

class _videoCallScreenState extends State<videoCallScreen> {
  late TextEditingController meetingIdController;
  late TextEditingController nameController;
  final AuthMethods _authMethods = AuthMethods();
  bool isAudioMuted = true;
  bool isVideoMuted = true;
  final JitsiMeetMethods _jitsiMeetMethods = JitsiMeetMethods();
  _joinMeeting() {
    _jitsiMeetMethods.createMeeting(
      roomName: meetingIdController.text,
      isAudioMuted: isAudioMuted,
      isVideoMuted: isVideoMuted,
      username: nameController.text,
    );
  }

  createNewMeeting() async {
    var random = Random();
    String roomName = (random.nextInt(10000000) + 10000000).toString();
    _jitsiMeetMethods.createMeeting(
        roomName: roomName, isAudioMuted: true, isVideoMuted: true);
  }

  @override
  void initState() {
    meetingIdController = TextEditingController();
    nameController = TextEditingController(text: _authMethods.user.displayName);

    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    meetingIdController.dispose();
    nameController.dispose();
    JitsiMeet.removeAllListeners();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: backgroundColor,
        title: const Text(
          "Join a Meeting",
          style: TextStyle(
              fontSize: 18, color: Colors.black, fontWeight: FontWeight.bold),
        ),
        elevation: 0,
        centerTitle: true,
      ),
      body: Column(
        children: [
          SizedBox(
            height: 60,
            child: TextField(
              //meeting id
              maxLines: 1,
              textAlign: TextAlign.center,
              keyboardType: TextInputType.number,
              controller: meetingIdController,
              decoration: const InputDecoration(
                fillColor: secondaryBackgroundColor,
                filled: true,
                hintText: "Room ID: ",
              ),
            ),
          ),
          SizedBox(
            //name
            child: TextField(
              maxLines: 1,
              textAlign: TextAlign.center,
              keyboardType: TextInputType.name,
              controller: nameController,
              decoration: const InputDecoration(
                fillColor: secondaryBackgroundColor,
                filled: true,
                hintText: "Name",
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          ElevatedButton(
            onPressed: _joinMeeting,
            child: Text(
              "join",
              style: TextStyle(fontSize: 16),
            ),
            style: ElevatedButton.styleFrom(primary: buttonColor),
          ),
          SizedBox(
            height: 40,
          ),
          MeetingOptions(
            text: 'Turn off audio',
            isMute: isAudioMuted,
            onchange: onAudioMuted,
          ),
          MeetingOptions(
            text: 'Turn off video',
            isMute: isVideoMuted,
            onchange: onVideoMuted,
          ),
        ],
      ),
    );
  }

  onAudioMuted(bool val) {
    setState(() {
      isAudioMuted = val;
    });
  }

  onVideoMuted(bool val) {
    setState(() {
      isVideoMuted = val;
    });
  }
}
