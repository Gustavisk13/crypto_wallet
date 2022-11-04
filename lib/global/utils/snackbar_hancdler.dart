import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SnackbarHandler {
  static GetSnackBar showSnackbarError(String message) {
    return GetSnackBar(
      title: 'Error',
      message: message,
      snackPosition: SnackPosition.TOP,
      backgroundColor: Colors.red,
      margin: EdgeInsets.all(10),
      borderRadius: 10,
      duration: Duration(seconds: 3),
      isDismissible: true,
      dismissDirection: DismissDirection.horizontal,
      forwardAnimationCurve: Curves.easeOutBack,
      icon: const Icon(
        Icons.error,
        color: Colors.white,
      ),
    );
  }
}
