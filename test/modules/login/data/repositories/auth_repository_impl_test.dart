// Package imports:
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

// Project imports:
import 'package:crypto_wallet/core/network/network_info.dart';
import 'package:crypto_wallet/modules/login/data/datasources/auth_local_datasource.dart';
import 'package:crypto_wallet/modules/login/data/datasources/auth_remote_datasource.dart';
import 'package:crypto_wallet/modules/login/data/models/user_model.dart';
import 'package:crypto_wallet/modules/login/data/models/user_wallet_model.dart';
import 'package:crypto_wallet/modules/login/data/repositories/auth_repository_impl.dart';

class MockAuthRemoteDataSource extends Mock implements AuthRemoteDataSource {}

class MockAuthLocalDataSource extends Mock implements AuthLocalDataSource {}

class MockNetworkInfo extends Mock implements NetworkInfo {}

void main() {
  late AuthRepositoryImpl repository;
  late MockAuthRemoteDataSource mockRemoteDataSource;
  late MockAuthLocalDataSource mockLocalDataSource;
  late MockNetworkInfo mockNetworkInfo;

  setUpAll(() {
    mockRemoteDataSource = MockAuthRemoteDataSource();
    mockLocalDataSource = MockAuthLocalDataSource();
    mockNetworkInfo = MockNetworkInfo();
    repository = AuthRepositoryImpl(
      remoteDataSource: mockRemoteDataSource,
      localDataSource: mockLocalDataSource,
      networkInfo: mockNetworkInfo,
    );

    registerFallbackValue(
      UserModel(
        id: 1,
        name: 'Usuário teste',
        username: 'teste@email.com',
        token: 'token',
        wallets: [
          UserWalletModel(
            id: 1,
            description: 'Carteira Teste 2',
            userId: 1,
            createdAt: DateTime.parse('2023-11-03T23:03:30.990Z'),
            updatedAt: DateTime.parse('2023-11-03T23:03:30.990Z'),
          ),
          UserWalletModel(
            id: 2,
            description: 'Carteira Teste 2',
            userId: 1,
            createdAt: DateTime.parse('2023-11-03T23:03:35.757Z'),
            updatedAt: DateTime.parse('2023-11-03T23:03:35.757Z'),
          ),
        ],
        createdAt: DateTime.parse('2023-11-01T15:05:27.045Z'),
        updatedAt: DateTime.parse('2023-11-01T15:05:27.045Z'),
      ),
    );
  });

  group('register', () {
    const String tUserName = 'teste@mail.com';
    const String tPassword = '123456';
    const String tName = 'Usuário teste';

    final UserModel tUserModel = UserModel(
      id: 1,
      name: 'Usuário teste',
      username: 'teste@email.com',
      token: 'token',
      wallets: [
        UserWalletModel(
          id: 1,
          description: 'Carteira Teste 2',
          userId: 1,
          createdAt: DateTime.parse('2023-11-03T23:03:30.990Z'),
          updatedAt: DateTime.parse('2023-11-03T23:03:30.990Z'),
        ),
        UserWalletModel(
          id: 2,
          description: 'Carteira Teste 2',
          userId: 1,
          createdAt: DateTime.parse('2023-11-03T23:03:35.757Z'),
          updatedAt: DateTime.parse('2023-11-03T23:03:35.757Z'),
        ),
      ],
      createdAt: DateTime.parse('2023-11-01T15:05:27.045Z'),
      updatedAt: DateTime.parse('2023-11-01T15:05:27.045Z'),
    );

    test('should check if the device is online', () async {
      when(() => mockNetworkInfo.isConnected).thenAnswer((_) async => true);

      when(
        () => mockRemoteDataSource.register(
          name: any(named: 'name'),
          username: any(named: 'username'),
          password: any(named: 'password'),
        ),
      ).thenAnswer((_) async => tUserModel);

      when(() => mockLocalDataSource.cacheUser(any())).thenAnswer((_) async {});

      await repository.register(
        username: tUserName,
        password: tPassword,
        name: tName,
      );

      verify(() => mockNetworkInfo.isConnected);
      verifyNoMoreInteractions(mockNetworkInfo);

      clearInteractions(mockNetworkInfo);
      clearInteractions(mockRemoteDataSource);
      clearInteractions(mockLocalDataSource);
    });

    group('device is online', () {
      setUp(() {
        when(() => mockNetworkInfo.isConnected).thenAnswer((_) async => true);
      });

      test(
          'should return remote data when the call to remote data source is successful',
          () async {
        when(() => mockRemoteDataSource.register(
              name: any(named: 'name'),
              username: any(named: 'username'),
              password: any(named: 'password'),
            )).thenAnswer((_) async => tUserModel);

        final result = await repository.register(
          username: tUserName,
          password: tPassword,
          name: tName,
        );

        expect(result, equals(Right(tUserModel)));

        verify(() => mockRemoteDataSource.register(
              name: tName,
              username: tUserName,
              password: tPassword,
            ));
      });
    });
  });
}
