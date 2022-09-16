import 'package:crypto_wallet/src/view/home.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  var forgotPassword = false.obs;
  var passwordVisible = true.obs;
  var validateUserInput = true.obs;
  var validatePasswordInput = true.obs;

  final TextEditingController textUsernameController = TextEditingController();
  final TextEditingController textPasswordController = TextEditingController();

  validateLogin(String username, String password) {
    if (username == 'admin' && password == 'admin') {
      Get.to(() => const HomeView());
    } else {
      Get.snackbar('Error', 'Invalid username or password');
    }
  }

  validateLoginInputs(String username, String password) {
    if (username.isEmpty) {
      validateUserInput.value = false;
    } else {
      validateUserInput.value = true;
    }
    if (password.isEmpty) {
      validatePasswordInput.value = false;
    } else {
      validatePasswordInput.value = true;
    }
  }

  bool isFilled(String value) {
    return value.isNotEmpty;
  }
}
