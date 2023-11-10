// Project imports:
import 'package:crypto_wallet/modules/coin/data/models/coin_model.dart';
import 'package:crypto_wallet/modules/wallet/domain/entities/wallet.dart';

class WalletModel extends Wallet {
  const WalletModel({
    required int id,
    required String description,
    required int userId,
    required List<CoinModel> coins,
    required DateTime createdAt,
    required DateTime updatedAt,
  }) : super(
          id: id,
          description: description,
          userId: userId,
          coins: coins,
          createdAt: createdAt,
          updatedAt: updatedAt,
        );

  factory WalletModel.fromJson(Map<String, dynamic> json) {
    final Map<String, dynamic> wallet = json['wallet'];
    return WalletModel(
      id: wallet['id'] as int,
      description: wallet['description'] as String,
      userId: wallet['user_id'] as int,
      coins: (json['coins'] as List)
          .map((e) => CoinModel.fromJson(json: e as Map<String, dynamic>))
          .toList(),
      createdAt: DateTime.parse(wallet['created_at'] as String),
      updatedAt: DateTime.parse(wallet['updated_at'] as String),
    );
  }

  Map<String, dynamic> toJson() {
    final List<CoinModel> coins = this.coins as List<CoinModel>;

    return {
      'id': id,
      'description': description,
      'user_id': userId,
      'coins': coins.map((e) => e.toJson()).toList(),
      'created_at': createdAt.toIso8601String(),
      'updated_at': updatedAt.toIso8601String(),
    };
  }
}
