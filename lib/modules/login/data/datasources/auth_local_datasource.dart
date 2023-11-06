// Project imports:
import 'package:crypto_wallet/modules/login/data/models/user_model.dart';

abstract class AuthLocalDataSource {
  /// Gets the cached [UserModel] which was gotten the last time
  /// the user was logged in.
  ///
  /// Throws a [CacheException] if no cached data is present.
  Future<UserModel> getLastUser();

  /// Caches the [UserModel] to local storage.
  ///
  /// Throws a [CacheException] if an error occurs.
  Future<void> cacheUser(UserModel userToCache);

  /// Removes the cached [UserModel] from local storage.
  ///
  /// Throws a [CacheException] if an error occurs.
  Future<void> removeCachedUser();
}
