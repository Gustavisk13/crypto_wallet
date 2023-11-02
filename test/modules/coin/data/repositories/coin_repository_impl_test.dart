// Package imports:
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

// Project imports:
import 'package:crypto_wallet/core/errors/exceptions.dart';
import 'package:crypto_wallet/core/errors/failures.dart';
import 'package:crypto_wallet/core/network/network_info.dart';
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
    const String tCoinAssetId = 'BTC';

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

        when(() => mockRemoteDataSource.getCoin(
                coinAssetId: any(named: 'coinAssetId')))
            .thenAnswer((_) async => tCoinModel);

        when(() => mockLocalDataSource.cacheCoin(
                coinToCache: any(named: 'coinToCache')))
            .thenAnswer((_) async => {});

        await repository.getCoin(coinAssetId: tCoinAssetId);

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
          when(() => mockRemoteDataSource.getCoin(
                  coinAssetId: any(named: 'coinAssetId')))
              .thenAnswer((_) async => tCoinModel);

          final result = await repository.getCoin(coinAssetId: tCoinAssetId);

          verify(() => mockRemoteDataSource.getCoin(coinAssetId: tCoinAssetId));
          expect(result, equals(Right(tCoin)));
        },
      );

      test(
        'should cache the data locally when the call to remote data source is successful',
        () async {
          when(() => mockRemoteDataSource.getCoin(
                  coinAssetId: any(named: 'coinAssetId')))
              .thenAnswer((_) async => tCoinModel);

          await repository.getCoin(coinAssetId: tCoinAssetId);

          verify(() => mockRemoteDataSource.getCoin(coinAssetId: tCoinAssetId));
          verify(() => mockLocalDataSource.cacheCoin(coinToCache: tCoinModel));

          clearInteractions(mockRemoteDataSource);
          clearInteractions(mockLocalDataSource);
        },
      );

      test(
        'should return server failure when the call to remote data source is unsuccessful',
        () async {
          when(() => mockRemoteDataSource.getCoin(
                  coinAssetId: any(named: 'coinAssetId')))
              .thenThrow(ServerException());

          final result = await repository.getCoin(coinAssetId: tCoinAssetId);

          verify(() => mockRemoteDataSource.getCoin(coinAssetId: tCoinAssetId));
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
          when(() => mockLocalDataSource.getCoin(
                  coinAssetId: any(named: 'coinAssetId')))
              .thenAnswer((_) async => tCoinModel);

          final result = await repository.getCoin(coinAssetId: tCoinAssetId);

          verifyZeroInteractions(mockRemoteDataSource);
          verify(() => mockLocalDataSource.getCoin(coinAssetId: tCoinAssetId));
          expect(result, equals(Right(tCoin)));

          clearInteractions(mockLocalDataSource);
        },
      );

      test(
        'should return CacheFailure when there is no cached data present',
        () async {
          when(() => mockLocalDataSource.getCoin(
                  coinAssetId: any(named: 'coinAssetId')))
              .thenThrow(CacheException());

          final result = await repository.getCoin(coinAssetId: tCoinAssetId);

          verifyZeroInteractions(mockRemoteDataSource);
          verify(() => mockLocalDataSource.getCoin(coinAssetId: tCoinAssetId));
          expect(result, equals(Left(CacheFailure())));
        },
      );
    });
  });

  group('getCoins', () {
    final List<CoinModel> tCoinModelList = [
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
      CoinModel(
        id: 60,
        name: 'Ethereum',
        assetId: 'ETH',
        dataStart: DateTime.parse('2015-08-07'),
        dataEnd: DateTime.parse('2023-10-31'),
        price: 2145.5,
        iconId: "4caf2b16-a017-4e26-a348-2cea69c34cba",
        symbolId: 'BITSTAMP_SPOT_ETH_USD',
        createdAt: DateTime.parse("2023-11-01T14:58:09.209Z"),
        updatedAt: DateTime.parse("2023-11-01T14:58:09.209Z"),
      ),
      CoinModel(
        id: 61,
        name: 'Litecoin',
        assetId: 'LTC',
        dataStart: DateTime.parse('2013-04-28'),
        dataEnd: DateTime.parse('2023-10-31'),
        price: 138.5,
        iconId: "4caf2b16-a017-4e26-a348-2cea69c34cba",
        symbolId: 'BITSTAMP_SPOT_LTC_USD',
        createdAt: DateTime.parse("2023-11-01T14:58:09.209Z"),
        updatedAt: DateTime.parse("2023-11-01T14:58:09.209Z"),
      ),
    ];

    final List<Coin> tCoinList = tCoinModelList;

    test(
      'should check if the device is online',
      () async {
        when(() => mockNetworkInfo.isConnected).thenAnswer((_) async => true);

        when(() => mockRemoteDataSource.getCoins())
            .thenAnswer((_) async => tCoinModelList);

        when(() => mockLocalDataSource.cacheCoins(
                coinsToCache: any(named: 'coinsToCache')))
            .thenAnswer((_) async => {});

        await repository.getCoins();

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
          when(() => mockRemoteDataSource.getCoins())
              .thenAnswer((_) async => tCoinModelList);

          final result = await repository.getCoins();

          verify(() => mockRemoteDataSource.getCoins());
          expect(result, equals(Right(tCoinList)));
        },
      );

      test(
        'should cache the data locally when the call to remote data source is successful',
        () async {
          when(() => mockRemoteDataSource.getCoins())
              .thenAnswer((_) async => tCoinModelList);

          await repository.getCoins();

          verify(() => mockRemoteDataSource.getCoins());
          verify(() =>
              mockLocalDataSource.cacheCoins(coinsToCache: tCoinModelList));

          clearInteractions(mockRemoteDataSource);
          clearInteractions(mockLocalDataSource);
        },
      );

      test(
        'should return server failure when the call to remote data source is unsuccessful',
        () async {
          when(() => mockRemoteDataSource.getCoins())
              .thenThrow(ServerException());

          final result = await repository.getCoins();

          verify(() => mockRemoteDataSource.getCoins());
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
        'should return list of locally cached data when the cached data is present',
        () async {
          when(() => mockLocalDataSource.getCoins())
              .thenAnswer((_) async => tCoinModelList);

          final result = await repository.getCoins();

          verifyZeroInteractions(mockRemoteDataSource);
          verify(() => mockLocalDataSource.getCoins());
          expect(result, equals(Right(tCoinList)));

          clearInteractions(mockLocalDataSource);
        },
      );

      test(
        'should return CacheFailure when there is no cached data present',
        () async {
          when(() => mockLocalDataSource.getCoins())
              .thenThrow(CacheException());

          final result = await repository.getCoins();

          verifyZeroInteractions(mockRemoteDataSource);
          verify(() => mockLocalDataSource.getCoins());
          expect(result, equals(Left(CacheFailure())));
        },
      );
    });
  });

  group('getCoinsPaginated', () {
    const int tPageNumber = 2;

    final List<CoinModel> tCoinModelList = [
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
      CoinModel(
        id: 60,
        name: 'Ethereum',
        assetId: 'ETH',
        dataStart: DateTime.parse('2015-08-07'),
        dataEnd: DateTime.parse('2023-10-31'),
        price: 2145.5,
        iconId: "4caf2b16-a017-4e26-a348-2cea69c34cba",
        symbolId: 'BITSTAMP_SPOT_ETH_USD',
        createdAt: DateTime.parse("2023-11-01T14:58:09.209Z"),
        updatedAt: DateTime.parse("2023-11-01T14:58:09.209Z"),
      ),
      CoinModel(
        id: 61,
        name: 'Litecoin',
        assetId: 'LTC',
        dataStart: DateTime.parse('2013-04-28'),
        dataEnd: DateTime.parse('2023-10-31'),
        price: 138.5,
        iconId: "4caf2b16-a017-4e26-a348-2cea69c34cba",
        symbolId: 'BITSTAMP_SPOT_LTC_USD',
        createdAt: DateTime.parse("2023-11-01T14:58:09.209Z"),
        updatedAt: DateTime.parse("2023-11-01T14:58:09.209Z"),
      ),
    ];

    final List<Coin> tCoinList = tCoinModelList;

    test(
      'should check if the device is online',
      () async {
        when(() => mockNetworkInfo.isConnected).thenAnswer((_) async => true);

        when(() => mockRemoteDataSource.getCoinsPaginated(
                pageNumber: any(named: 'pageNumber')))
            .thenAnswer((_) async => tCoinModelList);

        when(() => mockLocalDataSource.cacheCoins(
            coinsToCache: any(named: 'coinsToCache'),
            pageNumber: any(named: 'pageNumber'))).thenAnswer((_) async => {});

        await repository.getCoinsPaginated(pageNumber: tPageNumber);

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
          when(() => mockRemoteDataSource.getCoinsPaginated(
                  pageNumber: any(named: 'pageNumber')))
              .thenAnswer((_) async => tCoinModelList);

          final result =
              await repository.getCoinsPaginated(pageNumber: tPageNumber);

          verify(() =>
              mockRemoteDataSource.getCoinsPaginated(pageNumber: tPageNumber));
          expect(result, equals(Right(tCoinList)));
        },
      );

      test(
        'should cache the data locally when the call to remote data source is successful',
        () async {
          when(() => mockRemoteDataSource.getCoinsPaginated(
                  pageNumber: any(named: 'pageNumber')))
              .thenAnswer((_) async => tCoinModelList);

          await repository.getCoinsPaginated(pageNumber: tPageNumber);

          verify(() =>
              mockRemoteDataSource.getCoinsPaginated(pageNumber: tPageNumber));
          verify(() => mockLocalDataSource.cacheCoins(
              coinsToCache: tCoinModelList, pageNumber: tPageNumber));

          clearInteractions(mockRemoteDataSource);
          clearInteractions(mockLocalDataSource);
        },
      );

      test(
        'should return server failure when the call to remote data source is unsuccessful',
        () async {
          when(() => mockRemoteDataSource.getCoinsPaginated(
                  pageNumber: any(named: 'pageNumber')))
              .thenThrow(ServerException());

          final result =
              await repository.getCoinsPaginated(pageNumber: tPageNumber);

          verify(() =>
              mockRemoteDataSource.getCoinsPaginated(pageNumber: tPageNumber));
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
        'should return list of locally cached data when the cached data is present',
        () async {
          when(() => mockLocalDataSource.getCoins(
                  pageNumber: any(named: 'pageNumber')))
              .thenAnswer((_) async => tCoinModelList);

          final result =
              await repository.getCoinsPaginated(pageNumber: tPageNumber);

          verifyZeroInteractions(mockRemoteDataSource);
          verify(() => mockLocalDataSource.getCoins(pageNumber: tPageNumber));
          expect(result, equals(Right(tCoinList)));

          clearInteractions(mockLocalDataSource);
        },
      );

      test(
        'should return CacheFailure when there is no cached data present',
        () async {
          when(() => mockLocalDataSource.getCoins(
                  pageNumber: any(named: 'pageNumber')))
              .thenThrow(CacheException());

          final result =
              await repository.getCoinsPaginated(pageNumber: tPageNumber);

          verifyZeroInteractions(mockRemoteDataSource);
          verify(() => mockLocalDataSource.getCoins(pageNumber: tPageNumber));
          expect(result, equals(Left(CacheFailure())));
        },
      );
    });
  });
}
