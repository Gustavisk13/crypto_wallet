// Package imports:
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

// Project imports:
import 'package:crypto_wallet/core/domain/usecases/usecase.dart';
import 'package:crypto_wallet/modules/auth/domain/entities/user.dart';
import 'package:crypto_wallet/modules/auth/domain/entities/user_wallet.dart';
import 'package:crypto_wallet/modules/auth/domain/repositories/auth_repository.dart';
import 'package:crypto_wallet/modules/auth/domain/usecases/register.dart';

class MockAuthRepository extends Mock implements AuthRepository {}

void main() {
  late MockAuthRepository repository;
  late Register usecase;

  setUpAll(() {
    repository = MockAuthRepository();
    usecase = Register(repository: repository);
  });

  const String tUserName = 'teste@mail.com';
  const String tPassword = '123456';
  const String tName = 'Usuário teste';

  final User tUser = User(
    id: 1,
    name: 'Usuário teste',
    username: 'teste@email.com',
    token: 'token',
    wallets: [
      UserWallet(
        id: 1,
        description: 'Carteira Teste 2',
        userId: 1,
        createdAt: DateTime.parse('2023-11-03T23:03:30.990Z'),
        updatedAt: DateTime.parse('2023-11-03T23:03:30.990Z'),
      ),
      UserWallet(
        id: 2,
        description: 'Carteira Teste 2',
        userId: 1,
        createdAt: DateTime.parse('2023-11-03T23:03:35.757Z'),
        updatedAt: DateTime.parse('2023-11-03T23:03:35.757Z'),
      ),
    ],
    createdAt: DateTime.parse('2023-11-01T15:05:27.045Z'),
    updatedAt: DateTime.parse('2023-11-01T15:05:27.045Z'),
  );

  test('should register a new user with username, name and password', () async {
    when(() => repository.register(
        username: any(named: 'username'),
        password: any(named: 'password'),
        name: any(named: 'name'))).thenAnswer(
      (_) async => Right(tUser),
    );

    final result = await usecase(
      const AuthParams(
        username: tUserName,
        password: tPassword,
        name: tName,
      ),
    );

    expect(result, Right(tUser));
    verify(() => repository.register(
          username: tUserName,
          password: tPassword,
          name: tName,
        ));
    verifyNoMoreInteractions(repository);
  });
}
