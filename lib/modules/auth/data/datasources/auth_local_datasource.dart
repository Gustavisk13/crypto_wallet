// Dart imports:
import 'dart:convert';

// Package imports:
import 'package:shared_preferences/shared_preferences.dart';

// Project imports:
import 'package:crypto_wallet/core/errors/exceptions.dart';
import 'package:crypto_wallet/modules/auth/data/models/user_model.dart';

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

class AuthLocalDataSourceImpl implements AuthLocalDataSource {
  final SharedPreferences sharedPreferences;

  AuthLocalDataSourceImpl({required this.sharedPreferences});

  @override
  Future<UserModel> getLastUser() {
    final jsonString = sharedPreferences.getString('CACHED_USER');

    if (jsonString != null) {
      return Future.value(UserModel.fromJson(jsonDecode(jsonString)));
    } else {
      throw CacheException();
    }
  }

  @override
  Future<void> cacheUser(UserModel userToCache) async {
    final success = await sharedPreferences.setString(
        'CACHED_USER', jsonEncode(userToCache.toJson()));

    if (!success) {
      throw CacheException();
    }
  }

  @override
  Future<void> removeCachedUser() async {
    final success = await sharedPreferences.remove('CACHED_USER');

    if (!success) {
      throw CacheException();
    }
  }
}
