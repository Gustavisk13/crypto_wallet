// Project imports:
import 'package:crypto_wallet/modules/coin/data/models/coin_model.dart';

abstract class CoinLocalDataSource {
  /// Gets the cached [CoinModel] which was gotten the last time
  /// the user had an internet connection.
  ///
  /// Throws a [CacheException] if no cached data is present.
  Future<CoinModel> getCoin({required int coinId});

  /// Gets the cached list of [CoinModel] which was gotten the last time
  /// the user had an internet connection.
  ///
  /// Throws a [CacheException] for all error codes.
  Future<List<CoinModel>> getCoins();

  /// Cache the [CoinModel] to be used later.
  ///
  /// Throws a [CacheException] if the data cannot be cached.
  Future<void> cacheCoin({required CoinModel coinToCache});

  /// Cache the list of [CoinModel] to be used later.
  ///
  /// Throws a [CacheException] if the data cannot be cached.
  Future<void> cacheCoins({required List<CoinModel> coinsToCache});
}
