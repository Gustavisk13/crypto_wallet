// Package imports:
import 'package:dartz/dartz.dart';

// Project imports:
import 'package:crypto_wallet/core/domain/usecases/usecase.dart';
import 'package:crypto_wallet/core/errors/failures.dart';
import 'package:crypto_wallet/modules/wallet/domain/repositories/wallet_repository.dart';

class DeleteWallet extends UseCase<void, DeleteWalletParams> {
  final WalletRepository repository;

  DeleteWallet({
    required this.repository,
  });
  @override
  Future<Either<Failure, void>> call(DeleteWalletParams params) async {
    return await repository.deleteWallet(walletId: params.walletId);
  }
}

class DeleteWalletParams {
  final int walletId;

  DeleteWalletParams({
    required this.walletId,
  });
}
