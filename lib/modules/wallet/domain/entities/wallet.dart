// Package imports:
import 'package:equatable/equatable.dart';

// Project imports:
import 'package:crypto_wallet/modules/coin/domain/entities/coin.dart';

class Wallet extends Equatable {
  final int id;
  final String description;
  final String userId;
  final List<Coin> coins;
  final DateTime createdAt;
  final DateTime updatedAt;

  const Wallet({
    required this.id,
    required this.description,
    required this.userId,
    required this.coins,
    required this.createdAt,
    required this.updatedAt,
  });

  @override
  List<Object?> get props => [
        id,
        description,
        userId,
        coins,
        createdAt,
        updatedAt,
      ];
}
