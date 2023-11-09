// Package imports:
import 'package:dartz/dartz.dart';

// Project imports:
import 'package:crypto_wallet/core/domain/usecases/usecase.dart';
import 'package:crypto_wallet/core/errors/failures.dart';
import 'package:crypto_wallet/modules/auth/domain/entities/user_wallet.dart';

class GetUserWallets extends UseCase<List<UserWallet>, GetUserWalletsParams> {
  @override
  Future<Either<Failure, List<UserWallet>>> call(GetUserWalletsParams params) {
    throw UnimplementedError();
  }
}

class GetUserWalletsParams {
  final String userId;

  GetUserWalletsParams({
    required this.userId,
  });
}
