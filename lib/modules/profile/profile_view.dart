// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:crypto_wallet/global/common/components/default_expanded_component.dart';
import 'package:crypto_wallet/global/utils/styles.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: baseColor,
      body: const Center(
          child: DefaultExpandedComponent(
        children: [
          Text(
            'Hello',
            style: TextStyle(color: Colors.white),
          )
        ],
      )),
    ));
  }
}
