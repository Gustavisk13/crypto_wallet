import 'package:crypto_wallet/src/shared/components/bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class PerfilView extends StatelessWidget {
  const PerfilView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomBar(initialActiveIndex: 4),
      body: Container(
        child: const Text('Perfil'),
      ),
    );
  }
}
