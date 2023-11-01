// Package imports:
import 'package:equatable/equatable.dart';

// Project imports:
import 'package:crypto_wallet/core/domain/entities/wallet.dart';

class User extends Equatable {
  final int id;
  final String name;
  final String passwordDigest;
  final List<Wallet> wallets;
  final DateTime createdAt;
  final DateTime updatedAt;

  const User({
    required this.id,
    required this.name,
    required this.passwordDigest,
    required this.wallets,
    required this.createdAt,
    required this.updatedAt,
  });

  @override
  List<Object?> get props => [
        id,
        name,
        passwordDigest,
        wallets,
        createdAt,
        updatedAt,
      ];
}
