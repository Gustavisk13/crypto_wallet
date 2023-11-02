// Dart imports:
import 'dart:convert';

// Package imports:
import 'package:shared_preferences/shared_preferences.dart';

// Project imports:
import 'package:crypto_wallet/core/errors/exceptions.dart';
import 'package:crypto_wallet/modules/coin/data/models/coin_model.dart';

abstract class CoinLocalDataSource {
  /// Gets the cached [CoinModel] which was gotten the last time
  /// the user had an internet connection.
  ///
  /// Throws a [CacheException] if no cached data is present.
  Future<CoinModel> getCoin({required String coinAssetId});

  /// Gets the cached list of [CoinModel] which was gotten the last time
  /// the user had an internet connection.
  ///
  /// Throws a [CacheException] for all error codes.
  Future<List<CoinModel>> getCoins({int? pageNumber});

  /// Cache the [CoinModel] to be used later.
  ///
  /// Throws a [CacheException] if the data cannot be cached.
  Future<void> cacheCoin({required CoinModel coinToCache});

  /// Cache the list of [CoinModel] to be used later.
  ///
  /// Throws a [CacheException] if the data cannot be cached.
  Future<void> cacheCoins(
      {required List<CoinModel> coinsToCache, int? pageNumber});
}

class CoinLocalDataSourceImpl implements CoinLocalDataSource {
  final SharedPreferences sharedPreferences;

  CoinLocalDataSourceImpl({required this.sharedPreferences});

  @override
  Future<CoinModel> getCoin({required String coinAssetId}) {
    final jsonString = sharedPreferences.getString('CACHED_COIN_$coinAssetId');

    if (jsonString != null) {
      return Future.value(CoinModel.fromJson(json: jsonDecode(jsonString)));
    } else {
      throw CacheException();
    }
  }

  @override
  Future<List<CoinModel>> getCoins({int? pageNumber}) {
    final jsonString = sharedPreferences.getString('CACHED_COINS_$pageNumber');

    if (jsonString != null) {
      final List<CoinModel> coins = [];
      final List<dynamic> jsonList = jsonDecode(jsonString);
      for (var json in jsonList) {
        coins.add(CoinModel.fromJson(json: json));
      }
      return Future.value(coins);
    } else {
      throw CacheException();
    }
  }

  @override
  Future<void> cacheCoin({required CoinModel coinToCache}) async {
    final success = await sharedPreferences.setString(
      'CACHED_COIN_${coinToCache.id}',
      jsonEncode(
        coinToCache.toJson(),
      ),
    );

    if (!success) {
      throw CacheException();
    }
  }

  @override
  Future<void> cacheCoins(
      {required List<CoinModel> coinsToCache, int? pageNumber}) async {
    final success = await sharedPreferences.setString(
      'CACHED_COINS_$pageNumber',
      jsonEncode(
        coinsToCache.map((coin) => coin.toJson()).toList(),
      ),
    );

    if (!success) {
      throw CacheException();
    }
  }
}
