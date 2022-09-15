import 'package:crypto_wallet/src/controller/login/login_controller.dart';
import 'package:crypto_wallet/src/utils/styles.dart';
import 'package:crypto_wallet/src/view/eula.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class RegisterView extends StatelessWidget {
  final LoginController controller = Get.put(LoginController());
  FocusNode focusNode = FocusNode();
  FocusNode focusNode2 = FocusNode();

  @override
  Widget build(BuildContext context) {
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
                Container(height: 180, width: 271, child: const Image(image: AssetImage("lib/src/assets/images/logo.png"))),
                const SizedBox(
                  height: 44.68,
                ),
                Container(
                  width: 271,
                  child: TextField(
                    onSubmitted: (value) {},
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
                      labelText: 'Nome',
                    ),
                  ),
                ),
                SizedBox(
                  height: 24,
                ),
                Container(
                  width: 271,
                  child: TextField(
                    onSubmitted: (value) {},
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
                      labelText: "Email",
                    ),
                  ),
                ),
                SizedBox(
                  height: 24,
                ),
                Container(
                  width: 271,
                  child: Obx(
                    () => TextField(
                      onSubmitted: (value) {},
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
                            color: controller.forgotPassword.value ? Colors.white : Colors.grey,
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
                SizedBox(
                  height: 24,
                ),
                Container(
                  width: 271,
                  child: Obx(
                    () => TextField(
                      onSubmitted: (value) {},
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
                            color: controller.forgotPassword.value ? Colors.white : Colors.grey,
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
                        labelText: "Confirmar senha",
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Container(
                  width: 180,
                  height: 65,
                  child: ElevatedButton(
                    onPressed: () {
                      //loginController.login();
                    },
                    child: Text(
                      "CADASTRAR",
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
                    Text("Ao se cadastrar, você concorda com nosso ",
                        style: GoogleFonts.montserrat(color: Colors.white, fontSize: 12, fontWeight: FontWeight.normal)),
                    SelectableText(
                      onTap: () {
                        Get.to(() => EulaView());
                      },
                      "EULA",
                      style: GoogleFonts.montserrat(color: secondaryColor, fontSize: 12, fontWeight: FontWeight.bold),
                    ),
                  ],
                )
              ],
            ),
          )),
    );
  }
}
