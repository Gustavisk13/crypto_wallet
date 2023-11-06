// Project imports:
import 'package:crypto_wallet/modules/login/data/models/user_model.dart';

abstract class AuthRemoteDataSource {
  /// Calls the /login endpoint.
  ///
  /// Throws a [ServerException] for all error codes.
  Future<UserModel> signIn(
      {required String username, required String password});

  /// Calls the /users with POST method.
  ///
  /// Throws a [ServerException] for all error codes.
  Future<UserModel> register({
    required String name,
    required String username,
    required String password,
  });
}
