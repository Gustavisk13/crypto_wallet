// Package imports:
import 'package:dartz/dartz.dart';

// Project imports:
import 'package:crypto_wallet/core/domain/usecases/usecase.dart';
import 'package:crypto_wallet/core/errors/failures.dart';
import 'package:crypto_wallet/modules/auth/domain/entities/user.dart';
import 'package:crypto_wallet/modules/auth/domain/repositories/auth_repository.dart';

class Register extends UseCase<User, AuthParams> {
  final AuthRepository repository;

  Register({
    required this.repository,
  });

  @override
  Future<Either<Failure, User>> call(AuthParams params) {
    return repository.register(
      username: params.username,
      password: params.password,
      name: params.name,
    );
  }
}
