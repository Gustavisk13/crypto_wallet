// Package imports:
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

// Project imports:
import 'package:crypto_wallet/core/domain/usecases/usecase.dart';
import 'package:crypto_wallet/core/errors/failures.dart';
import 'package:crypto_wallet/modules/coin/domain/entities/coin.dart';
import 'package:crypto_wallet/modules/coin/domain/repositories/coin_repository.dart';

class GetCoin implements UseCase<Coin, Params> {
  final CoinRepository repository;

  GetCoin({required this.repository});

  @override
  Future<Either<Failure, Coin>> call(Params params) async {
    return await repository.getCoin(coinAssetId: params.coinAssetId);
  }
}

class Params extends Equatable {
  final String coinAssetId;

  const Params({required this.coinAssetId});

  @override
  List<Object?> get props => [coinAssetId];
}
