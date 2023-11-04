// Flutter imports:

// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:crypto_wallet/core/data/models/autenticacao_model.dart';
import 'package:crypto_wallet/core/services/authentication/repository/autenticacao_repository.dart';

// Package imports:

class LoginController {
  var forgotPassword = false;
  var passwordVisible = true;
  var validateUserInput = true;
  var validatePasswordInput = true;
  var loadingAuth = false;

  final TextEditingController textUsernameController = TextEditingController();
  final TextEditingController textPasswordController = TextEditingController();
  late AutenticacaoModel autenticacao;

  AutenticacaoRepository autenticacaoRepository = AutenticacaoRepository();

  String username = '';
  String password = '';

  var autenticado = false;

  validateInput(String value, String type) {
    if (type == 'username') {
      if (value.isEmpty) {
        validateUserInput = false;
      } else {
        validateUserInput = true;
      }
    } else if (type == 'password') {
      if (value.isEmpty) {
        validatePasswordInput = false;
      } else {
        validatePasswordInput = true;
      }
    }
  }

  autenticar(context) async {
    autenticacao = AutenticacaoModel(email: username, senha: password);

    loadingAuth = true;

    try {
      if (await autenticacaoRepository.login(autenticacao)) {
        autenticado = true;
        // Get.to(
        //     () => Root(
        //           index: 0,
        //         ),
        //     transition: Transition.fadeIn,
        //     duration: const Duration(milliseconds: 500));
      }
      loadingAuth = false;
    } catch (e) {
      loadingAuth = false;
    }
  }

  showPassword() async {
    passwordVisible = false;
    await Future.delayed(const Duration(seconds: 2));
    passwordVisible = true;
  }

  debugAuth() {
    autenticado = true;
    loadingAuth = false;
    // Get.to(
    //     () => Root(
    //           index: 0,
    //         ),
    //     transition: Transition.fadeIn,
    //     duration: const Duration(milliseconds: 500));
  }

  bool isFilled(String value) {
    return value.isNotEmpty;
  }
}
