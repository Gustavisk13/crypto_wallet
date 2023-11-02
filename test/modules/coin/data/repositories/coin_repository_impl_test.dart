// Package imports:
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

// Project imports:
import 'package:crypto_wallet/core/errors/exceptions.dart';
import 'package:crypto_wallet/core/errors/failures.dart';
import 'package:crypto_wallet/core/platform/network_info.dart';
import 'package:crypto_wallet/modules/coin/data/datasources/coin_local_datasource.dart';
import 'package:crypto_wallet/modules/coin/data/datasources/coin_remote_datasource.dart';
import 'package:crypto_wallet/modules/coin/data/models/coin_model.dart';
import 'package:crypto_wallet/modules/coin/data/repositories/coin_repository_impl.dart';
import 'package:crypto_wallet/modules/coin/domain/entities/coin.dart';

class MockRemoteDataSource extends Mock implements CoinRemoteDataSource {}

class MockLocalDataSource extends Mock implements CoinLocalDataSource {}

class MockNetworkInfo extends Mock implements NetworkInfo {}

void main() {
  late CoinRepositoryImpl repository;
  late MockRemoteDataSource mockRemoteDataSource;
  late MockLocalDataSource mockLocalDataSource;
  late MockNetworkInfo mockNetworkInfo;

  setUpAll(() {
    mockRemoteDataSource = MockRemoteDataSource();
    mockLocalDataSource = MockLocalDataSource();
    mockNetworkInfo = MockNetworkInfo();
    repository = CoinRepositoryImpl(
      remoteDataSource: mockRemoteDataSource,
      localDataSource: mockLocalDataSource,
      networkInfo: mockNetworkInfo,
    );

    registerFallbackValue(
      CoinModel(
        id: 58,
        name: 'Bitcoin',
        assetId: 'BTC',
        dataStart: DateTime.parse('2011-09-13'),
        dataEnd: DateTime.parse('2023-10-31'),
        price: 34237.5,
        iconId: "4caf2b16-a017-4e26-a348-2cea69c34cba",
        symbolId: 'BITSTAMP_SPOT_BTC_USD',
        createdAt: DateTime.parse("2023-11-01T14:58:09.209Z"),
        updatedAt: DateTime.parse("2023-11-01T14:58:09.209Z"),
      ),
    );
  });

  group('getCoin', () {
    const int tCoinId = 1;
    final CoinModel tCoinModel = CoinModel(
      id: 58,
      name: 'Bitcoin',
      assetId: 'BTC',
      dataStart: DateTime.parse('2011-09-13'),
      dataEnd: DateTime.parse('2023-10-31'),
      price: 34237.5,
      iconId: "4caf2b16-a017-4e26-a348-2cea69c34cba",
      symbolId: 'BITSTAMP_SPOT_BTC_USD',
      createdAt: DateTime.parse("2023-11-01T14:58:09.209Z"),
      updatedAt: DateTime.parse("2023-11-01T14:58:09.209Z"),
    );
    final Coin tCoin = tCoinModel;

    test(
      'should check if the device is online',
      () async {
        when(() => mockNetworkInfo.isConnected).thenAnswer((_) async => true);

        when(() => mockRemoteDataSource.getCoin(coinId: any(named: 'coinId')))
            .thenAnswer((_) async => tCoinModel);

        when(() => mockLocalDataSource.cacheCoin(
                coinToCache: any(named: 'coinToCache')))
            .thenAnswer((_) async => {});

        await repository.getCoin(coinId: tCoinId);

        verify(() => mockNetworkInfo.isConnected);
      },
    );

    group('device is online', () {
      setUp(() {
        when(() => mockNetworkInfo.isConnected).thenAnswer((_) async => true);
      });

      test(
        'should return remote data when the call to remote data source is successful',
        () async {
          when(() => mockRemoteDataSource.getCoin(coinId: any(named: 'coinId')))
              .thenAnswer((_) async => tCoinModel);

          final result = await repository.getCoin(coinId: tCoinId);

          verify(() => mockRemoteDataSource.getCoin(coinId: tCoinId));
          expect(result, equals(Right(tCoin)));
        },
      );

      test(
        'should cache the data locally when the call to remote data source is successful',
        () async {
          when(() => mockRemoteDataSource.getCoin(coinId: any(named: 'coinId')))
              .thenAnswer((_) async => tCoinModel);

          await repository.getCoin(coinId: tCoinId);

          verify(() => mockRemoteDataSource.getCoin(coinId: tCoinId));
          verify(() => mockLocalDataSource.cacheCoin(coinToCache: tCoinModel));

          clearInteractions(mockRemoteDataSource);
          clearInteractions(mockLocalDataSource);
        },
      );

      test(
        'should return server failure when the call to remote data source is unsuccessful',
        () async {
          when(() => mockRemoteDataSource.getCoin(coinId: any(named: 'coinId')))
              .thenThrow(ServerException());

          final result = await repository.getCoin(coinId: tCoinId);

          verify(() => mockRemoteDataSource.getCoin(coinId: tCoinId));
          verifyZeroInteractions(mockLocalDataSource);
          expect(result, equals(Left(ServerFailure())));

          clearInteractions(mockRemoteDataSource);
        },
      );
    });

    group('device is offline', () {
      setUp(() {
        when(() => mockNetworkInfo.isConnected).thenAnswer((_) async => false);
      });

      test(
        'should return last locally cached data when the cached data is present',
        () async {
          when(() => mockLocalDataSource.getCoin(coinId: any(named: 'coinId')))
              .thenAnswer((_) async => tCoinModel);

          final result = await repository.getCoin(coinId: tCoinId);

          verifyZeroInteractions(mockRemoteDataSource);
          verify(() => mockLocalDataSource.getCoin(coinId: tCoinId));
          expect(result, equals(Right(tCoin)));

          clearInteractions(mockLocalDataSource);
        },
      );

      test(
        'should return CacheFailure when there is no cached data present',
        () async {
          when(() => mockLocalDataSource.getCoin(coinId: any(named: 'coinId')))
              .thenThrow(CacheException());

          final result = await repository.getCoin(coinId: tCoinId);

          verifyZeroInteractions(mockRemoteDataSource);
          verify(() => mockLocalDataSource.getCoin(coinId: tCoinId));
          expect(result, equals(Left(CacheFailure())));
        },
      );
    });
  });
}
