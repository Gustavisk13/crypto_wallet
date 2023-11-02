// Package imports:
import 'package:http/http.dart' as http;

// Project imports:
import 'package:crypto_wallet/modules/coin/data/models/coin_model.dart';

abstract class CoinRemoteDataSource {
  /// Calls the coins/{coinId} endpoint.
  ///
  /// Throws a [ServerException] for all error codes.
  Future<CoinModel> getCoin({required String coinAssetId});

  /// Calls the coins endpoint.
  /// The coindID is passed as a path parameter.
  /// Throws a [ServerException] for all error codes.
  Future<List<CoinModel>> getCoins();

  /// Calls the coins with pagination endpoint.
  /// The pageNumber is passed as a query parameter.
  /// Throws a [ServerException] for all error codes.
  Future<List<CoinModel>> getCoinsPaginated({int pageNumber = 1});
}

class CoinRemoteDataSourceImpl implements CoinRemoteDataSource {
  final http.Client client;

  CoinRemoteDataSourceImpl({required this.client});

  @override
  Future<CoinModel> getCoin({required String coinAssetId}) {
    // TODO: implement getCoin
    throw UnimplementedError();
  }

  @override
  Future<List<CoinModel>> getCoins() {
    // TODO: implement getCoins
    throw UnimplementedError();
  }

  @override
  Future<List<CoinModel>> getCoinsPaginated({int pageNumber = 1}) {
    // TODO: implement getCoinsPaginated
    throw UnimplementedError();
  }
}
