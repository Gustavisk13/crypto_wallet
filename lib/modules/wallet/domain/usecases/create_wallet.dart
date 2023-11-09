// Package imports:
import 'package:dartz/dartz.dart';

// Project imports:
import 'package:crypto_wallet/core/domain/usecases/usecase.dart';
import 'package:crypto_wallet/core/errors/failures.dart';
import 'package:crypto_wallet/modules/wallet/domain/entities/wallet.dart';

class CreateWallet extends UseCase<Wallet, CreateWalletParams> {
  @override
  Future<Either<Failure, Wallet>> call(CreateWalletParams params) {
    throw UnimplementedError();
  }
}

class CreateWalletParams {
  final String userId;
  final String description;
  final List<String> coinAssetIds;

  CreateWalletParams({
    required this.userId,
    required this.description,
    required this.coinAssetIds,
  });
}
