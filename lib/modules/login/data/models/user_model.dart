// Project imports:
import 'package:crypto_wallet/modules/login/data/models/user_wallet_model.dart';
import 'package:crypto_wallet/modules/login/domain/entities/user.dart';

class UserModel extends User {
  const UserModel({
    required int id,
    required String name,
    required String username,
    required String token,
    required List<UserWalletModel> wallets,
    required DateTime createdAt,
    required DateTime updatedAt,
  }) : super(
          id: id,
          name: name,
          username: username,
          token: token,
          wallets: wallets,
          createdAt: createdAt,
          updatedAt: updatedAt,
        );

  factory UserModel.fromJson(Map<String, dynamic> json) {
    final Map<String, dynamic> user = json['user'];

    return UserModel(
      id: user['id'] as int,
      name: user['name'] as String,
      username: user['username'] as String,
      token: json['token'] as String,
      wallets: (json['wallets'] as List)
          .map((e) => UserWalletModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      createdAt: DateTime.parse(user['created_at'] as String),
      updatedAt: DateTime.parse(user['updated_at'] as String),
    );
  }

  Map<String, dynamic> toJson() {
    final List<UserWalletModel> wallets = this.wallets as List<UserWalletModel>;

    return {
      'id': id,
      'name': name,
      'username': username,
      'token': token,
      'wallets': wallets.map((e) => e.toJson()).toList(),
      'created_at': createdAt.toIso8601String(),
      'updated_at': updatedAt.toIso8601String(),
    };
  }
}
