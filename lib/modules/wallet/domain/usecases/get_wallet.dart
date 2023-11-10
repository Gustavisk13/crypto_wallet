// Package imports:
import 'package:dartz/dartz.dart';

// Project imports:
import 'package:crypto_wallet/core/domain/usecases/usecase.dart';
import 'package:crypto_wallet/core/errors/failures.dart';
import 'package:crypto_wallet/modules/wallet/domain/entities/wallet.dart';
import 'package:crypto_wallet/modules/wallet/domain/repositories/wallet_repository.dart';

class GetWallet extends UseCase<Wallet, GetWalletParams> {
  final WalletRepository repository;

  GetWallet({
    required this.repository,
  });

  @override
  Future<Either<Failure, Wallet>> call(GetWalletParams params) async {
    return await repository.getWallet(walletId: params.walletId);
  }
}

class GetWalletParams {
  final int walletId;

  GetWalletParams({
    required this.walletId,
  });
}
