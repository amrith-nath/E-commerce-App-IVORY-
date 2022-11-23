import 'package:flutter/material.dart';
import 'package:get/get.dart';

kSnackBar(
  String head,
  String content, {
  IconData? icon,
  Color? bgColor,
}) =>
    Get.snackbar(
      head,
      content,
      snackPosition: SnackPosition.BOTTOM,
      icon: Icon(
        icon ?? Icons.error,
        color: Colors.white,
      ),
      backgroundColor: bgColor ?? Colors.red,
      colorText: Colors.white,
      borderRadius: 5,
      margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
      forwardAnimationCurve: Curves.easeInToLinear,
      reverseAnimationCurve: Curves.fastOutSlowIn,
    );
