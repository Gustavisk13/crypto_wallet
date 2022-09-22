import 'package:crypto_wallet/src/controller/login/login_controller.dart';
import 'package:crypto_wallet/src/utils/styles.dart';
import 'package:crypto_wallet/src/view/register.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginView extends StatelessWidget {
  FocusNode focusNode = FocusNode();
  FocusNode focusNode2 = FocusNode();
  String username = '';
  String password = '';

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
                SizedBox(height: 271, width: 271, child: const Image(image: AssetImage("lib/src/assets/images/logo.png"))),
                const SizedBox(
                  height: 44.68,
                ),
                Obx(
                  () => SizedBox(
                    width: 271,
                    child: TextField(
                      controller: loginController.textUsernameController,
                      focusNode: focusNode,
                      onSubmitted: (value) {
                        if (value.isNotEmpty && loginController.textUsernameController.text.isNotEmpty) {
                          loginController.validateUserInput.value = true;
                        } else {
                          loginController.validateUserInput.value = false;
                        }

                        username = value;
                        FocusScope.of(context).requestFocus(focusNode2);
                      },
                      onChanged: (value) {
                        if (value.isNotEmpty && loginController.textUsernameController.text.isNotEmpty) {
                          loginController.validateUserInput.value = true;
                        } else {
                          loginController.validateUserInput.value = false;
                        }
                        username = value;
                        loginController.autenticacao.email = value;
                      },
                      style: GoogleFonts.montserrat(color: Colors.white, fontSize: 20, fontWeight: FontWeight.normal),
                      decoration: InputDecoration(
                        errorText: loginController.validateUserInput.value ? null : 'Username cannot be empty',
                        contentPadding: const EdgeInsets.symmetric(vertical: 26, horizontal: 20),
                        filled: true,
                        fillColor: baseColor2,
                        labelStyle: const TextStyle(color: Colors.white, fontSize: 18),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: secondaryColor, width: 2),
                          borderRadius: BorderRadius.circular(30),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: secondaryColor, width: 2),
                          borderRadius: BorderRadius.circular(30),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderSide: const BorderSide(color: Colors.red, width: 2),
                          borderRadius: BorderRadius.circular(30),
                        ),
                        focusedErrorBorder: OutlineInputBorder(
                          borderSide: const BorderSide(color: Colors.red, width: 2),
                          borderRadius: BorderRadius.circular(30),
                        ),
                        labelText: 'Email',
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 44.68,
                ),
                Obx(
                  () => SizedBox(
                    width: 271,
                    child: TextField(
                      controller: loginController.textPasswordController,
                      focusNode: focusNode2,
                      onSubmitted: (value) {
                        if (value.isNotEmpty && loginController.textPasswordController.text.isNotEmpty) {
                          loginController.validatePasswordInput.value = true;
                        } else {
                          loginController.validatePasswordInput.value = false;
                        }
                        password = value;
                        FocusScope.of(context).unfocus();
                      },
                      onChanged: (value) async {
                        if (value.isNotEmpty && loginController.textPasswordController.text.isNotEmpty) {
                          loginController.validatePasswordInput.value = true;
                        } else {
                          loginController.validatePasswordInput.value = false;
                        }
                        password = value;
                        loginController.autenticacao.senha = value;

                        await Future.delayed(const Duration(milliseconds: 100));
                        loginController.forgotPassword.value = true;
                      },
                      obscureText: loginController.passwordVisible.value,
                      enableSuggestions: false,
                      autocorrect: false,
                      style: GoogleFonts.montserrat(color: Colors.white, fontSize: 20, fontWeight: FontWeight.normal),
                      decoration: InputDecoration(
                        errorText: loginController.validatePasswordInput.value ? null : 'Password cannot be empty',
                        suffixIcon: IconButton(
                          splashColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          icon: Icon(
                            Icons.remove_red_eye,
                            color: loginController.forgotPassword.value ? Colors.white : Colors.grey,
                          ),
                          onPressed: () async {
                            loginController.passwordVisible.value = !loginController.passwordVisible.value;
                            await Future.delayed(const Duration(seconds: 2));
                            loginController.passwordVisible.value = true;
                            print(loginController.passwordVisible.value);
                          },
                        ),
                        contentPadding: const EdgeInsets.symmetric(vertical: 26, horizontal: 20),
                        filled: true,
                        fillColor: baseColor2,
                        labelStyle: const TextStyle(color: Colors.white, fontSize: 18),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: secondaryColor, width: 2),
                          borderRadius: BorderRadius.circular(30),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: secondaryColor, width: 2),
                          borderRadius: BorderRadius.circular(30),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderSide: const BorderSide(color: Colors.red, width: 2),
                          borderRadius: BorderRadius.circular(30),
                        ),
                        focusedErrorBorder: OutlineInputBorder(
                          borderSide: const BorderSide(color: Colors.red, width: 2),
                          borderRadius: BorderRadius.circular(30),
                        ),
                        labelText: "Senha",
                      ),
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
                    () => loginController.validateUserInput.value || loginController.validatePasswordInput.value
                        ? ElevatedButton(
                            onPressed: () {
                              loginController.validateLoginInputs(username, password);
                              /* loginController.validateLogin(username, password); */
                              loginController.autenticar(context);
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: secondaryColor,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(28),
                              ),
                            ),
                            child: Text(
                              "ENTRAR",
                              style: GoogleFonts.montserrat(color: Colors.black, fontSize: 28, fontWeight: FontWeight.w600),
                            ),
                          )
                        : ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              backgroundColor: secondaryColor,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(28),
                              ),
                            ),
                            child: Text(
                              "ENTRAR",
                              style: GoogleFonts.montserrat(color: Colors.black, fontSize: 28, fontWeight: FontWeight.w600),
                            ),
                          ),
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
