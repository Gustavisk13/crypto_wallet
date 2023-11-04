// Flutter imports:

// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:google_fonts/google_fonts.dart';

// Project imports:
import 'package:crypto_wallet/core/utils/styles.dart';
import 'package:crypto_wallet/core/widgets/default_button_component.dart';
import 'package:crypto_wallet/core/widgets/default_input_component.dart';
import 'package:crypto_wallet/core/widgets/loading_component.dart';
import 'package:crypto_wallet/modules/login/presentation/bloc/login_controller.dart';

// Package imports:

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  static const String debugOptions =
      String.fromEnvironment('debugOptions', defaultValue: 'false');

  @override
  Widget build(BuildContext context) {
    LoginController loginController = LoginController();
    return SafeArea(
      child: Scaffold(
          resizeToAvoidBottomInset: false,
          backgroundColor: baseColor,
          body: Container(
            padding: const EdgeInsets.only(top: 40),
            // width: Get.width,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(
                    height: 271,
                    width: 271,
                    child:
                        Image(image: AssetImage("lib/assets/images/logo.png"))),
                const SizedBox(
                  height: 44.68,
                ),
                SizedBox(
                    width: 271,
                    child: DefaultInputComponent(
                      controller: loginController.textUsernameController,
                      validated: loginController.validateUserInput,
                      label: 'Email',
                      errorText: 'Usuário não pode ser vazio',
                      enableSuffixIcon: false,
                      onFieldSubmitted: (value) {
                        loginController.validateInput(value, 'username');
                        loginController.username = value;
                      },
                      onChanged: (value) {
                        loginController.validateInput(value, 'username');
                        loginController.username = value;
                      },
                    )),
                const SizedBox(
                  height: 44.68,
                ),
                SizedBox(
                  width: 271,
                  child: DefaultInputComponent(
                    label: 'Senha',
                    controller: loginController.textPasswordController,
                    validated: loginController.validatePasswordInput,
                    obscureText: loginController.passwordVisible,
                    errorText: 'Senha não pode ser vazia',
                    textInputAction: TextInputAction.done,
                    enableSuffixIcon: true,
                    suffixIconColor: !loginController.passwordVisible
                        ? Colors.white
                        : Colors.grey,
                    iconOnTap: () {
                      loginController.showPassword();
                    },
                    suffixIcon: const Icon(Icons.remove_red_eye),
                    onFieldSubmitted: (value) {
                      loginController.validateInput(value, 'password');
                      loginController.password = value;
                    },
                    onChanged: (value) async {
                      loginController.validateInput(value, 'password');
                      loginController.password = value;
                      await Future.delayed(const Duration(milliseconds: 100));
                      loginController.forgotPassword = true;
                    },
                  ),
                ),
                SizedBox(
                  width: 271,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      AnimatedOpacity(
                        opacity: loginController.forgotPassword ? 1 : 0,
                        duration: const Duration(milliseconds: 300),
                        child: TextButton(
                          onPressed: () {},
                          child: Text(
                            "Esqueceu sua senha?",
                            style: GoogleFonts.montserrat(
                                color: Colors.white,
                                fontSize: 14,
                                fontWeight: FontWeight.normal),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: 172,
                  height: 65,
                  child: !loginController.loadingAuth
                      ? DefaultButtonComponent(
                          toggleBorders: false,
                          onPressed: () {
                            //loginController.validateLoginInputs(username, password);
                            loginController.autenticar(context);
                          },
                          child: const Text(
                            "ENTRAR",
                          ),
                        )
                      : DefaultButtonComponent(
                          onPressed: () {},
                          toggleBorders: false,
                          child: const LoadingComponent()),
                ),
                const SizedBox(
                  height: 15,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Não tem uma conta?",
                      style: GoogleFonts.montserrat(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.normal),
                    ),
                    TextButton(
                      onPressed: () {
                        // Get.to(
                        //   () => RegisterView(),
                        // );
                      },
                      child: Text(
                        "CADASTRE-SE",
                        style: GoogleFonts.montserrat(
                            color: secondaryColor,
                            fontSize: 18,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                debugOptions == 'true'
                    ? DefaultButtonComponent(
                        toggleBorders: false,
                        onPressed: () {
                          loginController.debugAuth();
                        },
                        child: const Icon(
                          Icons.bug_report,
                          color: Colors.black,
                        ),
                      )
                    : Container(),
              ],
            ),
          )),
    );
  }
}
