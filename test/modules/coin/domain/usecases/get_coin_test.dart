// Package imports:
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

// Project imports:
import 'package:crypto_wallet/modules/coin/domain/entities/coin.dart';
import 'package:crypto_wallet/modules/coin/domain/repositories/coin_repository.dart';
import 'package:crypto_wallet/modules/coin/domain/usecases/get_coin.dart';

class MockCoinRepository extends Mock implements CoinRepository {}

void main() {
  late GetCoin usecase;
  late MockCoinRepository mockCoinRepository;

  setUpAll(() {
    mockCoinRepository = MockCoinRepository();
    usecase = GetCoin(repository: mockCoinRepository);
  });

  const String tCoinAssetId = 'BTC';

  final Coin tCoin = Coin(
    id: 82,
    name: 'Bitcoin',
    assetId: 'BTC',
    dataStart: DateTime.parse('2011-09-13'),
    dataEnd: DateTime.parse('2023-10-30'),
    price: 34510.5,
    iconId: "4caf2b16a0174e26a3482cea69c34cba",
    symbolId: 'BITSTAMP_SPOT_BTC_USD',
    createdAt: DateTime.parse('2023-10-31T19:40:08.002Z'),
    updatedAt: DateTime.parse('2023-10-31T19:40:08.002Z'),
  );

  test('should get coin from repository', () async {
    when(() =>
            mockCoinRepository.getCoin(coinAssetId: any(named: 'coinAssetId')))
        .thenAnswer((_) async => Right(tCoin));

    final result = await usecase(const Params(coinAssetId: tCoinAssetId));

    expect(result, Right(tCoin));

    verify(
      () => mockCoinRepository.getCoin(coinAssetId: tCoinAssetId),
    );

    verifyNoMoreInteractions(mockCoinRepository);
  });
}
