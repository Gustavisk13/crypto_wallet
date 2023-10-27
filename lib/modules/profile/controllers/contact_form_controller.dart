// Flutter imports:
import 'package:flutter/widgets.dart';

// Package imports:

class ContactFormController {
  var nameController = TextEditingController();
  var emailController = TextEditingController();
  var messageController = TextEditingController();
  var formKey = GlobalKey<FormState>();

  var isLoading = false;
  var isMailLoading = false;

  String name = '';
  String email = '';
  String message = '';

  var validateUserInput = true;
  var validateEmailInput = true;
  var validateMessageInput = true;

  validateInput(String value, String type) {
    if (type == 'name') {
      if (value.isEmpty) {
        validateUserInput = false;
      } else {
        validateUserInput = true;
      }
    } else if (type == 'email') {
      if (value.isEmpty) {
        validateEmailInput = false;
      } else {
        validateEmailInput = true;
      }
    } else if (type == 'message') {
      if (value.isEmpty) {
        validateMessageInput = false;
      } else {
        validateMessageInput = true;
      }
    }
  }
}
