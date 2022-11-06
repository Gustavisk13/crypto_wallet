// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:get/get.dart';

// Project imports:
import 'package:crypto_wallet/global/common/components/default_button_component.dart';
import 'package:crypto_wallet/global/common/components/default_input_component.dart';
import 'package:crypto_wallet/global/common/components/default_title_component.dart';
import 'package:crypto_wallet/global/utils/styles.dart';
import 'package:crypto_wallet/modules/profile/controllers/contact_form_controller.dart';

class ContactFormView extends StatelessWidget {
  const ContactFormView({super.key});

  @override
  Widget build(BuildContext context) {
    ContactFormController contactFormController =
        Get.find<ContactFormController>();
    return Obx(() => SafeArea(
            child: Scaffold(
          backgroundColor: baseColor,
          appBar: AppBar(
            centerTitle: true,
            title: const DefaultTitleComponent(
              title: 'Contato',
              textAlign: TextAlign.center,
            ),
            backgroundColor: baseColor2,
            shape: Border(
              bottom: BorderSide(
                color: secondaryColor,
                width: 2,
              ),
            ),
            iconTheme: IconThemeData(
              color: secondaryColor,
            ),
          ),
          body: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Form(
              key: contactFormController.formKey,
              child: Column(
                children: [
                  contactFormController.isLoading.value
                      ? const Center(
                          child: CircularProgressIndicator(),
                        )
                      : Container(),
                  const SizedBox(
                    height: 20,
                  ),
                  const DefaultTitleComponent(title: 'Send us a message '),
                  const SizedBox(
                    height: 20,
                  ),
                  DefaultInputComponent(
                      enableSuffixIcon: false,
                      validated: true,
                      controller: contactFormController.nameController,
                      label: 'Name',
                      hintText: 'Name',
                      keyboardType: TextInputType.name,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your name';
                        }
                        return null;
                      }),
                  const SizedBox(
                    height: 22,
                  ),
                  DefaultInputComponent(
                      enableSuffixIcon: false,
                      validated: true,
                      controller: contactFormController.emailController,
                      label: 'Email',
                      hintText: 'Email',
                      keyboardType: TextInputType.name,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your email';
                        }
                        return null;
                      }),
                  const SizedBox(
                    height: 22,
                  ),
                  DefaultInputComponent(
                      enableSuffixIcon: false,
                      validated: true,
                      controller: contactFormController.messageController,
                      label: 'Mensagem',
                      hintText: 'Mensagem',
                      keyboardType: TextInputType.name,
                      textInputAction: TextInputAction.newline,
                      maxLines: 10,
                      minLines: 10,
                      validator: (value) {
                        if (value.length > 10) {
                          return 'Please enter a message with less than 250 characters';
                        }
                        return null;
                      }),
                  const SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                      width: 250,
                      height: 50,
                      child: DefaultButtonComponent(
                          toggleBorders: false,
                          onPressed: () {},
                          child: const Text('Send')))
                ],
              ),
            ),
          ),
        )));
  }
}
