import 'package:crypto_wallet/global/models/autenticacao_model.dart';
import 'package:crypto_wallet/global/services/authentication/repository/autenticacao_repository.dart';
import 'package:crypto_wallet/modules/home/home_view.dart';
import 'package:crypto_wallet/modules/root/root.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

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

  validateInput(String value) {
    if (value.isNotEmpty) {
      validateUserInput.value = true;
    } else {
      validateUserInput.value = false;
    }
  }

  autenticar(context) async {
    autenticacao = AutenticacaoModel(email: username, senha: password);

    loadingAuth.value = true;
    try {
      if (await autenticacaoRepository.login(autenticacao)) {
        autenticado.value = true;
        Get.to(() => Root(
              index: 0,
            ));
      }
      loadingAuth.value = false;
    } catch (e) {
      loadingAuth.value = false;
      Get.snackbar('Error', e.toString());
    }
  }

  showPassword() async {
    passwordVisible.value = false;
    await Future.delayed(const Duration(seconds: 2));
    passwordVisible.value = true;
    print(passwordVisible.value);
  }

  bool isFilled(String value) {
    return value.isNotEmpty;
  }
}
