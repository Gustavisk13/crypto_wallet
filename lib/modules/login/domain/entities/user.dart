// Package imports:
import 'package:equatable/equatable.dart';

// Project imports:
import 'package:crypto_wallet/modules/login/domain/entities/user_wallet.dart';

class User extends Equatable {
  final int id;
  final String name;
  final String username;
  final List<UserWallet> wallets;
  final DateTime createdAt;
  final DateTime updatedAt;

  const User({
    required this.id,
    required this.name,
    required this.username,
    required this.wallets,
    required this.createdAt,
    required this.updatedAt,
  });

  @override
  List<Object?> get props => [
        id,
        name,
        username,
        wallets,
        createdAt,
        updatedAt,
      ];
}
