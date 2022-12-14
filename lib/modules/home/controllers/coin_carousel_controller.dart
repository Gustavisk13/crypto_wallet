// Dart imports:
import 'dart:math';

// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:get/get.dart';

// Project imports:
import 'package:crypto_wallet/modules/home/widgets/coin_main_card_widget.dart';

class CoinCarouselController extends GetxController {
  List<Widget> generateTemporaryItens(length) {
    List<Widget> itens = [];
    for (var i = 0; i < length; i++) {
      itens.add(
        const CoinMainCard(),
      );
    }

    return itens;
  }

  List<double> generateRandomNumbers(length) {
    List<double> numbers = [];
    for (var i = 0; i < length; i++) {
      numbers.add(Random().nextDouble());
    }

    return numbers;
  }

  getImageName() {
    int value = Random().nextInt(5);
    switch (value) {
      case 0:
        return 'Bitcoin';
      case 1:
        return 'Ethereum';
      case 2:
        return 'Monero';
      case 3:
        return 'Litecoin';
      case 4:
        return 'Tether';
      default:
        return 'Solano';
    }
  }
}
