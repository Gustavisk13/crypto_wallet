// Package imports:
import 'package:dartz/dartz.dart';

// Project imports:
import 'package:crypto_wallet/core/errors/exceptions.dart';
import 'package:crypto_wallet/core/errors/failures.dart';
import 'package:crypto_wallet/core/network/network_info.dart';
import 'package:crypto_wallet/modules/coin/data/datasources/coin_local_datasource.dart';
import 'package:crypto_wallet/modules/coin/data/datasources/coin_remote_datasource.dart';
import 'package:crypto_wallet/modules/coin/data/models/coin_model.dart';
import 'package:crypto_wallet/modules/coin/domain/entities/coin.dart';
import 'package:crypto_wallet/modules/coin/domain/repositories/coin_repository.dart';

class CoinRepositoryImpl implements CoinRepository {
  final CoinRemoteDataSource remoteDataSource;
  final CoinLocalDataSource localDataSource;
  final NetworkInfo networkInfo;

  CoinRepositoryImpl({
    required this.remoteDataSource,
    required this.localDataSource,
    required this.networkInfo,
  });

  @override
  Future<Either<Failure, Coin>> getCoin({required String coinAssetId}) async {
    return await _fetchData<CoinModel>(
      remoteFetch: () => remoteDataSource.getCoin(coinAssetId: coinAssetId),
      localFetch: () => localDataSource.getCoin(coinAssetId: coinAssetId),
      cacheData: (coin) => localDataSource.cacheCoin(
        coinToCache: coin,
      ),
    );
  }

  @override
  Future<Either<Failure, List<Coin>>> getCoins() async {
    return await _fetchData<List<CoinModel>>(
      remoteFetch: () => remoteDataSource.getCoins(),
      localFetch: () => localDataSource.getCoins(),
      cacheData: (coins) => localDataSource.cacheCoins(
        coinsToCache: coins,
      ),
    );
  }

  @override
  Future<Either<Failure, List<Coin>>> getCoinsPaginated(
      {int pageNumber = 1}) async {
    return await _fetchData<List<CoinModel>>(
      remoteFetch: () => remoteDataSource.getCoinsPaginated(
        pageNumber: pageNumber,
      ),
      localFetch: () => localDataSource.getCoins(
        pageNumber: pageNumber,
      ),
      cacheData: (coins) => localDataSource.cacheCoins(
        coinsToCache: coins,
        pageNumber: pageNumber,
      ),
    );
  }

  Future<Either<Failure, T>> _fetchData<T>({
    required Future<T> Function() remoteFetch,
    required Future<T> Function() localFetch,
    void Function(T data)? cacheData,
  }) async {
    if (await networkInfo.isConnected) {
      try {
        final remoteData = await remoteFetch();

        if (cacheData != null) {
          cacheData(remoteData);
        }

        return Right(remoteData);
      } on ServerException catch (_) {
        return Left(ServerFailure(
          message: _.message,
          statusCode: _.statusCode,
        ));
      }
    } else {
      try {
        final localData = await localFetch();

        return Right(localData);
      } on CacheException {
        return Left(CacheFailure());
      }
    }
  }
}
