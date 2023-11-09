// Package imports:
import 'package:dartz/dartz.dart';

// Project imports:
import 'package:crypto_wallet/core/domain/usecases/usecase.dart';
import 'package:crypto_wallet/core/errors/failures.dart';
import 'package:crypto_wallet/modules/wallet/domain/entities/wallet.dart';

class UpdateWallet extends UseCase<Wallet, UpdateWalletParams> {
  @override
  Future<Either<Failure, Wallet>> call(UpdateWalletParams params) {
    throw UnimplementedError();
  }
}

class UpdateWalletParams {
  final String walletId;
  final String description;
  final List<String> coinAssetIds;

  UpdateWalletParams({
    required this.walletId,
    required this.description,
    required this.coinAssetIds,
  });
}
