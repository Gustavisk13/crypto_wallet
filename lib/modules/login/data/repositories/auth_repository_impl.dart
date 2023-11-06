// Package imports:
import 'package:dartz/dartz.dart';

// Project imports:
import 'package:crypto_wallet/core/errors/exceptions.dart';
import 'package:crypto_wallet/core/errors/failures.dart';
import 'package:crypto_wallet/core/network/network_info.dart';
import 'package:crypto_wallet/modules/login/data/datasources/auth_local_datasource.dart';
import 'package:crypto_wallet/modules/login/data/datasources/auth_remote_datasource.dart';
import 'package:crypto_wallet/modules/login/domain/entities/user.dart';
import 'package:crypto_wallet/modules/login/domain/repositories/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource remoteDataSource;
  final AuthLocalDataSource localDataSource;
  final NetworkInfo networkInfo;

  AuthRepositoryImpl({
    required this.remoteDataSource,
    required this.localDataSource,
    required this.networkInfo,
  });

  @override
  Future<Either<Failure, User>> register(
      {required String username,
      required String password,
      String? name}) async {
    if (await networkInfo.isConnected) {
      try {
        final user = await remoteDataSource.register(
          username: username,
          password: password,
          name: name ?? username,
        );

        await localDataSource.cacheUser(user);

        return Right(user);
      } on ServerException catch (e) {
        return Left(ServerFailure(
          message: e.message,
          statusCode: e.statusCode,
        ));
      } on CacheException {
        return Left(
          CacheFailure(),
        );
      }
    } else {
      return Left(
        NetworkFailure(),
      );
    }
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
