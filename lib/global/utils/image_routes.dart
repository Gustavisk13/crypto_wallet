import 'dart:math';

class ImageRoutes {
  static const String _imagePath = 'lib/assets/images';

  static const String _bitcoin = '$_imagePath/bitcoin-logo.png';
  static const String _ethereum = '$_imagePath/ethereum-logo.png';
  static const String _litecoin = '$_imagePath/litecoin-logo.png';
  static const String _monero = '$_imagePath/monero-logo.png';
  static const String _solano = '$_imagePath/solano-logo.png';
  static const String _tether = '$_imagePath/tether-logo.png';

  static String randomImage() {
    final _random = Random();
    final _images = [
      _bitcoin,
      _ethereum,
      _litecoin,
      _monero,
      _solano,
      _tether,
    ];
    return _images[_random.nextInt(_images.length)];
  }
}
