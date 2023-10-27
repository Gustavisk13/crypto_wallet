// Flutter imports:

// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:google_fonts/google_fonts.dart';

// Project imports:
import 'package:crypto_wallet/global/common/components/default_button_component.dart';
import 'package:crypto_wallet/global/common/components/default_input_component.dart';
import 'package:crypto_wallet/global/utils/styles.dart';
import 'package:crypto_wallet/modules/login/controllers/login_controller.dart';

// Package imports:

class RegisterPage extends StatelessWidget {
  final LoginController controller = LoginController();

  RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
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
                    height: 180,
                    width: 271,
                    child:
                        Image(image: AssetImage("lib/assets/images/logo.png"))),
                const SizedBox(
                  height: 44.68,
                ),
                const SizedBox(
                  width: 271,
                  child: DefaultInputComponent(
                      enableSuffixIcon: false, validated: true, label: 'Nome'),
                ),
                const SizedBox(
                  height: 24,
                ),
                const SizedBox(
                  width: 271,
                  child: DefaultInputComponent(
                      enableSuffixIcon: false, validated: true, label: 'Email'),
                ),
                const SizedBox(
                  height: 24,
                ),
                const SizedBox(
                  width: 271,
                  child: DefaultInputComponent(
                    label: 'Senha',
                    validated: true,
                    enableSuffixIcon: true,
                    suffixIcon: Icon(Icons.remove_red_eye),
                  ),
                ),
                const SizedBox(
                  height: 24,
                ),
                const SizedBox(
                  width: 271,
                  child: DefaultInputComponent(
                    label: 'Confirmar Senha',
                    validated: true,
                    textInputAction: TextInputAction.done,
                    enableSuffixIcon: true,
                    suffixIcon: Icon(Icons.remove_red_eye),
                  ),
                ),
                const SizedBox(
                  height: 24,
                ),
                const SizedBox(
                  width: 180,
                  height: 65,
                  child: DefaultButtonComponent(
                    toggleBorders: false,
                    onPressed: null,
                    child: Text('CADASTRAR'),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Ao se cadastrar, você concorda com nosso ",
                        style: GoogleFonts.montserrat(
                            color: Colors.white,
                            fontSize: 12,
                            fontWeight: FontWeight.normal)),
                    SelectableText(
                      onTap: () {
                        // Get.to(() => const EulaView());
                      },
                      "EULA",
                      style: GoogleFonts.montserrat(
                          color: secondaryColor,
                          fontSize: 12,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                )
              ],
            ),
          )),
    );
  }
}
