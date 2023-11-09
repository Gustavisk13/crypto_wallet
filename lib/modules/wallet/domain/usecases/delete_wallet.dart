// Package imports:
import 'package:dartz/dartz.dart';

// Project imports:
import 'package:crypto_wallet/core/domain/usecases/usecase.dart';
import 'package:crypto_wallet/core/errors/failures.dart';

class DeleteWallet extends UseCase<void, DeleteWalletParams> {
  @override
  Future<Either<Failure, void>> call(DeleteWalletParams params) {
    throw UnimplementedError();
  }
}

class DeleteWalletParams {
  final String walletId;

  DeleteWalletParams({
    required this.walletId,
  });
}
