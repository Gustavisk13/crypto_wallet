// Dart imports:
import 'dart:convert';

// Package imports:
import 'package:flutter_test/flutter_test.dart';

// Project imports:
import 'package:crypto_wallet/modules/coin/data/models/coin_model.dart';
import 'package:crypto_wallet/modules/wallet/data/models/wallet_model.dart';
import 'package:crypto_wallet/modules/wallet/domain/entities/wallet.dart';
import '../../../../fixtures/fixture_reader.dart';

void main() {
  final tWallet = WalletModel(
    description: 'Nova Carteira Teste 1',
    id: 1,
    userId: 1,
    createdAt: DateTime.parse('2023-11-03T23:03:30.990Z'),
    updatedAt: DateTime.parse('2023-11-09T23:25:02.030Z'),
    coins: [
      CoinModel(
        id: 22,
        name: 'Cardano',
        assetId: 'ADA',
        dataStart: DateTime.parse('2021-11-24'),
        dataEnd: DateTime.parse('2023-10-31'),
        price: 0.287535,
        iconId: "2701173b1b7740f286939659359e225c",
        symbolId: 'BITSTAMP_SPOT_ADA_USD',
        createdAt: DateTime.parse('2023-11-01T14:56:45.480Z'),
        updatedAt: DateTime.parse('2023-11-01T14:56:45.480Z'),
      ),
      CoinModel(
        id: 29,
        assetId: 'ETH',
        name: 'Ethereum',
        dataStart: DateTime.parse('2017-08-20'),
        dataEnd: DateTime.parse('2023-10-31'),
        symbolId: 'BITSTAMP_SPOT_ETH_USD',
        price: 1788.85,
        iconId: '604ae4533d9f4ad09a489905cce617c2',
        createdAt: DateTime.parse('2023-11-01T14:57:02.637Z'),
        updatedAt: DateTime.parse('2023-11-01T14:57:02.637Z'),
      ),
      CoinModel(
        id: 58,
        name: 'Bitcoin',
        assetId: 'BTC',
        dataStart: DateTime.parse('2011-09-13'),
        dataEnd: DateTime.parse('2023-10-31'),
        price: 34237.5,
        iconId: "4caf2b16a0174e26a3482cea69c34cba",
        symbolId: 'BITSTAMP_SPOT_BTC_USD',
        createdAt: DateTime.parse('2023-11-01T14:58:09.209Z'),
        updatedAt: DateTime.parse('2023-11-01T14:58:09.209Z'),
      ),
    ],
  );

  test('should be a subclass of Wallet entity', () async {
    // assert
    expect(tWallet, isA<Wallet>());
  });

  group('fromJson', () {
    test('should return a valid model when the JSON is valid', () async {
      // arrange
      final Map<String, dynamic> jsonMap =
          jsonDecode(fixture('wallet/wallet.json'));
      // act
      final result = WalletModel.fromJson(jsonMap);
      // assert
      expect(result, tWallet);
    });
  });

  group('toJson', () {
    test('should return a JSON map containing the proper data', () async {
      // act
      final result = tWallet.toJson();
      // assert
      final expectedMap = {
        "id": 1,
        "description": "Nova Carteira Teste 1",
        "user_id": 1,
        "coins": [
          {
            "id": 22,
            "name": "Cardano",
            "asset_id": "ADA",
            "data_start": "2021-11-24T00:00:00.000",
            "data_end": "2023-10-31T00:00:00.000",
            "price": 0.287535,
            "icon_id": "2701173b1b7740f286939659359e225c",
            "symbol_id": "BITSTAMP_SPOT_ADA_USD",
            "created_at": "2023-11-01T14:56:45.480Z",
            "updated_at": "2023-11-01T14:56:45.480Z"
          },
          {
            "id": 29,
            "name": "Ethereum",
            "asset_id": "ETH",
            "data_start": "2017-08-20T00:00:00.000",
            "data_end": "2023-10-31T00:00:00.000",
            "price": 1788.85,
            "icon_id": '604ae4533d9f4ad09a489905cce617c2',
            "symbol_id": "BITSTAMP_SPOT_ETH_USD",
            "created_at": "2023-11-01T14:57:02.637Z",
            "updated_at": "2023-11-01T14:57:02.637Z"
          },
          {
            "id": 58,
            "name": "Bitcoin",
            "asset_id": "BTC",
            "data_start": "2011-09-13T00:00:00.000",
            "data_end": "2023-10-31T00:00:00.000",
            "price": 34237.5,
            "icon_id": "4caf2b16a0174e26a3482cea69c34cba",
            "symbol_id": "BITSTAMP_SPOT_BTC_USD",
            "created_at": "2023-11-01T14:58:09.209Z",
            "updated_at": "2023-11-01T14:58:09.209Z"
          }
        ],
        "created_at": "2023-11-03T23:03:30.990Z",
        "updated_at": "2023-11-09T23:25:02.030Z"
      };
      expect(result, equals(expectedMap));
    });
  });
}
