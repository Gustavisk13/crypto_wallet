// Package imports:
import 'package:dartz/dartz.dart';

// Project imports:
import 'package:crypto_wallet/core/errors/failures.dart';
import 'package:crypto_wallet/modules/login/domain/entities/user.dart';

abstract class AuthRepository {
  Future<Either<Failure, User>> signIn(
      {required String username, required String password});
  Future<Either<Failure, User>> register(
      {required String username, required String password, String? name});
  Future<Either<Failure, void>> signOut();
}
