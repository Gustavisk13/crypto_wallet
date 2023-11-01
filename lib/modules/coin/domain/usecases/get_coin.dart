// Package imports:
import 'package:dartz/dartz.dart';

// Project imports:
import 'package:crypto_wallet/core/errors/failures.dart';
import 'package:crypto_wallet/modules/coin/domain/entities/coin.dart';
import 'package:crypto_wallet/modules/coin/domain/repositories/coin_repository.dart';

class GetCoin {
  final CoinRepository repository;

  GetCoin({required this.repository});

  Future<Either<Failure, Coin>> call({required int coinId}) async {
    return await repository.getCoin(coinId: coinId);
  }
}
