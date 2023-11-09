// Package imports:
import 'package:dartz/dartz.dart';

// Project imports:
import 'package:crypto_wallet/core/domain/usecases/usecase.dart';
import 'package:crypto_wallet/core/errors/failures.dart';
import 'package:crypto_wallet/modules/auth/domain/repositories/auth_repository.dart';

class SignOut extends UseCase<void, NoParams> {
  final AuthRepository repository;

  SignOut({
    required this.repository,
  });

  @override
  Future<Either<Failure, void>> call(NoParams params) async {
    return await repository.signOut();
  }
}
