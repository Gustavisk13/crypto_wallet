import 'package:crypto_wallet/src/utils/styles.dart';
import 'package:flutter/material.dart';

class LoginView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: baseColor,
      body: Center(
          child: AnimatedContainer(
        curve: Curves.easeIn,
        duration: Duration(seconds: 1),
        child: Container(
          width: 240,
          height: 240,
          color: Colors.white,
        ),
      )),
    );
  }
}
