import 'package:crypto_wallet/src/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginView extends StatelessWidget {
  //          Navigator.pushNamed(context, '/teste');

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: baseColor2,
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
                    decoration: InputDecoration(
                      fillColor: baseColor3,
                      filled: true,
                      labelText: "Email",
                      hintText: "Email: ",
                      alignLabelWithHint: true,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 44.68,
                ),
                Container(
                  width: 271,
                  child: TextField(
                    decoration: InputDecoration(
                      labelText: "Senha",
                      hintText: "Senha: ",
                      alignLabelWithHint: true,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                  ),
                )
              ],
            ),
          )),
    );
  }
}
