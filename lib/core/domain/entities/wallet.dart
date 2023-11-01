// Package imports:
import 'package:equatable/equatable.dart';

// Project imports:
import 'package:crypto_wallet/core/domain/entities/user.dart';
import 'package:crypto_wallet/modules/coin/domain/entities/coin.dart';

class Wallet extends Equatable {
  final int id;
  final String description;
  final User user;
  final List<Coin> coins;
  final DateTime createdAt;
  final DateTime updatedAt;

  const Wallet({
    required this.id,
    required this.description,
    required this.user,
    required this.coins,
    required this.createdAt,
    required this.updatedAt,
  });

  @override
  List<Object?> get props => [
        id,
        description,
        user,
        coins,
        createdAt,
        updatedAt,
      ];
}
