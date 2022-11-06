// Flutter imports:
import 'package:flutter/widgets.dart';

// Package imports:
import 'package:get/get.dart';

class ContactFormController extends GetxController {
  var nameController = TextEditingController();
  var emailController = TextEditingController();
  var messageController = TextEditingController();
  var formKey = GlobalKey<FormState>();

  var isLoading = false.obs;
  var isMailLoading = false.obs;

  String name = '';
  String email = '';
  String message = '';

  var validateUserInput = true.obs;
  var validateEmailInput = true.obs;
  var validateMessageInput = true.obs;

  validateInput(String value, String type) {
    if (type == 'name') {
      if (value.isEmpty) {
        validateUserInput.value = false;
      } else {
        validateUserInput.value = true;
      }
    } else if (type == 'email') {
      if (value.isEmpty) {
        validateEmailInput.value = false;
      } else {
        validateEmailInput.value = true;
      }
    } else if (type == 'message') {
      if (value.isEmpty) {
        validateMessageInput.value = false;
      } else {
        validateMessageInput.value = true;
      }
    }
  }
}
