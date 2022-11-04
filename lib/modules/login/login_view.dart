import 'package:crypto_wallet/global/common/components/default_button_component.dart';
import 'package:crypto_wallet/global/common/components/default_input_component.dart';
import 'package:crypto_wallet/global/common/components/loading_component.dart';
import 'package:crypto_wallet/modules/login/controllers/login_controller.dart';
import 'package:crypto_wallet/global/utils/styles.dart';
import 'package:crypto_wallet/modules/register/register_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    LoginController loginController = Get.put(LoginController());
    return SafeArea(
      child: Scaffold(
          resizeToAvoidBottomInset: false,
          backgroundColor: baseColor,
          body: Container(
            padding: const EdgeInsets.only(top: 40),
            width: Get.width,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 271, width: 271, child: Image(image: AssetImage("lib/assets/images/logo.png"))),
                const SizedBox(
                  height: 44.68,
                ),
                Obx(
                  () => SizedBox(
                      width: 271,
                      child: DefaultInputComponent(
                        controller: loginController.textUsernameController,
                        validated: loginController.validateUserInput.value,
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
                ),
                const SizedBox(
                  height: 44.68,
                ),
                Obx(
                  () => SizedBox(
                    width: 271,
                    child: DefaultInputComponent(
                      label: 'Senha',
                      controller: loginController.textPasswordController,
                      validated: loginController.validatePasswordInput.value,
                      obscureText: loginController.passwordVisible.value,
                      errorText: 'Senha não pode ser vazia',
                      textInputAction: TextInputAction.done,
                      enableSuffixIcon: true,
                      suffixIconColor: !loginController.passwordVisible.value ? Colors.white : Colors.grey,
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
                        loginController.forgotPassword.value = true;
                      },
                    ),
                  ),
                ),
                Obx(() => SizedBox(
                      width: 271,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          AnimatedOpacity(
                            opacity: loginController.forgotPassword.value ? 1 : 0,
                            duration: const Duration(milliseconds: 300),
                            child: TextButton(
                              onPressed: () {},
                              child: Text(
                                "Esqueceu sua senha?",
                                style: GoogleFonts.montserrat(color: Colors.white, fontSize: 14, fontWeight: FontWeight.normal),
                              ),
                            ),
                          ),
                        ],
                      ),
                    )),
                SizedBox(
                  width: 172,
                  height: 65,
                  child: Obx(
                    () => !loginController.loadingAuth.value
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
                        : DefaultButtonComponent(onPressed: () {}, toggleBorders: false, child: const LoadingComponent()),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Não tem uma conta?",
                      style: GoogleFonts.montserrat(color: Colors.white, fontSize: 18, fontWeight: FontWeight.normal),
                    ),
                    TextButton(
                      onPressed: () {
                        Get.to(
                          () => RegisterView(),
                        );
                      },
                      child: Text(
                        "CADASTRE-SE",
                        style: GoogleFonts.montserrat(color: secondaryColor, fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          )),
    );
  }
}
