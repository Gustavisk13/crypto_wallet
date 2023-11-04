// Package imports:
import 'package:dartz/dartz.dart';

// Project imports:
import 'package:crypto_wallet/core/errors/failures.dart';
import 'package:crypto_wallet/modules/login/domain/entities/user.dart';
import 'package:crypto_wallet/modules/login/domain/repositories/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  @override
  Future<Either<Failure, User>> register(
      {required String username, required String password, String? name}) {
    // TODO: implement register
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, User>> signIn(
      {required String username, required String password}) {
    // TODO: implement signIn
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, void>> signOut() {
    // TODO: implement signOut
    throw UnimplementedError();
  }
}
