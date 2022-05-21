import 'package:flutter/material.dart';
import 'package:get/get.dart';

showSnackbar(
  String title,
  String text,
  Color color,
) {
  Get.snackbar(title, text,
      snackPosition: SnackPosition.BOTTOM, backgroundColor: color);
}
