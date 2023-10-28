// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:crypto_wallet/core/widgets/default_title_component.dart';
import '../../core/utils/styles.dart';

class ExchangePage extends StatelessWidget {
  const ExchangePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: baseColor,
      body: const Center(child: DefaultTitleComponent(title: 'Exchange')),
    ));
  }
}
