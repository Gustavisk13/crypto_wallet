// Dart imports:
import 'dart:math';

// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:crypto_wallet/modules/home/widgets/coin_main_card_widget.dart';

// Package imports:

class CoinCarouselController {
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
