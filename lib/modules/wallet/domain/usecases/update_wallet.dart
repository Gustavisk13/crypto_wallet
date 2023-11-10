// Package imports:
import 'package:dartz/dartz.dart';

// Project imports:
import 'package:crypto_wallet/core/domain/usecases/usecase.dart';
import 'package:crypto_wallet/core/errors/failures.dart';
import 'package:crypto_wallet/modules/wallet/domain/entities/wallet.dart';
import 'package:crypto_wallet/modules/wallet/domain/repositories/wallet_repository.dart';

class UpdateWallet extends UseCase<Wallet, UpdateWalletParams> {
  final WalletRepository repository;

  UpdateWallet({
    required this.repository,
  });
  @override
  Future<Either<Failure, Wallet>> call(UpdateWalletParams params) async {
    return await repository.updateWallet(
      walletId: params.walletId,
      description: params.description,
      coinAssetIds: params.coinAssetIds,
    );
  }
}

class UpdateWalletParams {
  final int walletId;
  final String description;
  final List<String> coinAssetIds;

  UpdateWalletParams({
    required this.walletId,
    required this.description,
    required this.coinAssetIds,
  });
}
