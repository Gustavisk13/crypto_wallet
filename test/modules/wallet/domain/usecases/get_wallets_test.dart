// Package imports:
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

// Project imports:
import 'package:crypto_wallet/modules/coin/domain/entities/coin.dart';
import 'package:crypto_wallet/modules/wallet/domain/entities/wallet.dart';
import 'package:crypto_wallet/modules/wallet/domain/repositories/wallet_repository.dart';
import 'package:crypto_wallet/modules/wallet/domain/usecases/get_wallets.dart';

class MockWalletRepository extends Mock implements WalletRepository {}

void main() {
  late MockWalletRepository mockWalletRepository;
  late GetWallets usecase;

  setUpAll(() {
    mockWalletRepository = MockWalletRepository();
    usecase = GetWallets(repository: mockWalletRepository);
  });

  const int tUserId = 1;

  final List<Wallet> tWallets = [
    Wallet(
        description: 'Nova Carteira Teste 1',
        id: 1,
        userId: 1,
        createdAt: DateTime.parse('2023-11-03T23:03:30.990Z'),
        updatedAt: DateTime.parse('2023-11-03T23:03:30.990Z'),
        coins: [
          Coin(
            id: 29,
            assetId: 'ETH',
            name: 'Ethereum',
            dataStart: DateTime.parse('2017-08-20'),
            dataEnd: DateTime.parse('2023-10-31'),
            symbolId: 'BITSTAMP_SPOT_ETH_USD',
            createdAt: DateTime.parse('2023-11-01T14:57:02.637Z'),
            updatedAt: DateTime.parse('2023-11-01T14:57:02.637Z'),
          ),
          Coin(
            id: 83,
            name: 'BitcoinA',
            assetId: 'BTC',
            dataStart: DateTime.parse('2011-09-13'),
            dataEnd: DateTime.parse('2023-10-30'),
            price: 34510.5,
            iconId: "4caf2b16a0174e26at482cea69c34cba",
            symbolId: 'BITSTAMP_SPOT_BTC_USD',
            createdAt: DateTime.parse('2023-10-31T19:40:08.002Z'),
            updatedAt: DateTime.parse('2023-10-31T19:40:08.002Z'),
          ),
          Coin(
            id: 84,
            name: 'BitcoinB',
            assetId: 'BTC',
            dataStart: DateTime.parse('2011-09-13'),
            dataEnd: DateTime.parse('2023-10-30'),
            price: 34510.5,
            iconId: "4caf2b16a0174e26a3482cea69c34cba",
            symbolId: 'BITSTAMP_SPOT_BTC_USD',
            createdAt: DateTime.parse('2023-10-31T19:40:08.002Z'),
            updatedAt: DateTime.parse('2023-10-31T19:40:08.002Z'),
          ),
        ]),
    Wallet(
        description: 'Nova Carteira Teste 2',
        id: 1,
        userId: 1,
        createdAt: DateTime.parse('2023-11-03T23:03:30.990Z'),
        updatedAt: DateTime.parse('2023-11-03T23:03:30.990Z'),
        coins: [
          Coin(
            id: 29,
            assetId: 'ETH',
            name: 'Ethereum',
            dataStart: DateTime.parse('2017-08-20'),
            dataEnd: DateTime.parse('2023-10-31'),
            symbolId: 'BITSTAMP_SPOT_ETH_USD',
            createdAt: DateTime.parse('2023-11-01T14:57:02.637Z'),
            updatedAt: DateTime.parse('2023-11-01T14:57:02.637Z'),
          ),
          Coin(
            id: 83,
            name: 'BitcoinA',
            assetId: 'BTC',
            dataStart: DateTime.parse('2011-09-13'),
            dataEnd: DateTime.parse('2023-10-30'),
            price: 34510.5,
            iconId: "4caf2b16a0174e26at482cea69c34cba",
            symbolId: 'BITSTAMP_SPOT_BTC_USD',
            createdAt: DateTime.parse('2023-10-31T19:40:08.002Z'),
            updatedAt: DateTime.parse('2023-10-31T19:40:08.002Z'),
          ),
          Coin(
            id: 84,
            name: 'BitcoinB',
            assetId: 'BTC',
            dataStart: DateTime.parse('2011-09-13'),
            dataEnd: DateTime.parse('2023-10-30'),
            price: 34510.5,
            iconId: "4caf2b16a0174e26a3482cea69c34cba",
            symbolId: 'BITSTAMP_SPOT_BTC_USD',
            createdAt: DateTime.parse('2023-10-31T19:40:08.002Z'),
            updatedAt: DateTime.parse('2023-10-31T19:40:08.002Z'),
          ),
        ]),
    Wallet(
        description: 'Nova Carteira Teste 3',
        id: 1,
        userId: 1,
        createdAt: DateTime.parse('2023-11-03T23:03:30.990Z'),
        updatedAt: DateTime.parse('2023-11-03T23:03:30.990Z'),
        coins: [
          Coin(
            id: 29,
            assetId: 'ETH',
            name: 'Ethereum',
            dataStart: DateTime.parse('2017-08-20'),
            dataEnd: DateTime.parse('2023-10-31'),
            symbolId: 'BITSTAMP_SPOT_ETH_USD',
            createdAt: DateTime.parse('2023-11-01T14:57:02.637Z'),
            updatedAt: DateTime.parse('2023-11-01T14:57:02.637Z'),
          ),
          Coin(
            id: 83,
            name: 'BitcoinA',
            assetId: 'BTC',
            dataStart: DateTime.parse('2011-09-13'),
            dataEnd: DateTime.parse('2023-10-30'),
            price: 34510.5,
            iconId: "4caf2b16a0174e26at482cea69c34cba",
            symbolId: 'BITSTAMP_SPOT_BTC_USD',
            createdAt: DateTime.parse('2023-10-31T19:40:08.002Z'),
            updatedAt: DateTime.parse('2023-10-31T19:40:08.002Z'),
          ),
          Coin(
            id: 84,
            name: 'BitcoinB',
            assetId: 'BTC',
            dataStart: DateTime.parse('2011-09-13'),
            dataEnd: DateTime.parse('2023-10-30'),
            price: 34510.5,
            iconId: "4caf2b16a0174e26a3482cea69c34cba",
            symbolId: 'BITSTAMP_SPOT_BTC_USD',
            createdAt: DateTime.parse('2023-10-31T19:40:08.002Z'),
            updatedAt: DateTime.parse('2023-10-31T19:40:08.002Z'),
          ),
        ]),
  ];

  test('should get wallets from repository', () async {
    when(() => mockWalletRepository.getWallets(userId: any(named: 'userId')))
        .thenAnswer((_) async => Right(tWallets));

    final result = await usecase(GetWalletsParams(userId: tUserId));

    expect(result, equals(Right(tWallets)));

    verify(() => mockWalletRepository.getWallets(userId: tUserId));

    verifyNoMoreInteractions(mockWalletRepository);
  });
}
