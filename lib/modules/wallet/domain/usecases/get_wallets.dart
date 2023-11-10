// Package imports:
import 'package:dartz/dartz.dart';

// Project imports:
import 'package:crypto_wallet/core/domain/usecases/usecase.dart';
import 'package:crypto_wallet/core/errors/failures.dart';
import 'package:crypto_wallet/modules/wallet/domain/entities/wallet.dart';
import 'package:crypto_wallet/modules/wallet/domain/repositories/wallet_repository.dart';

class GetWallets extends UseCase<List<Wallet>, GetWalletsParams> {
  final WalletRepository repository;

  GetWallets({
    required this.repository,
  });
  @override
  Future<Either<Failure, List<Wallet>>> call(GetWalletsParams params) async {
    return await repository.getWallets(userId: params.userId);
  }
}

class GetWalletsParams {
  final int userId;

  GetWalletsParams({
    required this.userId,
  });
}
