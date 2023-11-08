// Package imports:
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

// Project imports:
import 'package:crypto_wallet/core/errors/exceptions.dart';
import 'package:crypto_wallet/core/errors/failures.dart';
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
      wallets: const [],
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

        clearInteractions(mockRemoteDataSource);
        clearInteractions(mockLocalDataSource);
      });

      test(
          'should return server failure when the call to remote data source is unsuccessful',
          () async {
        when(() => mockRemoteDataSource.register(
                  name: any(named: 'name'),
                  username: any(named: 'username'),
                  password: any(named: 'password'),
                ))
            .thenThrow(
                ServerException(message: 'Server error', statusCode: 500));

        final result = await repository.register(
          username: tUserName,
          password: tPassword,
          name: tName,
        );

        verify(() => mockRemoteDataSource.register(
              name: tName,
              username: tUserName,
              password: tPassword,
            ));

        verifyZeroInteractions(mockLocalDataSource);

        expect(
          result,
          equals(
            Left(
              ServerFailure(message: 'Server error', statusCode: 500),
            ),
          ),
        );
      });

      test(
          'should cache the user locally when the call to remote data source is successful',
          () async {
        when(() => mockRemoteDataSource.register(
              name: any(named: 'name'),
              username: any(named: 'username'),
              password: any(named: 'password'),
            )).thenAnswer((_) async => tUserModel);

        when(() => mockLocalDataSource.cacheUser(any()))
            .thenAnswer((_) async {});

        await repository.register(
          username: tUserName,
          password: tPassword,
          name: tName,
        );

        verify(() => mockRemoteDataSource.register(
              name: tName,
              username: tUserName,
              password: tPassword,
            ));

        verify(() => mockLocalDataSource.cacheUser(tUserModel));

        clearInteractions(mockRemoteDataSource);
        clearInteractions(mockLocalDataSource);
      });

      test(
          'should return cache failure when the call to local data source is unsuccessful',
          () async {
        when(() => mockRemoteDataSource.register(
              name: any(named: 'name'),
              username: any(named: 'username'),
              password: any(named: 'password'),
            )).thenAnswer((_) async => tUserModel);

        when(() => mockLocalDataSource.cacheUser(any()))
            .thenThrow(CacheException());

        final result = await repository.register(
          username: tUserName,
          password: tPassword,
          name: tName,
        );

        verify(() => mockRemoteDataSource.register(
              name: tName,
              username: tUserName,
              password: tPassword,
            ));

        verify(() => mockLocalDataSource.cacheUser(tUserModel));

        expect(
          result,
          equals(
            Left(
              CacheFailure(),
            ),
          ),
        );

        verifyNoMoreInteractions(mockRemoteDataSource);
        verifyNoMoreInteractions(mockLocalDataSource);

        clearInteractions(mockRemoteDataSource);
        clearInteractions(mockLocalDataSource);
      });
    });

    group('device is offline', () {
      setUp(() {
        when(() => mockNetworkInfo.isConnected).thenAnswer((_) async => false);
      });

      test('should return device offline failure when the device is offline',
          () async {
        final result = await repository.register(
          username: tUserName,
          password: tPassword,
          name: tName,
        );

        verifyZeroInteractions(mockRemoteDataSource);
        verifyZeroInteractions(mockLocalDataSource);

        expect(
          result,
          equals(
            Left(
              DeviceOfflineFailure(),
            ),
          ),
        );
      });
    });
  });

  group('sign in', () {
    const String tUserName = 'teste@mail.com';
    const String tPassword = '123456';

    final UserModel tUserModel = UserModel(
      id: 1,
      name: 'Usuário teste',
      username: 'teste@email.com',
      token: 'token',
      wallets: const [],
      createdAt: DateTime.parse('2023-11-01T15:05:27.045Z'),
      updatedAt: DateTime.parse('2023-11-01T15:05:27.045Z'),
    );

    test('should check if the device is online', () async {
      when(() => mockNetworkInfo.isConnected).thenAnswer((_) async => true);

      when(
        () => mockRemoteDataSource.signIn(
          username: any(named: 'username'),
          password: any(named: 'password'),
        ),
      ).thenAnswer((_) async => tUserModel);

      when(() => mockLocalDataSource.cacheUser(any())).thenAnswer((_) async {});

      await repository.signIn(
        username: tUserName,
        password: tPassword,
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
        when(() => mockRemoteDataSource.signIn(
              username: any(named: 'username'),
              password: any(named: 'password'),
            )).thenAnswer((_) async => tUserModel);

        final result = await repository.signIn(
          username: tUserName,
          password: tPassword,
        );

        expect(result, equals(Right(tUserModel)));

        verify(() => mockRemoteDataSource.signIn(
              username: tUserName,
              password: tPassword,
            ));

        clearInteractions(mockRemoteDataSource);
        clearInteractions(mockLocalDataSource);
      });

      test(
          'should return server failure when the call to remote data source is unsuccessful',
          () async {
        when(() => mockRemoteDataSource.signIn(
                  username: any(named: 'username'),
                  password: any(named: 'password'),
                ))
            .thenThrow(
                ServerException(message: 'Server error', statusCode: 500));

        final result = await repository.signIn(
          username: tUserName,
          password: tPassword,
        );

        verify(() => mockRemoteDataSource.signIn(
              username: tUserName,
              password: tPassword,
            ));

        verifyZeroInteractions(mockLocalDataSource);

        expect(
          result,
          equals(
            Left(
              ServerFailure(message: 'Server error', statusCode: 500),
            ),
          ),
        );
      });

      test(
          'should cache the user locally when the call to remote data source is successful',
          () async {
        when(() => mockRemoteDataSource.signIn(
              username: any(named: 'username'),
              password: any(named: 'password'),
            )).thenAnswer((_) async => tUserModel);

        when(() => mockLocalDataSource.cacheUser(any()))
            .thenAnswer((_) async {});

        await repository.signIn(
          username: tUserName,
          password: tPassword,
        );

        verify(() => mockRemoteDataSource.signIn(
              username: tUserName,
              password: tPassword,
            ));
      });

      test(
          'should return cache failure when the call to local data source is unsuccessful',
          () async {
        when(() => mockRemoteDataSource.signIn(
              username: any(named: 'username'),
              password: any(named: 'password'),
            )).thenAnswer((_) async => tUserModel);

        when(() => mockLocalDataSource.cacheUser(any()))
            .thenThrow(CacheException());

        final result = await repository.signIn(
          username: tUserName,
          password: tPassword,
        );

        verify(() => mockRemoteDataSource.signIn(
              username: tUserName,
              password: tPassword,
            ));

        verify(() => mockLocalDataSource.cacheUser(tUserModel));

        expect(
          result,
          equals(
            Left(
              CacheFailure(),
            ),
          ),
        );

        verifyNoMoreInteractions(mockRemoteDataSource);
        verifyNoMoreInteractions(mockLocalDataSource);
      });
    });
  });

  group('sign out', () {
    test('should call local data source', () async {
      when(() => mockLocalDataSource.removeCachedUser())
          .thenAnswer((_) async {});

      await repository.signOut();

      verify(() => mockLocalDataSource.removeCachedUser());
    });
    test(
        'should return cache failure when the call to local data source is unsuccessful',
        () async {
      when(() => mockLocalDataSource.removeCachedUser())
          .thenThrow(CacheException());

      final result = await repository.signOut();

      verify(() => mockLocalDataSource.removeCachedUser());

      expect(
        result,
        equals(
          Left(
            CacheFailure(),
          ),
        ),
      );

      verifyNoMoreInteractions(mockLocalDataSource);
    });
  });
}
