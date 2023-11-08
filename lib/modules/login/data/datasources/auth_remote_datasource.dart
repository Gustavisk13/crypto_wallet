// Dart imports:
import 'dart:convert';

// Package imports:
import 'package:http/http.dart' as http;

// Project imports:
import 'package:crypto_wallet/core/config/environment_config.dart';
import 'package:crypto_wallet/core/errors/exceptions.dart';
import 'package:crypto_wallet/injection_container.dart';
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

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final http.Client client;

  final EnvironmentConfig env = getIt<EnvironmentConfig>();

  AuthRemoteDataSourceImpl({required this.client});

  @override
  Future<UserModel> register(
      {required String name,
      required String username,
      required String password}) async {
    return await _post(
      body: {
        "name": name,
        "username": username,
        "password": password,
      },
      endpoint: 'users',
    );
  }

  @override
  Future<UserModel> signIn(
      {required String username, required String password}) async {
    return await _post(
      body: {
        "username": username,
        "password": password,
      },
      endpoint: 'login',
    );
  }

  Future<UserModel> _post(
      {required String endpoint, required Map<String, dynamic> body}) async {
    final response = await client.post(
      Uri.parse('${env.apiBaseUrl}/$endpoint'),
      headers: {
        'Content-Type': 'application/json',
      },
      body: jsonEncode(body),
    );

    if (response.statusCode != 200) {
      throw ServerException(
        message: response.body,
        statusCode: response.statusCode,
      );
    }

    return UserModel.fromJson(jsonDecode(response.body));
  }
}
