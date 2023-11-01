// Package imports:
import 'package:equatable/equatable.dart';

class Coin extends Equatable {
  final int id;
  final String assetId;
  final String name;
  final DateTime dateStart;
  final DateTime dateEnd;
  final double price;
  final String iconId;
  final DateTime createdAt;
  final DateTime updatedAt;

  const Coin({
    required this.id,
    required this.assetId,
    required this.name,
    required this.dateStart,
    required this.dateEnd,
    required this.price,
    required this.iconId,
    required this.createdAt,
    required this.updatedAt,
  });

  @override
  List<Object?> get props => [
        id,
        assetId,
        name,
        dateStart,
        dateEnd,
        price,
        iconId,
        createdAt,
        updatedAt,
      ];
}
