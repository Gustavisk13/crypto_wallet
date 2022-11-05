// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:carousel_slider/carousel_slider.dart';
import 'package:get/get.dart';

// Project imports:
import 'package:crypto_wallet/modules/home/controllers/coin_carousel_controller.dart';

class CoinCarousel extends StatelessWidget {
  final CoinCarouselController controller = Get.find<CoinCarouselController>();

  CoinCarousel({super.key});
  //TODO: the current api doesn't have the images, so i will use a placeholder
  /*  @override
  Widget build(BuildContext context) {
    return CarouselSlider.builder(
        itemCount: itemCount,
        itemBuilder: (context, index, realIndex) {
          return itemBuilder!(context, index, realIndex);
        },
        options: CarouselOptions(
          height: 200,
          viewportFraction: 0.8,
        ));
  } */

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
        items: controller.generateTemporaryItens(4),
        options: CarouselOptions(
            autoPlay: false,
            autoPlayCurve: Curves.easeInOut,
            autoPlayAnimationDuration: const Duration(milliseconds: 800),
            autoPlayInterval: const Duration(seconds: 3),
            enlargeCenterPage: true,
            height: 350,
            initialPage: 0));
  }
}
