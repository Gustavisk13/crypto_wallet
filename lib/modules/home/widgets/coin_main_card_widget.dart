// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:crypto_wallet/global/common/components/default_button_component.dart';
import 'package:crypto_wallet/global/common/components/default_title_component.dart';
import 'package:crypto_wallet/global/utils/styles.dart';
import 'package:crypto_wallet/modules/home/widgets/coin_card_widget.dart';
import 'package:crypto_wallet/modules/root/controllers/root_controller.dart';

// Package imports:

class CoinMainCard extends StatelessWidget {
  const CoinMainCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: secondaryColor, width: 2),
          color: baseColor2,
        ),
        width: 300,
        child: SingleChildScrollView(
          physics: const NeverScrollableScrollPhysics(),
          child: Column(
            children: [
              const FittedBox(
                fit: BoxFit.scaleDown,
                child: CoinCard(),
              ),
              const SizedBox(
                height: 10,
              ),
              const DefaultTitleComponent(title: 'Descrição'),
              const SizedBox(
                height: 10,
              ),
              const Text(
                'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. ',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  DefaultButtonComponent(
                    onPressed: () {
                      RootController rootController = RootController();
                      rootController.changePage(1);
                    },
                    toggleBorders: true,
                    child: const Text('Abrir'),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  DefaultButtonComponent(
                    onPressed: () {},
                    toggleBorders: true,
                    secondary: secondaryColor,
                    primary: baseColor2,
                    child: Icon(
                      Icons.replay_outlined,
                      color: secondaryColor,
                    ),
                  ),
                ],
              )
            ],
          ),
        ));
  }
}
