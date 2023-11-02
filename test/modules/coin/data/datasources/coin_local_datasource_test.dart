// Dart imports:
import 'dart:convert';

// Package imports:
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:shared_preferences/shared_preferences.dart';

// Project imports:
import 'package:crypto_wallet/core/errors/exceptions.dart';
import 'package:crypto_wallet/modules/coin/data/datasources/coin_local_datasource.dart';
import 'package:crypto_wallet/modules/coin/data/models/coin_model.dart';
import '../../../../fixtures/fixture_reader.dart';

class MockSharedPreferences extends Mock implements SharedPreferences {}

void main() {
  late CoinLocalDataSourceImpl dataSource;
  late MockSharedPreferences mockSharedPreferences;

  setUpAll(() async {
    mockSharedPreferences = MockSharedPreferences();
    dataSource =
        CoinLocalDataSourceImpl(sharedPreferences: mockSharedPreferences);
  });

  group('getCoin', () {
    const String tCoinAssetId = 'BTC';

    final tCoinModel =
        CoinModel.fromJson(json: jsonDecode(fixture('coin.json')));

    test(
        'should return coin from SharedPreferences when there is one in the cache',
        () async {
      // arrange
      when(() => mockSharedPreferences.getString(any()))
          .thenReturn(fixture('coin.json'));
      // act
      final result = await dataSource.getCoin(coinAssetId: tCoinAssetId);

      // assert
      verify(
          () => mockSharedPreferences.getString('CACHED_COIN_$tCoinAssetId'));
      expect(result, equals(tCoinModel));
    });

    test('should throw a CacheException when there is not a cached value',
        () async {
      // arrange
      when(() => mockSharedPreferences.getString(any())).thenReturn(null);

      // act
      final call = dataSource.getCoin;

      // assert
      expect(() => call(coinAssetId: tCoinAssetId),
          throwsA(const TypeMatcher<CacheException>()));
    });
  });

  group('cacheCoin', () {
    final tCoinModel = CoinModel(
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
    test('should call SharedPreferences to cache the data', () async {
      when(() => mockSharedPreferences.setString(any(), any()))
          .thenAnswer((_) async => true);
      // act
      await dataSource.cacheCoin(coinToCache: tCoinModel);
      // assert

      final expectedJsonString = jsonEncode(tCoinModel.toJson());

      verify(() => mockSharedPreferences.setString(
          'CACHED_COIN_${tCoinModel.id}', expectedJsonString));

      clearInteractions(mockSharedPreferences);
    });

    test('should throw a CacheException when the cache is not successful',
        () async {
      when(() => mockSharedPreferences.setString(any(), any()))
          .thenAnswer((_) async => false);
      // act
      final call = dataSource.cacheCoin;
      // assert
      expect(() => call(coinToCache: tCoinModel),
          throwsA(const TypeMatcher<CacheException>()));
    });
  });

  group('getCoins', () {
    const int tPageNumber = 1;
    final coins = jsonDecode(fixture('coins.json')) as List;

    final tCoinsModel = coins
        .map((coin) => CoinModel.fromJson(json: coin as Map<String, dynamic>))
        .toList();

    test(
        'should return coins from SharedPreferences when there is one in the cache',
        () async {
      // arrange
      when(() => mockSharedPreferences.getString(any()))
          .thenReturn(fixture('coins.json'));
      // act
      final result = await dataSource.getCoins(pageNumber: tPageNumber);

      // assert
      verify(
          () => mockSharedPreferences.getString('CACHED_COINS_$tPageNumber'));
      expect(result, equals(tCoinsModel));
    });

    test('should throw a CacheException when there is not a cached value',
        () async {
      // arrange
      when(() => mockSharedPreferences.getString(any())).thenReturn(null);

      // act
      final call = dataSource.getCoins;

      // assert
      expect(() => call(pageNumber: tPageNumber),
          throwsA(const TypeMatcher<CacheException>()));
    });
  });

  group('cacheCoins', () {
    const int tPageNumber = 1;

    final coins = jsonDecode(fixture('coins.json')) as List;

    final tCoinsModel = coins
        .map((coin) => CoinModel.fromJson(json: coin as Map<String, dynamic>))
        .toList();

    test('should call SharedPreferences to cache the data', () async {
      when(() => mockSharedPreferences.setString(any(), any()))
          .thenAnswer((_) async => true);
      // act
      await dataSource.cacheCoins(
          coinsToCache: tCoinsModel, pageNumber: tPageNumber);
      // assert

      final expectedJsonString = jsonEncode(tCoinsModel);

      verify(() => mockSharedPreferences.setString(
          'CACHED_COINS_$tPageNumber', expectedJsonString));

      clearInteractions(mockSharedPreferences);
    });

    test('should throw a CacheException when the cache is not successful',
        () async {
      when(() => mockSharedPreferences.setString(any(), any()))
          .thenAnswer((_) async => false);
      // act
      final call = dataSource.cacheCoins;
      // assert
      expect(() => call(coinsToCache: tCoinsModel, pageNumber: tPageNumber),
          throwsA(const TypeMatcher<CacheException>()));
    });
  });
}
