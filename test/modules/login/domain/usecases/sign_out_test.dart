// Package imports:
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

// Project imports:
import 'package:crypto_wallet/core/domain/usecases/usecase.dart';
import 'package:crypto_wallet/modules/auth/domain/repositories/auth_repository.dart';
import 'package:crypto_wallet/modules/auth/domain/usecases/sign_out.dart';

class MockAuthRepository extends Mock implements AuthRepository {}

void main() {
  late MockAuthRepository repository;
  late SignOut usecase;

  setUpAll(() {
    repository = MockAuthRepository();
    usecase = SignOut(repository: repository);
  });

  test('should perform a sign out', () async {
    when(() => repository.signOut()).thenAnswer(
      (_) async => const Right(null),
    );

    final result = await usecase(NoParams());

    expect(result, const Right(null));
    verify(() => repository.signOut()).called(1);
    verifyNoMoreInteractions(repository);
  });
}
