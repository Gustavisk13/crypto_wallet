import 'package:carousel_slider/carousel_slider.dart';
import 'package:crypto_wallet/modules/home/controllers/coin_carousel_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

class CoinCarousel extends StatelessWidget {
  CoinCarouselController controller = Get.find<CoinCarouselController>();
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
