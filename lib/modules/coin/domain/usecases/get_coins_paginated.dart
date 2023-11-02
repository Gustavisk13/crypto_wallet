// Package imports:
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

// Project imports:
import 'package:crypto_wallet/core/domain/usecases/usecase.dart';
import 'package:crypto_wallet/core/errors/failures.dart';
import 'package:crypto_wallet/modules/coin/domain/entities/coin.dart';
import 'package:crypto_wallet/modules/coin/domain/repositories/coin_repository.dart';

class GetCoinsPaginated
    implements UseCase<List<Coin>, GetCoinsPaginatedParams> {
  final CoinRepository repository;

  GetCoinsPaginated({required this.repository});

  @override
  Future<Either<Failure, List<Coin>>> call(
      GetCoinsPaginatedParams params) async {
    return await repository.getCoinsPaginated(pageNumber: params.pageNumber);
  }
}

class GetCoinsPaginatedParams extends Equatable {
  final int pageNumber;

  const GetCoinsPaginatedParams({required this.pageNumber});

  @override
  List<Object?> get props => [pageNumber];
}
