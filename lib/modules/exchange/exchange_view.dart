import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/widgets.dart';

import '../../src/utils/styles.dart';

class ExchangeView extends StatelessWidget {
  const ExchangeView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: baseColor,
      body: Container(child: Center(child: Text('Exchange'))),
    ));
  }
}
