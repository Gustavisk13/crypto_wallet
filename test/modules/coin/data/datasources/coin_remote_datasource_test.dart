// Dart imports:

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
import 'package:crypto_wallet/modules/coin/data/datasources/coin_remote_datasource.dart';
import 'package:crypto_wallet/modules/coin/data/models/coin_model.dart';
import '../../../../fixtures/fixture_reader.dart';

class MockHttpClient extends Mock implements http.Client {}

void main() {
  late CoinRemoteDataSourceImpl dataSource;
  late MockHttpClient mockHttpClient;
  late EnvironmentConfig env;

  setUpAll(() {
    env = EnvironmentConfig(
      apiBaseUrl: 'https://api.test.com',
    );
    GetIt.I.registerSingleton<EnvironmentConfig>(env);
    mockHttpClient = MockHttpClient();
    dataSource = CoinRemoteDataSourceImpl(client: mockHttpClient);
  });

  tearDownAll(() {
    getIt.reset();
  });

  void setUpMockHttpClientSuccess200() {
    when(() => mockHttpClient.get(Uri.parse('${env.apiBaseUrl}/coins/BTC'),
            headers: any(named: 'headers')))
        .thenAnswer((_) async => http.Response(fixture('coin/coin.json'), 200));
  }

  void setUpMockHttpClientFailure404() {
    when(() => mockHttpClient.get(Uri.parse('${env.apiBaseUrl}/coins/BTC'),
            headers: any(named: 'headers')))
        .thenAnswer((_) async => http.Response('Something went wrong', 404));
  }

  test('verify environment vars', () {
    final env = getIt<EnvironmentConfig>();

    expect(env.apiBaseUrl, equals(env.apiBaseUrl));
  });

  group('getCoin', () {
    const String tCoinAssetId = 'BTC';

    final String tCoinJson = fixture('coin/coin.json');

    final CoinModel tCoinModel =
        CoinModel.fromJson(json: jsonDecode(tCoinJson));

    test(
      'should perform a GET request on a URL with coins/coinId endpoint',
      () async {
        // arrange
        setUpMockHttpClientSuccess200();
        // act
        await dataSource.getCoin(coinAssetId: tCoinAssetId);
        // assert
        verify(() => mockHttpClient.get(
              Uri.parse('${env.apiBaseUrl}/coins/$tCoinAssetId'),
              headers: {
                'Content-Type': 'application/json',
              },
            ));
      },
    );

    test('should return CoinModel when the response code is 200 (success)',
        () async {
      // arrange
      setUpMockHttpClientSuccess200();
      // act
      final result = await dataSource.getCoin(coinAssetId: tCoinAssetId);
      // assert
      expect(result, equals(tCoinModel));
    });

    test(
        'should throw a ServerException when the response code is 404 or other',
        () async {
      // arrange
      setUpMockHttpClientFailure404();
      // act
      final call = dataSource.getCoin;
      // assert
      expect(() => call(coinAssetId: tCoinAssetId),
          throwsA(isA<ServerException>()));
    });
  });

  group('getCoins', () {
    final String tCoinsJson = fixture('coin/coins.json');

    final List<CoinModel> tCoinsModel = (jsonDecode(tCoinsJson) as List)
        .map((e) => CoinModel.fromJson(json: e))
        .toList();

    test(
      'should perform a GET request on a URL with coins endpoint',
      () async {
        // arrange
        when(() => mockHttpClient.get(Uri.parse('${env.apiBaseUrl}/coins'),
                headers: any(named: 'headers')))
            .thenAnswer((_) async => http.Response(tCoinsJson, 200));
        // act
        await dataSource.getCoins();
        // assert
        verify(() => mockHttpClient.get(
              Uri.parse('${env.apiBaseUrl}/coins'),
              headers: {
                'Content-Type': 'application/json',
              },
            ));
      },
    );

    test(
        'should return List<CoinModel> when the response code is 200 (success)',
        () async {
      // arrange
      when(() => mockHttpClient.get(Uri.parse('${env.apiBaseUrl}/coins'),
              headers: any(named: 'headers')))
          .thenAnswer((_) async => http.Response(tCoinsJson, 200));
      // act
      final result = await dataSource.getCoins();
      // assert
      expect(result, equals(tCoinsModel));
    });

    test(
        'should throw a ServerException when the response code is 404 or other',
        () async {
      // arrange
      when(() => mockHttpClient.get(Uri.parse('${env.apiBaseUrl}/coins'),
              headers: any(named: 'headers')))
          .thenAnswer((_) async => http.Response('Something went wrong', 404));
      // act
      final call = dataSource.getCoins;
      // assert
      expect(() => call(), throwsA(isA<ServerException>()));
    });
  });

  group(
    'getCoinsPaginated',
    () {
      const int tPageNumber = 1;

      final String tCoinsJson = fixture('coin/coins.json');

      final List<CoinModel> tCoinsModel = (jsonDecode(tCoinsJson) as List)
          .map((e) => CoinModel.fromJson(json: e))
          .toList();

      test(
        'should perform a GET request on a URL with coins endpoint',
        () async {
          // arrange
          when(() => mockHttpClient.get(
                  Uri.parse('${env.apiBaseUrl}/coins?page=$tPageNumber'),
                  headers: any(named: 'headers')))
              .thenAnswer((_) async => http.Response(tCoinsJson, 200));
          // act
          await dataSource.getCoinsPaginated();
          // assert
          verify(() => mockHttpClient.get(
                Uri.parse('${env.apiBaseUrl}/coins?page=1'),
                headers: {
                  'Content-Type': 'application/json',
                },
              ));
        },
      );

      test(
          'should return List<CoinModel> when the response code is 200 (success)',
          () async {
        // arrange
        when(() => mockHttpClient.get(
                Uri.parse('${env.apiBaseUrl}/coins?page=$tPageNumber'),
                headers: any(named: 'headers')))
            .thenAnswer((_) async => http.Response(tCoinsJson, 200));
        // act
        final result = await dataSource.getCoinsPaginated();
        // assert
        expect(result, equals(tCoinsModel));
      });

      test(
          'should throw a ServerException when the response code is 404 or other',
          () async {
        // arrange
        when(() => mockHttpClient.get(
                Uri.parse('${env.apiBaseUrl}/coins?page=$tPageNumber'),
                headers: any(named: 'headers')))
            .thenAnswer(
                (_) async => http.Response('Something went wrong', 404));
        // act
        final call = dataSource.getCoinsPaginated;
        // assert
        expect(() => call(), throwsA(isA<ServerException>()));
      });
    },
  );
}
