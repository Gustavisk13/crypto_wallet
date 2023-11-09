// Package imports:
import 'package:equatable/equatable.dart';

class UserWallet extends Equatable {
  final int id;
  final String description;
  final int userId;
  final DateTime createdAt;
  final DateTime updatedAt;

  const UserWallet({
    required this.id,
    required this.description,
    required this.userId,
    required this.createdAt,
    required this.updatedAt,
  });

  @override
  List<Object?> get props => [
        id,
        description,
        userId,
        createdAt,
        updatedAt,
      ];
}
