// Package imports:
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

// Project imports:
import 'package:crypto_wallet/modules/coin/domain/entities/coin.dart';
import 'package:crypto_wallet/modules/coin/domain/repositories/coin_repository.dart';
import 'package:crypto_wallet/modules/coin/domain/usecases/get_coins_paginated.dart';

class MockCoinRepository extends Mock implements CoinRepository {}

void main() {
  late GetCoinsPaginated usecase;
  late MockCoinRepository mockCoinRepository;

  setUpAll(() {
    mockCoinRepository = MockCoinRepository();
    usecase = GetCoinsPaginated(repository: mockCoinRepository);
  });

  final List<Coin> tCoinsPaginated = [
    Coin(
      id: 85,
      name: 'BitcoinD',
      assetId: 'BTC',
      dataStart: DateTime.parse('2011-09-13'),
      dataEnd: DateTime.parse('2023-10-30'),
      price: 34510.5,
      iconId: "4caf2b16a0174e26a3482cea69c34cba",
      symbolId: 'BITSTAMP_SPOT_BTC_USD',
      createdAt: DateTime.parse('2023-10-31T19:40:08.002Z'),
      updatedAt: DateTime.parse('2023-10-31T19:40:08.002Z'),
    ),
    Coin(
      id: 86,
      name: 'BitcoinE',
      assetId: 'BTC',
      dataStart: DateTime.parse('2011-09-13'),
      dataEnd: DateTime.parse('2023-10-30'),
      price: 34510.5,
      iconId: "4caf2b16a0174e26at482cea69c34cba",
      symbolId: 'BITSTAMP_SPOT_BTC_USD',
      createdAt: DateTime.parse('2023-10-31T19:40:08.002Z'),
      updatedAt: DateTime.parse('2023-10-31T19:40:08.002Z'),
    ),
  ];

  test('should get coins paginated from the repository', () async {
    when(() => mockCoinRepository.getCoinsPaginated(
            pageNumber: any(named: 'pageNumber')))
        .thenAnswer((_) async => Right(tCoinsPaginated));

    final result = await usecase(const GetCoinsPaginatedParams(pageNumber: 2));

    expect(result, Right(tCoinsPaginated));

    verify(
      () => mockCoinRepository.getCoinsPaginated(pageNumber: 2),
    );

    verifyNoMoreInteractions(mockCoinRepository);
  });
}
