import 'package:crypto_wallet/global/common/components/bottom_bar.dart';
import 'package:crypto_wallet/src/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: baseColor,
      body: Container(child: Center(child: Text('Profile'))),
    ));
  }
}
