// Flutter imports:

// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:get/get.dart';

// Project imports:
import 'package:crypto_wallet/global/models/autenticacao_model.dart';
import 'package:crypto_wallet/global/services/authentication/repository/autenticacao_repository.dart';
import 'package:crypto_wallet/modules/root/root.dart';

class LoginController extends GetxController {
  var forgotPassword = false.obs;
  var passwordVisible = true.obs;
  var validateUserInput = true.obs;
  var validatePasswordInput = true.obs;
  var loadingAuth = false.obs;

  final TextEditingController textUsernameController = TextEditingController();
  final TextEditingController textPasswordController = TextEditingController();
  late AutenticacaoModel autenticacao;

  AutenticacaoRepository autenticacaoRepository = AutenticacaoRepository();

  String username = '';
  String password = '';

  var autenticado = false.obs;

  validateInput(String value, String type) {
    if (type == 'username') {
      if (value.isEmpty) {
        validateUserInput.value = false;
      } else {
        validateUserInput.value = true;
      }
    } else if (type == 'password') {
      if (value.isEmpty) {
        validatePasswordInput.value = false;
      } else {
        validatePasswordInput.value = true;
      }
    }
  }

  autenticar(context) async {
    autenticacao = AutenticacaoModel(email: username, senha: password);

    loadingAuth.value = true;

    try {
      if (await autenticacaoRepository.login(autenticacao)) {
        autenticado.value = true;
        Get.to(
            () => Root(
                  index: 0,
                ),
            transition: Transition.fadeIn,
            duration: const Duration(milliseconds: 500));
      }
      loadingAuth.value = false;
    } catch (e) {
      loadingAuth.value = false;
    }
  }

  showPassword() async {
    passwordVisible.value = false;
    await Future.delayed(const Duration(seconds: 2));
    passwordVisible.value = true;
  }

  debugAuth() {
    autenticado.value = true;
    loadingAuth.value = false;
    Get.to(
        () => Root(
              index: 0,
            ),
        transition: Transition.fadeIn,
        duration: const Duration(milliseconds: 500));
  }

  bool isFilled(String value) {
    return value.isNotEmpty;
  }
}
