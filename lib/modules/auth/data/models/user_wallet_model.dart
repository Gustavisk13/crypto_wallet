// Project imports:
import 'package:crypto_wallet/modules/auth/domain/entities/user_wallet.dart';

class UserWalletModel extends UserWallet {
  const UserWalletModel({
    required int id,
    required String description,
    required int userId,
    required DateTime createdAt,
    required DateTime updatedAt,
  }) : super(
          id: id,
          description: description,
          userId: userId,
          createdAt: createdAt,
          updatedAt: updatedAt,
        );

  factory UserWalletModel.fromJson(Map<String, dynamic> json) {
    return UserWalletModel(
      id: json['id'] as int,
      description: json['description'] as String,
      userId: json['user_id'] as int,
      createdAt: DateTime.parse(json['created_at'] as String),
      updatedAt: DateTime.parse(json['updated_at'] as String),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'description': description,
      'user_id': userId,
      'created_at': createdAt.toIso8601String(),
      'updated_at': updatedAt.toIso8601String(),
    };
  }
}
