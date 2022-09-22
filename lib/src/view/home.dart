import 'package:crypto_wallet/src/shared/components/bottom_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../utils/styles.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: baseColor,
      bottomNavigationBar: BottomBar(initialActiveIndex: 0),
      body: Container(
        child: Text(
          "Estudar Custom paint",
          style: TextStyle(color: Colors.white),
        ),
      ),
    ));
  }
}
