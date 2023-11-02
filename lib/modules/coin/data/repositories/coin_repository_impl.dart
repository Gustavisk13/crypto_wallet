// Package imports:
import 'package:dartz/dartz.dart';

// Project imports:
import 'package:crypto_wallet/core/errors/exceptions.dart';
import 'package:crypto_wallet/core/errors/failures.dart';
import 'package:crypto_wallet/core/platform/network_info.dart';
import 'package:crypto_wallet/modules/coin/data/datasources/coin_local_datasource.dart';
import 'package:crypto_wallet/modules/coin/data/datasources/coin_remote_datasource.dart';
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
  Future<Either<Failure, Coin>> getCoin({required int coinId}) async {
    if (await networkInfo.isConnected) {
      try {
        final remoteCoin = await remoteDataSource.getCoin(coinId: coinId);

        localDataSource.cacheCoin(coinToCache: remoteCoin);

        return Right(remoteCoin);
      } on ServerException catch (_) {
        return Left(ServerFailure());
      }
    } else {
      try {
        final localCoin = await localDataSource.getCoin(coinId: coinId);

        return Right(localCoin);
      } on CacheException {
        return Left(CacheFailure());
      }
    }
  }

  @override
  Future<Either<Failure, List<Coin>>> getCoins() async {
    if (await networkInfo.isConnected) {
      try {
        final remoteCoins = await remoteDataSource.getCoins();

        localDataSource.cacheCoins(coinsToCache: remoteCoins);

        return Right(remoteCoins);
      } on ServerException catch (_) {
        return Left(ServerFailure());
      }
    } else {
      try {
        final localCoins = await localDataSource.getCoins();

        return Right(localCoins);
      } on CacheException {
        return Left(CacheFailure());
      }
    }
  }

  @override
  Future<Either<Failure, List<Coin>>> getCoinsPaginated(
      {int pageNumber = 1}) async {
    if (await networkInfo.isConnected) {
      try {
        final remoteCoins =
            await remoteDataSource.getCoinsPaginated(pageNumber: pageNumber);

        localDataSource.cacheCoins(coinsToCache: remoteCoins);

        return Right(remoteCoins);
      } on ServerException catch (_) {
        return Left(ServerFailure());
      }
    } else {
      try {
        final localCoins = await localDataSource.getCoins();

        return Right(localCoins);
      } on CacheException {
        return Left(CacheFailure());
      }
    }
  }
}
