// Dart imports:
import 'dart:convert';

// Package imports:
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:mocktail/mocktail.dart';

// Project imports:
import 'package:crypto_wallet/core/config/environment_config.dart';
import 'package:crypto_wallet/core/errors/exceptions.dart';
import 'package:crypto_wallet/injection_container.dart';
import 'package:crypto_wallet/modules/auth/data/datasources/auth_remote_datasource.dart';
import 'package:crypto_wallet/modules/auth/data/models/user_model.dart';
import '../../../../fixtures/fixture_reader.dart';

class MockHttpClient extends Mock implements http.Client {}

void main() {
  late MockHttpClient mockHttpClient;
  late AuthRemoteDataSourceImpl dataSource;
  late EnvironmentConfig env;

  setUpAll(() {
    env = EnvironmentConfig(
      apiBaseUrl: 'https://api.test.com',
    );
    GetIt.I.registerSingleton<EnvironmentConfig>(env);
    mockHttpClient = MockHttpClient();
    dataSource = AuthRemoteDataSourceImpl(client: mockHttpClient);
  });

  tearDownAll(() {
    getIt.reset();
  });

  test('verify environment vars', () {
    final env = getIt<EnvironmentConfig>();

    expect(env.apiBaseUrl, equals(env.apiBaseUrl));
  });

  group('register', () {
    const String name = 'name';
    const String username = 'username';
    const String password = 'password';

    final String tUserJson = fixture('user/user.json');

    final tUserModel = UserModel.fromJson(jsonDecode(tUserJson));

    test(
        'should perform a POST request on a URL with number being the endpoint and with application/json header',
        () async {
      // arrange
      when(() => mockHttpClient.post(
            Uri.parse('${env.apiBaseUrl}/users'),
            headers: any(named: 'headers'),
            body: any(named: 'body'),
          )).thenAnswer((_) async => http.Response(tUserJson, 200));
      // act
      await dataSource.register(
        name: name,
        username: username,
        password: password,
      );
      // assert
      verify(() => mockHttpClient.post(
            Uri.parse('${env.apiBaseUrl}/users'),
            headers: {
              'Content-Type': 'application/json',
            },
            body: any(named: 'body'),
          ));
    });

    test('should return UserModel when the response code is 200 (success)',
        () async {
      // arrange
      when(() => mockHttpClient.post(
            Uri.parse('${env.apiBaseUrl}/users'),
            headers: any(named: 'headers'),
            body: any(named: 'body'),
          )).thenAnswer((_) async => http.Response(tUserJson, 200));
      // act
      final result = await dataSource.register(
        name: name,
        username: username,
        password: password,
      );
      // assert
      expect(result, equals(tUserModel));
    });

    test(
        'should throw a ServerException when the response code is 404 or other',
        () async {
      // arrange
      when(() => mockHttpClient.post(
                Uri.parse('${env.apiBaseUrl}/users'),
                headers: any(named: 'headers'),
                body: any(named: 'body'),
              ))
          .thenAnswer((_) async => http.Response('Something went wrong', 404));
      // act
      final call = dataSource.register;
      // assert
      expect(
          () => call(
                name: name,
                username: username,
                password: password,
              ),
          throwsA(const TypeMatcher<ServerException>()));
    });
  });

  group('signIn', () {
    const String username = 'username';
    const String password = 'password';

    final String tUserJson = fixture('user/user.json');

    final tUserModel = UserModel.fromJson(jsonDecode(tUserJson));

    test(
        'should perform a POST request on a URL with number being the endpoint and with application/json header',
        () async {
      // arrange
      when(() => mockHttpClient.post(
            Uri.parse('${env.apiBaseUrl}/login'),
            headers: any(named: 'headers'),
            body: any(named: 'body'),
          )).thenAnswer((_) async => http.Response(tUserJson, 200));
      // act
      await dataSource.signIn(
        username: username,
        password: password,
      );
      // assert
      verify(() => mockHttpClient.post(
            Uri.parse('${env.apiBaseUrl}/login'),
            headers: {
              'Content-Type': 'application/json',
            },
            body: any(named: 'body'),
          ));
    });

    test('should return UserModel when the response code is 200 (success)',
        () async {
      // arrange
      when(() => mockHttpClient.post(
            Uri.parse('${env.apiBaseUrl}/login'),
            headers: any(named: 'headers'),
            body: any(named: 'body'),
          )).thenAnswer((_) async => http.Response(tUserJson, 200));
      // act
      final result = await dataSource.signIn(
        username: username,
        password: password,
      );
      // assert
      expect(result, equals(tUserModel));
    });

    test(
        'should throw a ServerException when the response code is 404 or other',
        () async {
      // arrange
      when(() => mockHttpClient.post(
                Uri.parse('${env.apiBaseUrl}/login'),
                headers: any(named: 'headers'),
                body: any(named: 'body'),
              ))
          .thenAnswer((_) async => http.Response('Something went wrong', 404));
      // act
      final call = dataSource.signIn;
      // assert
      expect(
          () => call(
                username: username,
                password: password,
              ),
          throwsA(const TypeMatcher<ServerException>()));
    });
  });
}
