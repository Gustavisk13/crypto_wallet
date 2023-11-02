// Dart imports:

// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:google_fonts/google_fonts.dart';

// Project imports:
import 'package:crypto_wallet/core/utils/image_routes.dart';
import 'package:crypto_wallet/core/utils/styles.dart';
import 'package:crypto_wallet/core/widgets/default_button_component.dart';
import 'package:crypto_wallet/core/widgets/default_card_widget.dart';
import 'package:crypto_wallet/core/widgets/default_title_component.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final media = MediaQuery.of(context);
    return SafeArea(
        child: SizedBox(
            width: media.size.width,
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                // ignore: prefer_const_literals_to_create_immutables
                children: [
                  const SizedBox(
                      height: 147,
                      width: 147,
                      child: Image(
                          image: AssetImage("lib/assets/images/logo.png"))),
                  const DefaultTitleComponent(
                    title: 'Suas criptomoedas',
                  ),
                  const SizedBox(
                    height: 38,
                  ),
                  // CoinCarousel(),
                  const SizedBox(
                    height: 38,
                  ),
                  DefaultCard(
                      toggleBorders: true,
                      child: Container(
                        padding: const EdgeInsets.all(16),
                        // ignore: prefer_const_literals_to_create_immutables
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
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
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'Numero de Cupons: ',
                                        style: GoogleFonts.montserrat(
                                            color: Colors.white,
                                            fontWeight: FontWeight.w600,
                                            fontSize: 14),
                                      ),
                                      Text('05',
                                          style: GoogleFonts.montserrat(
                                              color: secondaryColor,
                                              fontWeight: FontWeight.w600,
                                              fontSize: 14))
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 14,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'Tokens ganhos ate o momento: ',
                                        style: GoogleFonts.montserrat(
                                            color: Colors.white,
                                            fontWeight: FontWeight.w600,
                                            fontSize: 14),
                                      ),
                                      Text('15',
                                          style: GoogleFonts.montserrat(
                                              color: secondaryColor,
                                              fontWeight: FontWeight.w600,
                                              fontSize: 14))
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 14,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'Cupons restantes para girar: ',
                                        style: GoogleFonts.montserrat(
                                            color: Colors.white,
                                            fontWeight: FontWeight.w600,
                                            fontSize: 14),
                                      ),
                                      Text('01',
                                          style: GoogleFonts.montserrat(
                                              color: secondaryColor,
                                              fontWeight: FontWeight.w600,
                                              fontSize: 14))
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
                  Stack(
                    children: [
                      DefaultCard(
                        toggleBorders: true,
                        child: Container(
                          padding: const EdgeInsets.only(top: 25, left: 16),
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Begginer Guide',
                                  style: GoogleFonts.montserrat(
                                      color: Colors.white,
                                      fontSize: 15,
                                      fontStyle: FontStyle.italic),
                                ),
                                const SizedBox(
                                  height: 15,
                                ),
                                Text(
                                  'Learn how to get started',
                                  style: GoogleFonts.montserrat(
                                      color: Colors.white,
                                      fontSize: 19,
                                      fontWeight: FontWeight.w500),
                                ),
                                const SizedBox(
                                  height: 15,
                                ),
                                DefaultButtonComponent(
                                  toggleBorders: true,
                                  onPressed: () async {
                                    // Get.to(() => const DefaultWebView(
                                    //       title: 'Begginer Guide',
                                    //       url: 'https://learncrypto.com/knowledge-base/basics',
                                    //     ));
                                  },
                                  child: Text(
                                    'Invest Today',
                                    style: GoogleFonts.montserrat(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w600),
                                  ),
                                )
                              ]),
                        ),
                      ),
                      Positioned(
                        bottom: 5.7,
                        right: 13,
                        child: Container(
                          height: 100,
                          width: 95,
                          decoration: const BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage(ImageRoutes.homecard1),
                                  fit: BoxFit.cover)),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 22,
                  ),
                  Stack(
                    children: [
                      DefaultCard(
                        toggleBorders: true,
                        child: Container(
                          padding: const EdgeInsets.only(top: 25, left: 16),
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Welcome \${name}',
                                  style: GoogleFonts.montserrat(
                                      color: Colors.white,
                                      fontSize: 15,
                                      fontStyle: FontStyle.italic),
                                ),
                                const SizedBox(
                                  height: 15,
                                ),
                                Text(
                                  'Make your first investment today',
                                  style: GoogleFonts.montserrat(
                                      color: Colors.white,
                                      fontSize: 19,
                                      fontWeight: FontWeight.w500),
                                ),
                                const SizedBox(
                                  height: 15,
                                ),
                                DefaultButtonComponent(
                                  toggleBorders: true,
                                  onPressed: () {
                                    // Get.to(() => const DefaultWebView(
                                    //       title: 'First Investment',
                                    //       url: 'https://learncrypto.com/knowledge-base/how-to-build-crypto',
                                    //     ));
                                  },
                                  child: Text(
                                    'Start Now',
                                    style: GoogleFonts.montserrat(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w600),
                                  ),
                                )
                              ]),
                        ),
                      ),
                      Positioned(
                        bottom: 5.7,
                        right: 13,
                        child: Container(
                          height: 89,
                          width: 89,
                          decoration: const BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage(ImageRoutes.homecard2),
                                  fit: BoxFit.cover)),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 22,
                  ),
                  Stack(
                    children: [
                      DefaultCard(
                        toggleBorders: true,
                        child: Container(
                          padding: const EdgeInsets.only(top: 25, left: 16),
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Refer and Earn',
                                  style: GoogleFonts.montserrat(
                                      color: Colors.white,
                                      fontSize: 15,
                                      fontStyle: FontStyle.italic),
                                ),
                                const SizedBox(
                                  height: 15,
                                ),
                                SizedBox(
                                  width: 200,
                                  child: Wrap(
                                    children: [
                                      Text(
                                        'Refer a friend and earn 10% of their investment',
                                        style: GoogleFonts.montserrat(
                                            color: Colors.white,
                                            fontSize: 19,
                                            fontWeight: FontWeight.w500),
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(
                                  height: 3,
                                ),
                                DefaultButtonComponent(
                                  toggleBorders: true,
                                  onPressed: () {
                                    // Get.to(() => const DefaultWebView(
                                    //       title: 'Refer a friend ',
                                    //       url: 'https://learncrypto.com/knowledge-base/how-to-trade-crypto',
                                    //     ));
                                  },
                                  child: Text(
                                    'Refer Now',
                                    style: GoogleFonts.montserrat(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w600),
                                  ),
                                )
                              ]),
                        ),
                      ),
                      Positioned(
                        bottom: 5.7,
                        right: 13,
                        child: Container(
                          height: 95,
                          width: 95,
                          decoration: const BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage(ImageRoutes.homecard3),
                                  fit: BoxFit.cover)),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 22,
                  ),
                  Stack(
                    children: [
                      DefaultCard(
                        toggleBorders: true,
                        child: Container(
                          padding: const EdgeInsets.only(top: 25, left: 16),
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Rewards',
                                  style: GoogleFonts.montserrat(
                                      color: Colors.white,
                                      fontSize: 15,
                                      fontStyle: FontStyle.italic),
                                ),
                                const SizedBox(
                                  height: 15,
                                ),
                                SizedBox(
                                  width: 200,
                                  child: Wrap(
                                    children: [
                                      Text(
                                        'Like, Share & get free coupons',
                                        style: GoogleFonts.montserrat(
                                            color: Colors.white,
                                            fontSize: 19,
                                            fontWeight: FontWeight.w500),
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(
                                  height: 3,
                                ),
                                DefaultButtonComponent(
                                  toggleBorders: true,
                                  onPressed: () {
                                    // Get.to(() => const DefaultWebView(
                                    //       title: 'Rewards',
                                    //       url: 'https://learncrypto.com/knowledge-base/how-to-use-crypto',
                                    //     ));
                                  },
                                  child: Text(
                                    'Share Now',
                                    style: GoogleFonts.montserrat(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w600),
                                  ),
                                )
                              ]),
                        ),
                      ),
                      Positioned(
                        bottom: 5.7,
                        right: 13,
                        child: Container(
                          height: 95,
                          width: 117,
                          decoration: const BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage(ImageRoutes.homecard4),
                                  fit: BoxFit.cover)),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 26,
                  ),
                ],
              ),
            )));
  }
}
