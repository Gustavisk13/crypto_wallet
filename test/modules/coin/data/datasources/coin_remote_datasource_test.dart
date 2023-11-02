// Dart imports:

// Package imports:
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:mocktail/mocktail.dart';

// Project imports:
import 'package:crypto_wallet/modules/coin/data/datasources/coin_remote_datasource.dart';
import '../../../../fixtures/fixture_reader.dart';

class MockHttpClient extends Mock implements http.Client {}

void main() {
  late CoinRemoteDataSourceImpl dataSource;
  late MockHttpClient mockHttpClient;

  setUpAll(() {
    mockHttpClient = MockHttpClient();
    dataSource = CoinRemoteDataSourceImpl(client: mockHttpClient);
  });

  group('getCoin', () {
    const String tCoinAssetId = 'BTC';
    const String testAuthToken =
        'eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoxfQ.hzhPehbG98zwAv842NhId1yiOeVkw9gxIcU5Ojl2bXk';

    final String tCoinJson = fixture('coin.json');

    test(
      'should perform a GET request on a URL with coins/coinId endpoint',
      () async {
        // arrange
        when(() => mockHttpClient.get(
              Uri.parse(
                  'https://crypto-wallet-api-cjir.onrender.com/coins/$tCoinAssetId'),
              headers: {
                'Content-Type': 'application/json',
                'Authorization': 'Bearer $testAuthToken'
              },
            )).thenAnswer((_) async => http.Response(tCoinJson, 200));
        // act
        dataSource.getCoin(coinAssetId: tCoinAssetId);
        // assert
        verify(() => mockHttpClient.get(
              Uri.parse(
                  'https://api.coinstats.app/public/v1/coins/$tCoinAssetId'),
              headers: {
                'Content-Type': 'application/json',
              },
            ));
      },
    );
  });
}
