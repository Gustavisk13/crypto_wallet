// Package imports:
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

// Project imports:
import 'package:crypto_wallet/modules/wallet/domain/repositories/wallet_repository.dart';
import 'package:crypto_wallet/modules/wallet/domain/usecases/delete_wallet.dart';

class MockWalletRepository extends Mock implements WalletRepository {}

void main() {
  late MockWalletRepository mockWalletRepository;
  late DeleteWallet usecase;

  setUpAll(() {
    mockWalletRepository = MockWalletRepository();
    usecase = DeleteWallet(repository: mockWalletRepository);
  });

  const int tWalletId = 1;

  test('should delete wallet from repository', () async {
    when(() => mockWalletRepository.deleteWallet(
          walletId: any(named: 'walletId'),
        )).thenAnswer((_) async => const Right(null));

    final result = await usecase(DeleteWalletParams(walletId: tWalletId));

    expect(result, const Right(null));
    verify(() => mockWalletRepository.deleteWallet(walletId: tWalletId));
    verifyNoMoreInteractions(mockWalletRepository);
  });
}
