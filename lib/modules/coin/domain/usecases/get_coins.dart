// Package imports:
import 'package:dartz/dartz.dart';

// Project imports:
import 'package:crypto_wallet/core/domain/usecases/usecase.dart';
import 'package:crypto_wallet/core/errors/failures.dart';
import 'package:crypto_wallet/modules/coin/domain/entities/coin.dart';
import 'package:crypto_wallet/modules/coin/domain/repositories/coin_repository.dart';

class GetCoins extends UseCase<List<Coin>, NoParams> {
  final CoinRepository repository;

  GetCoins({required this.repository});

  @override
  Future<Either<Failure, List<Coin>>> call(NoParams params) async {
    return await repository.getCoins();
  }
}
