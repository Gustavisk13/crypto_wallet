// Project imports:
import 'package:crypto_wallet/modules/coin/data/models/coin_model.dart';

abstract class CoinRemoteDataSource {
  /// Calls the coins/{coinId} endpoint.
  ///
  /// Throws a [ServerException] for all error codes.
  Future<CoinModel> getCoin({required int coinId});

  /// Calls the coins endpoint.
  /// The coindID is passed as a path parameter.
  /// Throws a [ServerException] for all error codes.
  Future<List<CoinModel>> getCoins();

  /// Calls the coins with pagination endpoint.
  /// The pageNumber is passed as a query parameter.
  /// Throws a [ServerException] for all error codes.
  Future<List<CoinModel>> getCoinsPaginated({int pageNumber = 1});
}
