import 'package:crypto_wallet/global/common/components/default_button_component.dart';
import 'package:crypto_wallet/global/common/components/default_input_component.dart';
import 'package:crypto_wallet/global/common/components/bottom_bar.dart';
import 'package:crypto_wallet/global/common/components/default_title_component.dart';
import 'package:crypto_wallet/modules/home/controllers/coin_carousel_controller.dart';
import 'package:crypto_wallet/modules/home/widgets/coin_carousel_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

import '../../global/utils/styles.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    CoinCarouselController controller = Get.put(CoinCarouselController());

    return SafeArea(
        child: Container(
            width: Get.width,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              // ignore: prefer_const_literals_to_create_immutables
              children: [
                const SizedBox(height: 147, width: 147, child: Image(image: AssetImage("lib/assets/images/logo.png"))),
                const DefaultTitleComponent(
                  title: 'Suas criptomoedas',
                ),
                const SizedBox(
                  height: 38,
                ),
                _buildCoinCarousel(context)
              ],
            )));
  }

  Widget _buildCoinCarousel(BuildContext context) {
    return CoinCarousel();
  }
}
