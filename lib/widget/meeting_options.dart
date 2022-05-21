import 'package:flutter/material.dart';
import 'package:flutter_application_1/utls/colors.dart';

class MeetingOptions extends StatelessWidget {
  final String text;
  final bool isMute;
  final Function(bool) onchange;
  const MeetingOptions(
      {Key? key,
      required this.text,
      required this.isMute,
      required this.onchange})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      color: secondaryBackgroundColor,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            text,
            style: TextStyle(fontSize: 16),
          ),
          Switch(value: isMute, onChanged: onchange)
        ],
      ),
    );
  }
}
