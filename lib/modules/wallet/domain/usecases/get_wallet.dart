// Package imports:
import 'package:dartz/dartz.dart';

// Project imports:
import 'package:crypto_wallet/core/domain/usecases/usecase.dart';
import 'package:crypto_wallet/core/errors/failures.dart';
import 'package:crypto_wallet/modules/wallet/domain/entities/wallet.dart';

class GetWallet extends UseCase<Wallet, GetWalletParams> {
  @override
  Future<Either<Failure, Wallet>> call(GetWalletParams params) {
    throw UnimplementedError();
  }
}

class GetWalletParams {
  final String walletId;

  GetWalletParams({
    required this.walletId,
  });
}
