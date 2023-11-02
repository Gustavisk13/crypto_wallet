// Package imports:
import 'package:dartz/dartz.dart';

// Project imports:
import 'package:crypto_wallet/core/errors/failures.dart';
import 'package:crypto_wallet/modules/coin/domain/entities/coin.dart';

abstract class CoinRepository {
  Future<Either<Failure, Coin>> getCoin({required int coinId});
  Future<Either<Failure, List<Coin>>> getCoins();
  Future<Either<Failure, List<Coin>>> getCoinsPaginated({int pageNumber = 1});
}
