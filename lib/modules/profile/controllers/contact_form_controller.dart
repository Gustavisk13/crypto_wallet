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
}
