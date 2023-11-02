// Dart imports:
import 'dart:convert';

// Package imports:
import 'package:http/http.dart' as http;

// Project imports:
import 'package:crypto_wallet/core/config/environment_config.dart';
import 'package:crypto_wallet/core/errors/exceptions.dart';
import 'package:crypto_wallet/injection_container.dart';
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
  final EnvironmentConfig env = getIt<EnvironmentConfig>();

  CoinRemoteDataSourceImpl({required this.client});

  @override
  Future<CoinModel> getCoin({required String coinAssetId}) async {
    return _get<CoinModel>(
      path: '/coins/$coinAssetId',
    );
  }

  @override
  Future<List<CoinModel>> getCoins() async {
    return _get<List<CoinModel>>(
      path: '/coins',
    );
  }

  @override
  Future<List<CoinModel>> getCoinsPaginated({int pageNumber = 1}) async {
    return _get<List<CoinModel>>(
      path: '/coins?page=$pageNumber',
    );
  }

  Future<T> _get<T>({required String path}) async {
    final response = await client.get(
      Uri.parse('${env.apiBaseUrl}$path'),
      headers: {
        'Content-Type': 'application/json',
      },
    );

    if (response.statusCode != 200) {
      throw ServerException();
    }

    if (T == List<CoinModel>) {
      return (jsonDecode(response.body) as List)
          .map((e) => CoinModel.fromJson(json: e))
          .toList() as T;
    } else if (T == CoinModel) {
      return CoinModel.fromJson(json: jsonDecode(response.body)) as T;
    } else {
      return jsonDecode(response.body) as T;
    }
  }
}
