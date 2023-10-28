// Dart imports:
import 'dart:math';

class ImageRoutes {
  static const String _imagePath = 'lib/assets/images';

  static const String bitcoin = '$_imagePath/bitcoin-logo.png';
  static const String ethereum = '$_imagePath/ethereum-logo.png';
  static const String litecoin = '$_imagePath/litecoin-logo.png';
  static const String monero = '$_imagePath/monero-logo.png';
  static const String solano = '$_imagePath/solano-logo.png';
  static const String tether = '$_imagePath/tether-logo.png';
  static const String homecard1 = '$_imagePath/homecard-1.png';
  static const String homecard2 = '$_imagePath/homecard-2.png';
  static const String homecard3 = '$_imagePath/homecard-3.png';
  static const String homecard4 = '$_imagePath/homecard-4.png';
  static const String profileEffigy = '$_imagePath/profile-effigy.png';

  static String randomImage() {
    final random = Random();
    final images = [
      bitcoin,
      ethereum,
      litecoin,
      monero,
      solano,
      tether,
    ];
    return images[random.nextInt(images.length)];
  }
}
