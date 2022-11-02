import 'package:crypto_wallet/global/common/components/default_button_component.dart';
import 'package:crypto_wallet/global/common/components/default_input_component.dart';
import 'package:crypto_wallet/global/common/components/bottom_bar.dart';
import 'package:crypto_wallet/global/common/components/default_title_component.dart';
import 'package:crypto_wallet/global/widgets/default_card_widget.dart';
import 'package:crypto_wallet/modules/home/controllers/coin_carousel_controller.dart';
import 'package:crypto_wallet/modules/home/widgets/coin_carousel_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../global/utils/styles.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    CoinCarouselController controller = Get.put(CoinCarouselController());

    return SafeArea(
        child: Container(
            width: Get.width,
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
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
                  CoinCarousel(),
                  const SizedBox(
                    height: 38,
                  ),
                  DefaultCard(
                      toggleBorders: true,
                      child: Container(
                        padding: const EdgeInsets.all(16),
                        // ignore: prefer_const_literals_to_create_immutables
                        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                          const Flexible(
                            child: DefaultTitleComponent(
                              title: 'Cupoms',
                              fontSize: 20,
                            ),
                          ),
                          Column(
                            children: [
                              const SizedBox(
                                height: 15,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Numero de Cupons: ',
                                    style: GoogleFonts.montserrat(color: Colors.white, fontWeight: FontWeight.w600, fontSize: 14),
                                  ),
                                  Text('05',
                                      style: GoogleFonts.montserrat(
                                          color: secondaryColor, fontWeight: FontWeight.w600, fontSize: 14))
                                ],
                              ),
                              const SizedBox(
                                height: 14,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Tokens ganhos ate o momento: ',
                                    style: GoogleFonts.montserrat(color: Colors.white, fontWeight: FontWeight.w600, fontSize: 14),
                                  ),
                                  Text('15',
                                      style: GoogleFonts.montserrat(
                                          color: secondaryColor, fontWeight: FontWeight.w600, fontSize: 14))
                                ],
                              ),
                              const SizedBox(
                                height: 14,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Cupons restantes para girar: ',
                                    style: GoogleFonts.montserrat(color: Colors.white, fontWeight: FontWeight.w600, fontSize: 14),
                                  ),
                                  Text('01',
                                      style: GoogleFonts.montserrat(
                                          color: secondaryColor, fontWeight: FontWeight.w600, fontSize: 14))
                                ],
                              ),
                            ],
                          )
                        ]),
                      )),
                  const SizedBox(
                    height: 27,
                  ),
                  const DefaultTitleComponent(
                    title: 'Guia para iniciantes',
                  ),
                  const SizedBox(
                    height: 27,
                  ),
                  DefaultCard(
                    toggleBorders: true,
                  ),
                  const SizedBox(
                    height: 22,
                  ),
                  DefaultCard(
                    toggleBorders: true,
                  ),
                  const SizedBox(
                    height: 22,
                  ),
                  DefaultCard(
                    toggleBorders: true,
                  ),
                  const SizedBox(
                    height: 22,
                  ),
                  DefaultCard(
                    toggleBorders: true,
                  )
                ],
              ),
            )));
  }
}
