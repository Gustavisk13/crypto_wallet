import 'package:crypto_wallet/src/controller/login/login_controller.dart';
import 'package:crypto_wallet/src/utils/styles.dart';
import 'package:crypto_wallet/src/view/register.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginView extends StatelessWidget {
  final LoginController controller = Get.put(LoginController());
  FocusNode focusNode = FocusNode();
  FocusNode focusNode2 = FocusNode();

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
                Container(height: 271, width: 271, child: const Image(image: AssetImage("lib/src/assets/images/logo.png"))),
                const SizedBox(
                  height: 44.68,
                ),
                Container(
                  width: 271,
                  child: TextField(
                    focusNode: focusNode,
                    onSubmitted: (value) {
                      FocusScope.of(context).requestFocus(focusNode2);
                    },
                    style: GoogleFonts.montserrat(color: Colors.white, fontSize: 20, fontWeight: FontWeight.normal),
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.symmetric(vertical: 26, horizontal: 20),
                      filled: true,
                      fillColor: baseColor2,
                      labelStyle: TextStyle(color: Colors.white, fontSize: 18),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: secondaryColor, width: 2),
                        borderRadius: BorderRadius.circular(30),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: secondaryColor, width: 2),
                        borderRadius: BorderRadius.circular(30),
                      ),
                      labelText: 'Email',
                    ),
                  ),
                ),
                SizedBox(
                  height: 44.68,
                ),
                Container(
                  width: 271,
                  child: Obx(
                    () => TextField(
                      focusNode: focusNode2,
                      onSubmitted: (value) {
                        FocusScope.of(context).unfocus();
                      },
                      onChanged: (value) async {
                        await Future.delayed(Duration(milliseconds: 100));
                        loginController.forgotPassword.value = true;
                      },
                      obscureText: controller.passwordVisible.value,
                      enableSuggestions: false,
                      autocorrect: false,
                      style: GoogleFonts.montserrat(color: Colors.white, fontSize: 20, fontWeight: FontWeight.normal),
                      decoration: InputDecoration(
                        suffixIcon: IconButton(
                          splashColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          icon: Icon(
                            Icons.remove_red_eye,
                            color: loginController.forgotPassword.value ? Colors.white : Colors.grey,
                          ),
                          onPressed: () async {
                            controller.passwordVisible.value = !controller.passwordVisible.value;
                            await Future.delayed(Duration(seconds: 2));
                            controller.passwordVisible.value = true;
                            print(controller.passwordVisible.value);
                          },
                        ),
                        contentPadding: EdgeInsets.symmetric(vertical: 26, horizontal: 20),
                        filled: true,
                        fillColor: baseColor2,
                        labelStyle: TextStyle(color: Colors.white, fontSize: 18),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: secondaryColor, width: 2),
                          borderRadius: BorderRadius.circular(30),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: secondaryColor, width: 2),
                          borderRadius: BorderRadius.circular(30),
                        ),
                        labelText: "Senha",
                      ),
                    ),
                  ),
                ),
                Obx(() => Container(
                      width: 271,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          AnimatedOpacity(
                            opacity: loginController.forgotPassword.value ? 1 : 0,
                            duration: Duration(milliseconds: 300),
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
                Container(
                  width: 172,
                  height: 65,
                  child: ElevatedButton(
                    onPressed: () {
                      //loginController.login();
                    },
                    child: Text(
                      "ENTRAR",
                      style: GoogleFonts.montserrat(color: Colors.black, fontSize: 28, fontWeight: FontWeight.w600),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: secondaryColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(28),
                      ),
                    ),
                  ),
                ),
                SizedBox(
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
