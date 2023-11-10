// Package imports:
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

// Project imports:
import 'package:crypto_wallet/modules/coin/domain/entities/coin.dart';
import 'package:crypto_wallet/modules/wallet/domain/entities/wallet.dart';
import 'package:crypto_wallet/modules/wallet/domain/repositories/wallet_repository.dart';
import 'package:crypto_wallet/modules/wallet/domain/usecases/update_wallet.dart';

class MockWalletRepository extends Mock implements WalletRepository {}

void main() {
  late MockWalletRepository repository;
  late UpdateWallet usecase;

  setUpAll(() {
    repository = MockWalletRepository();
    usecase = UpdateWallet(repository: repository);
  });

  const int tWalletId = 1;
  const String tDescription = 'Nova Carteira Teste 1 Updated';
  const List<String> tCoinAssetIds = ['BTC', 'ETH'];

  final tWallet = Wallet(
      description: 'Nova Carteira Teste 1 Updated',
      id: 1,
      userId: 1,
      createdAt: DateTime.parse('2023-11-03T23:03:30.990Z'),
      updatedAt: DateTime.parse('2023-11-03T23:03:30.990Z'),
      coins: [
        Coin(
          id: 83,
          name: 'Bitcoin',
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
          id: 29,
          assetId: 'ETH',
          name: 'Ethereum',
          dataStart: DateTime.parse('2017-08-20'),
          dataEnd: DateTime.parse('2023-10-31'),
          symbolId: 'BITSTAMP_SPOT_ETH_USD',
          createdAt: DateTime.parse('2023-11-01T14:57:02.637Z'),
          updatedAt: DateTime.parse('2023-11-01T14:57:02.637Z'),
        ),
      ]);

  test('should update wallet from repository', () async {
    when(() => repository.updateWallet(
          walletId: any(named: 'walletId'),
          description: any(
            named: 'description',
          ),
          coinAssetIds: tCoinAssetIds,
        )).thenAnswer((_) async => Right(tWallet));

    final result = await usecase(UpdateWalletParams(
        walletId: tWalletId,
        description: tDescription,
        coinAssetIds: tCoinAssetIds));

    expect(result, Right(tWallet));

    verify(() => repository.updateWallet(
        walletId: tWalletId,
        description: tDescription,
        coinAssetIds: tCoinAssetIds));

    verifyNoMoreInteractions(repository);
  });
}
