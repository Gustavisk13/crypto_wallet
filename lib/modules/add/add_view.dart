// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:crypto_wallet/core/utils/styles.dart';
import 'package:crypto_wallet/core/widgets/default_title_component.dart';

class AddPage extends StatelessWidget {
  const AddPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: baseColor,
      body: const Center(child: DefaultTitleComponent(title: 'Add')),
    ));
  }
}
