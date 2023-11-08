// Dart imports:
import 'dart:convert';

// Package imports:
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:shared_preferences/shared_preferences.dart';

// Project imports:
import 'package:crypto_wallet/core/errors/exceptions.dart';
import 'package:crypto_wallet/modules/login/data/datasources/auth_local_datasource.dart';
import 'package:crypto_wallet/modules/login/data/models/user_model.dart';
import '../../../../fixtures/fixture_reader.dart';

class MockSharedPreferences extends Mock implements SharedPreferences {}

void main() {
  late MockSharedPreferences mockSharedPreferences;
  late AuthLocalDataSourceImpl datasource;

  setUpAll(() {
    mockSharedPreferences = MockSharedPreferences();
    datasource =
        AuthLocalDataSourceImpl(sharedPreferences: mockSharedPreferences);
  });

  group('getLastUser', () {
    final UserModel tUserModel =
        UserModel.fromJson(jsonDecode(fixture('user/user.json')));

    test(
        'should return user from SharedPreferences when there is one in the cache',
        () async {
      // arrange
      when(() => mockSharedPreferences.getString(any()))
          .thenReturn(fixture('user/user.json'));
      // act
      final result = await datasource.getLastUser();

      // assert
      verify(() => mockSharedPreferences.getString('CACHED_USER'));
      expect(result, equals(tUserModel));
    });

    test('should throw a CacheException when there is not a cached value',
        () async {
      // arrange
      when(() => mockSharedPreferences.getString(any())).thenReturn(null);

      // act
      final call = datasource.getLastUser;

      // assert
      expect(() => call(), throwsA(const TypeMatcher<CacheException>()));
    });
  });

  group('cacheUser', () {
    final UserModel tUserModel = UserModel(
      id: 1,
      name: 'Usuário teste',
      username: 'teste@email.com',
      token: 'token',
      wallets: const [],
      createdAt: DateTime.parse('2023-11-01T15:05:27.045Z'),
      updatedAt: DateTime.parse('2023-11-01T15:05:27.045Z'),
    );

    test('should call SharedPreferences to cache the data', () async {
      when(() => mockSharedPreferences.setString(any(), any()))
          .thenAnswer((_) async => true);

      // act
      await datasource.cacheUser(tUserModel);

      // assert
      final expectedJsonString = jsonEncode(tUserModel.toJson());
      verify(() =>
          mockSharedPreferences.setString('CACHED_USER', expectedJsonString));
    });

    test('should throw a CacheException when the cache is not successful',
        () async {
      when(() => mockSharedPreferences.setString(any(), any()))
          .thenAnswer((_) async => false);

      // act
      final call = datasource.cacheUser;

      // assert
      expect(
          () => call(tUserModel), throwsA(const TypeMatcher<CacheException>()));
    });
  });

  group('removeCachedUser', () {
    test('should call SharedPreferences to remove the data', () async {
      when(() => mockSharedPreferences.remove(any()))
          .thenAnswer((_) async => true);

      // act
      await datasource.removeCachedUser();

      // assert
      verify(() => mockSharedPreferences.remove('CACHED_USER'));
    });

    test('should throw a CacheException when the remove is not successful',
        () async {
      when(() => mockSharedPreferences.remove(any()))
          .thenAnswer((_) async => false);

      // act
      final call = datasource.removeCachedUser;

      // assert
      expect(() => call(), throwsA(const TypeMatcher<CacheException>()));
    });
  });
}
