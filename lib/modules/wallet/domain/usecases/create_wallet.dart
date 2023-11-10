// Package imports:
import 'package:dartz/dartz.dart';

// Project imports:
import 'package:crypto_wallet/core/domain/usecases/usecase.dart';
import 'package:crypto_wallet/core/errors/failures.dart';
import 'package:crypto_wallet/modules/wallet/domain/entities/wallet.dart';
import 'package:crypto_wallet/modules/wallet/domain/repositories/wallet_repository.dart';

class CreateWallet extends UseCase<Wallet, CreateWalletParams> {
  final WalletRepository repository;

  CreateWallet({
    required this.repository,
  });
  @override
  Future<Either<Failure, Wallet>> call(CreateWalletParams params) async {
    return await repository.createWallet(
      userId: params.userId,
      description: params.description,
      coinAssetIds: params.coinAssetIds,
    );
  }
}

class CreateWalletParams {
  final int userId;
  final String description;
  final List<String> coinAssetIds;

  CreateWalletParams({
    required this.userId,
    required this.description,
    required this.coinAssetIds,
  });
}
