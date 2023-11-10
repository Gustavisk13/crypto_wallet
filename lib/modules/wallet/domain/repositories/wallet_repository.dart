// Package imports:
import 'package:dartz/dartz.dart';

// Project imports:
import 'package:crypto_wallet/core/errors/failures.dart';
import 'package:crypto_wallet/modules/wallet/domain/entities/wallet.dart';

abstract class WalletRepository {
  Future<Either<Failure, Wallet>> getWallet({required int walletId});

  Future<Either<Failure, List<Wallet>>> getWallets({
    required int userId,
  });

  Future<Either<Failure, Wallet>> createWallet({
    required int userId,
    required String description,
    required List<String> coinAssetIds,
  });

  Future<Either<Failure, Wallet>> updateWallet({
    required int walletId,
    required String description,
    required List<String> coinAssetIds,
  });

  Future<Either<Failure, void>> deleteWallet({
    required int walletId,
  });
}
