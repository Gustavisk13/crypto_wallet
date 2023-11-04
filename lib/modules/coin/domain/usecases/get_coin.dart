// Package imports:
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

// Project imports:
import 'package:crypto_wallet/core/domain/usecases/usecase.dart';
import 'package:crypto_wallet/core/errors/failures.dart';
import 'package:crypto_wallet/modules/coin/domain/entities/coin.dart';
import 'package:crypto_wallet/modules/coin/domain/repositories/coin_repository.dart';

class GetCoin implements UseCase<Coin, GetCoinParams> {
  final CoinRepository repository;

  GetCoin({required this.repository});

  @override
  Future<Either<Failure, Coin>> call(GetCoinParams getCoinParams) async {
    return await repository.getCoin(coinAssetId: getCoinParams.coinAssetId);
  }
}

class GetCoinParams extends Equatable {
  final String coinAssetId;

  const GetCoinParams({required this.coinAssetId});

  @override
  List<Object?> get props => [coinAssetId];
}
