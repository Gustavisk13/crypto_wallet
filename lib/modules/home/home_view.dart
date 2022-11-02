import 'package:crypto_wallet/global/common/components/default_button_component.dart';
import 'package:crypto_wallet/global/common/components/default_input_component.dart';
import 'package:crypto_wallet/global/common/components/bottom_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../../src/utils/styles.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: baseColor,
      body: Container(
          child: Column(
        children: [
          DefaultInputComponent(
            enableSuffixIcon: false,
            label: 'Teste',
            validated: true,
          ),
          DefaultButtonComponent(onPressed: null, child: Text('Teste'))
        ],
      )),
    ));
  }
}
