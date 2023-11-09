// Package imports:
import 'package:dartz/dartz.dart';

// Project imports:
import 'package:crypto_wallet/core/errors/failures.dart';
import 'package:crypto_wallet/modules/auth/domain/entities/user_wallet.dart';
import 'package:crypto_wallet/modules/wallet/domain/entities/wallet.dart';

abstract class WalletRepository {
  Future<Either<Failure, Wallet>> getWallet({required String walletId});

  Future<Either<Failure, List<UserWallet>>> getUserWallets({
    required String userId,
  });

  Future<Either<Failure, Wallet>> createWallet({
    required String userId,
    required String description,
    required List<String> coinAssetIds,
  });

  Future<Either<Failure, Wallet>> updateWallet({
    required String walletId,
    required String description,
    required List<String> coinAssetIds,
  });

  Future<Either<Failure, void>> deleteWallet({
    required String walletId,
  });
}
