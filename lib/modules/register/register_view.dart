import 'package:crypto_wallet/global/common/components/default_button_component.dart';
import 'package:crypto_wallet/global/common/components/default_input_component.dart';
import 'package:crypto_wallet/modules/login/controllers/login_controller.dart';
import 'package:crypto_wallet/global/utils/styles.dart';
import 'package:crypto_wallet/modules/eula/eula_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class RegisterView extends StatelessWidget {
  final LoginController controller = Get.put(LoginController());

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
                const SizedBox(height: 180, width: 271, child: Image(image: AssetImage("lib/assets/images/logo.png"))),
                const SizedBox(
                  height: 44.68,
                ),
                SizedBox(
                  width: 271,
                  child: DefaultInputComponent(enableSuffixIcon: false, validated: true, label: 'Nome'),
                ),
                const SizedBox(
                  height: 24,
                ),
                SizedBox(
                  width: 271,
                  child: DefaultInputComponent(enableSuffixIcon: false, validated: true, label: 'Email'),
                ),
                const SizedBox(
                  height: 24,
                ),
                SizedBox(
                  width: 271,
                  child: DefaultInputComponent(
                    label: 'Senha',
                    validated: true,
                    enableSuffixIcon: true,
                    suffixIcon: const Icon(Icons.remove_red_eye),
                  ),
                ),
                const SizedBox(
                  height: 24,
                ),
                SizedBox(
                  width: 271,
                  child: DefaultInputComponent(
                    label: 'Confirmar Senha',
                    validated: true,
                    textInputAction: TextInputAction.done,
                    enableSuffixIcon: true,
                    suffixIcon: const Icon(Icons.remove_red_eye),
                  ),
                ),
                const SizedBox(
                  height: 24,
                ),
                SizedBox(
                  width: 180,
                  height: 65,
                  child: DefaultButtonComponent(
                    toggleBorders: false,
                    child: const Text('CADASTRAR'),
                    onPressed: null,
                  ),
                ),
                const SizedBox(
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
