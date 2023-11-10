// Dart imports:
import 'dart:convert';

// Package imports:
import 'package:flutter_test/flutter_test.dart';

// Project imports:
import 'package:crypto_wallet/modules/coin/data/models/coin_model.dart';
import 'package:crypto_wallet/modules/coin/domain/entities/coin.dart';
import '../../../../fixtures/fixture_reader.dart';

void main() {
  final tCoinExpPriceModel = CoinModel(
    id: 18,
    name: 'Shiba Inu',
    assetId: 'SHIB',
    dataStart: DateTime.parse('2021-12-09'),
    dataEnd: DateTime.parse('2023-10-31'),
    price: 0.000007595,
    iconId: null,
    symbolId: 'BITSTAMP_SPOT_SHIB_USD',
    createdAt: DateTime.parse("2023-11-01T14:56:36.559Z"),
    updatedAt: DateTime.parse("2023-11-01T14:56:36.559Z"),
  );
  final tCoinRegularPriceModel = CoinModel(
    id: 58,
    name: 'Bitcoin',
    assetId: 'BTC',
    dataStart: DateTime.parse('2011-09-13'),
    dataEnd: DateTime.parse('2023-10-31'),
    price: 34237.5,
    iconId: "4caf2b16a0174e26a3482cea69c34cba",
    symbolId: 'BITSTAMP_SPOT_BTC_USD',
    createdAt: DateTime.parse("2023-11-01T14:58:09.209Z"),
    updatedAt: DateTime.parse("2023-11-01T14:58:09.209Z"),
  );
  test('should be a subclass of Coin entity', () async {
    expect(tCoinRegularPriceModel, isA<Coin>());
  });

  group('fromJson', () {
    test('should return a valid model when the price field is an exponent',
        () async {
      final Map<String, dynamic> jsonMap =
          json.decode(fixture('coin/coin_price_exp.json'));

      final result = CoinModel.fromJson(json: jsonMap);

      expect(result, equals(tCoinExpPriceModel));
    });

    test('should return a valid model when the price field is regular',
        () async {
      final Map<String, dynamic> jsonMap =
          json.decode(fixture('coin/coin.json'));

      final result = CoinModel.fromJson(json: jsonMap);

      expect(result, equals(tCoinRegularPriceModel));
    });

    test('should format iconId', () async {
      const String expectedIconId = "4caf2b16a0174e26a3482cea69c34cba";

      final Map<String, dynamic> jsonMap =
          json.decode(fixture('coin/coin.json'));

      final result = CoinModel.fromJson(json: jsonMap);

      expect(result.iconId, equals(expectedIconId));
    });
  });

  group('toJson', () {
    test('should return a JSON map containing the proper data', () async {
      final result = tCoinRegularPriceModel.toJson();

      final expectedMap = {
        "id": 58,
        "asset_id": "BTC",
        "name": "Bitcoin",
        "data_start": "2011-09-13T00:00:00.000",
        "data_end": "2023-10-31T00:00:00.000",
        "price": 34237.5,
        "icon_id": "4caf2b16a0174e26a3482cea69c34cba",
        "symbol_id": "BITSTAMP_SPOT_BTC_USD",
        "created_at": "2023-11-01T14:58:09.209Z",
        "updated_at": "2023-11-01T14:58:09.209Z",
      };

      expect(result, expectedMap);
    });
  });
}
