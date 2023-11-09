// Dart imports:
import 'dart:convert';

// Package imports:
import 'package:flutter_test/flutter_test.dart';

// Project imports:
import 'package:crypto_wallet/modules/auth/data/models/user_model.dart';
import 'package:crypto_wallet/modules/auth/data/models/user_wallet_model.dart';
import '../../../../fixtures/fixture_reader.dart';

void main() {
  final UserModel tUserModel = UserModel(
    id: 1,
    name: 'Usuário teste',
    username: 'teste@email.com',
    token: 'token',
    wallets: [
      UserWalletModel(
        id: 1,
        description: 'Carteira Teste 2',
        userId: 1,
        createdAt: DateTime.parse('2023-11-03T23:03:30.990Z'),
        updatedAt: DateTime.parse('2023-11-03T23:03:30.990Z'),
      ),
      UserWalletModel(
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

  final List<UserWalletModel> tUserWallets = [
    UserWalletModel(
      id: 1,
      description: 'Carteira Teste 2',
      userId: 1,
      createdAt: DateTime.parse('2023-11-03T23:03:30.990Z'),
      updatedAt: DateTime.parse('2023-11-03T23:03:30.990Z'),
    ),
    UserWalletModel(
      id: 2,
      description: 'Carteira Teste 2',
      userId: 1,
      createdAt: DateTime.parse('2023-11-03T23:03:35.757Z'),
      updatedAt: DateTime.parse('2023-11-03T23:03:35.757Z'),
    ),
  ];

  test('should be a subclass of User entity', () async {
    expect(tUserModel, isA<UserModel>());
  });

  test('should return a valid model for userModel and userWalletModel',
      () async {
    final Map<String, dynamic> jsonMap = json.decode(fixture('user/user.json'));

    final userWalletsJson = jsonMap['wallets'] as List;

    final userWallets = userWalletsJson
        .map((e) => UserWalletModel.fromJson(e as Map<String, dynamic>))
        .toList();

    final result = UserModel.fromJson(jsonMap);

    for (var i = 0; i < userWallets.length; i++) {
      expect(result.wallets[i], equals(tUserWallets[i]));
    }

    expect(result, equals(tUserModel));
  });

  test('should return a valid model when toJson is called', () async {
    final userModelResult = tUserModel.toJson();

    final userWalletsResult = tUserWallets.map((e) => e.toJson()).toList();

    final expectedUserModelMap = {
      'id': 1,
      'name': 'Usuário teste',
      'username': 'teste@email.com',
      'token': 'token',
      'wallets': [
        {
          'id': 1,
          'description': 'Carteira Teste 2',
          'user_id': 1,
          'created_at': '2023-11-03T23:03:30.990Z',
          'updated_at': '2023-11-03T23:03:30.990Z',
        },
        {
          'id': 2,
          'description': 'Carteira Teste 2',
          'user_id': 1,
          'created_at': '2023-11-03T23:03:35.757Z',
          'updated_at': '2023-11-03T23:03:35.757Z',
        }
      ],
      'created_at': '2023-11-01T15:05:27.045Z',
      'updated_at': '2023-11-01T15:05:27.045Z',
    };

    final expectedUserWalletsMap = [
      {
        'id': 1,
        'description': 'Carteira Teste 2',
        'user_id': 1,
        'created_at': '2023-11-03T23:03:30.990Z',
        'updated_at': '2023-11-03T23:03:30.990Z',
      },
      {
        'id': 2,
        'description': 'Carteira Teste 2',
        'user_id': 1,
        'created_at': '2023-11-03T23:03:35.757Z',
        'updated_at': '2023-11-03T23:03:35.757Z',
      }
    ];

    expect(userModelResult, equals(expectedUserModelMap));

    for (var i = 0; i < userWalletsResult.length; i++) {
      expect(userWalletsResult[i], equals(expectedUserWalletsMap[i]));
    }
  });
}
