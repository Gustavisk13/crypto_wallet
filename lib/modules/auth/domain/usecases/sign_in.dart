// Package imports:
import 'package:dartz/dartz.dart';

// Project imports:
import 'package:crypto_wallet/core/domain/usecases/usecase.dart';
import 'package:crypto_wallet/core/errors/failures.dart';
import 'package:crypto_wallet/modules/auth/domain/entities/user.dart';
import 'package:crypto_wallet/modules/auth/domain/repositories/auth_repository.dart';

class SignIn extends UseCase<User, AuthParams> {
  final AuthRepository repository;

  SignIn({
    required this.repository,
  });

  @override
  Future<Either<Failure, User>> call(AuthParams params) async {
    return await repository.signIn(
      username: params.username,
      password: params.password,
    );
  }
}
