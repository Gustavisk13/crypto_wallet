// Package imports:
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

// Project imports:
import 'package:crypto_wallet/core/domain/usecases/usecase.dart';
import 'package:crypto_wallet/modules/coin/domain/entities/coin.dart';
import 'package:crypto_wallet/modules/coin/domain/repositories/coin_repository.dart';
import 'package:crypto_wallet/modules/coin/domain/usecases/get_coins.dart';

class MockCoinRepository extends Mock implements CoinRepository {}

void main() {
  late GetCoins usecase;
  late MockCoinRepository mockCoinRepository;

  setUpAll(() {
    mockCoinRepository = MockCoinRepository();
    usecase = GetCoins(repository: mockCoinRepository);
  });

  final List<Coin> tCoins = [
    Coin(
      id: 82,
      name: 'Bitcoin',
      assetId: 'BTC',
      dateStart: DateTime.parse('2011-09-13'),
      dateEnd: DateTime.parse('2023-10-30'),
      price: 34510.5,
      iconId: "4caf2b16a0174e26a3482cea69c34cba",
      createdAt: DateTime.parse('2023-10-31T19:40:08.002Z'),
      updatedAt: DateTime.parse('2023-10-31T19:40:08.002Z'),
    ),
    Coin(
      id: 83,
      name: 'BitcoinA',
      assetId: 'BTC',
      dateStart: DateTime.parse('2011-09-13'),
      dateEnd: DateTime.parse('2023-10-30'),
      price: 34510.5,
      iconId: "4caf2b16a0174e26at482cea69c34cba",
      createdAt: DateTime.parse('2023-10-31T19:40:08.002Z'),
      updatedAt: DateTime.parse('2023-10-31T19:40:08.002Z'),
    ),
    Coin(
      id: 84,
      name: 'BitcoinB',
      assetId: 'BTC',
      dateStart: DateTime.parse('2011-09-13'),
      dateEnd: DateTime.parse('2023-10-30'),
      price: 34510.5,
      iconId: "4caf2b16a0174e26a3482cea69c34cba",
      createdAt: DateTime.parse('2023-10-31T19:40:08.002Z'),
      updatedAt: DateTime.parse('2023-10-31T19:40:08.002Z'),
    ),
  ];

  test('should get coins from the repository', () async {
    when(() => mockCoinRepository.getCoins())
        .thenAnswer((_) async => Right(tCoins));

    final result = await usecase(NoParams());

    expect(result, Right(tCoins));

    verify(
      () => mockCoinRepository.getCoins(),
    );

    verifyNoMoreInteractions(mockCoinRepository);
  });
}
