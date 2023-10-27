// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:syncfusion_flutter_charts/sparkcharts.dart';

// Project imports:
import 'package:crypto_wallet/global/common/components/default_title_component.dart';
import 'package:crypto_wallet/global/utils/image_routes.dart';
import 'package:crypto_wallet/global/utils/styles.dart';
import 'package:crypto_wallet/modules/home/controllers/coin_carousel_controller.dart';

// Package imports:

class CoinCard extends StatelessWidget {
  const CoinCard({super.key});

  @override
  Widget build(BuildContext context) {
    CoinCarouselController controller = CoinCarouselController();
    return Container(
      height: 80,
      // width: Get.width / 1.5,
      padding: const EdgeInsets.all(2),
      decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(10)),
          color: Colors.white,
          border: Border.all(color: secondaryColor)),
      child: Row(children: [
        Expanded(
          flex: 1,
          child: Padding(
            padding: const EdgeInsets.all(5.0),
            child: FittedBox(
              fit: BoxFit.scaleDown,
              child: Image(
                  image: AssetImage(ImageRoutes.randomImage()),
                  height: 50,
                  width: 50),
            ),
          ),
        ),
        Expanded(
          flex: 3,
          child: Column(children: [
            DefaultTitleComponent(
              title: controller.getImageName(),
              color: Colors.black,
            ),
            const SizedBox(
              height: 5,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Flexible(
                  child: FittedBox(
                    fit: BoxFit.fitHeight,
                    child: SizedBox(
                      height: 40,
                      width: 65,
                      child: SfSparkLineChart(
                          axisLineColor: Colors.transparent,
                          color: Colors.green,
                          data: controller.generateRandomNumbers(15)),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                const Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  // ignore: prefer_const_literals_to_create_immutables
                  children: [
                    DefaultTitleComponent(
                      title: 'R\$ 2.500,00',
                      color: Colors.black,
                      fontSize: 16,
                    ),
                    SizedBox(
                      height: 2,
                    ),
                    DefaultTitleComponent(
                      title: '+ 6.77\$',
                      color: Colors.grey,
                      fontSize: 12,
                    ),
                  ],
                )
              ],
            )
          ]),
        )
      ]),
    );
  }
}
