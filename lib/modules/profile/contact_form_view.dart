// Flutter imports:

// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:get/get.dart';

// Project imports:
import 'package:crypto_wallet/global/common/components/default_button_component.dart';
import 'package:crypto_wallet/global/common/components/default_input_component.dart';
import 'package:crypto_wallet/global/common/components/default_title_component.dart';
import 'package:crypto_wallet/global/common/components/loading_component.dart';
import 'package:crypto_wallet/global/utils/snackbar_hancdler.dart';
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
          resizeToAvoidBottomInset: false,
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
                  const SizedBox(
                    height: 20,
                  ),
                  const DefaultTitleComponent(title: 'Send us a message '),
                  const SizedBox(
                    height: 20,
                  ),
                  DefaultInputComponent(
                      enableSuffixIcon: false,
                      validated: contactFormController.validateUserInput.value,
                      controller: contactFormController.nameController,
                      label: 'Name',
                      hintText: 'Name',
                      keyboardType: TextInputType.name,
                      onFieldSubmitted: (value) {
                        contactFormController.validateInput(value, 'name');
                        contactFormController.name = value;
                      },
                      errorText: 'Name cannot be empty',
                      onChanged: (value) {
                        contactFormController.validateInput(value, 'name');
                        contactFormController.name = value;
                      },
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
                      validated: contactFormController.validateEmailInput.value,
                      controller: contactFormController.emailController,
                      label: 'Email',
                      hintText: 'Email',
                      keyboardType: TextInputType.name,
                      onFieldSubmitted: (value) {
                        contactFormController.validateInput(value, 'email');
                        contactFormController.email = value;
                      },
                      onChanged: (value) {
                        contactFormController.validateInput(value, 'email');
                        contactFormController.email = value;
                      },
                      errorText: 'Email cannot be empty',
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
                      validated:
                          contactFormController.validateMessageInput.value,
                      controller: contactFormController.messageController,
                      label: 'Mensagem',
                      hintText: 'Mensagem',
                      keyboardType: TextInputType.name,
                      textInputAction: TextInputAction.newline,
                      maxLines: 10,
                      minLines: 10,
                      onFieldSubmitted: (value) {
                        contactFormController.validateInput(value, 'message');
                        contactFormController.message = value;
                      },
                      onChanged: (value) {
                        contactFormController.validateInput(value, 'message');
                        contactFormController.message = value;
                      },
                      errorText: 'Message cannot be empty',
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
                          onPressed: () async {
                            if (contactFormController
                                    .nameController.text.isEmpty ||
                                contactFormController
                                    .emailController.text.isEmpty ||
                                contactFormController
                                    .messageController.text.isEmpty) {
                              Get.showSnackbar(
                                  SnackbarHandler.showSnackbarError(
                                      'Preencha todos os campos'));
                              return;
                            }
                            contactFormController.isMailLoading.value = true;
                            await Future.delayed(
                                const Duration(milliseconds: 300));
                            Get.showSnackbar(
                                SnackbarHandler.showSnackbarSuccess(
                                    'Mensagem enviada com sucesso'));
                            contactFormController.isMailLoading.value = false;
                          },
                          child: !contactFormController.isMailLoading.value
                              ? const Text('Send')
                              : const LoadingComponent()))
                ],
              ),
            ),
          ),
        )));
  }
}
