// Package imports:
import 'package:equatable/equatable.dart';

class Coin extends Equatable {
  final int id;
  final String assetId;
  final String name;
  final DateTime dataStart;
  final DateTime dataEnd;
  final double? price;
  final String? iconId;
  final String symbolId;
  final DateTime createdAt;
  final DateTime updatedAt;

  const Coin({
    required this.id,
    required this.assetId,
    required this.name,
    required this.dataStart,
    required this.dataEnd,
    this.price,
    this.iconId,
    required this.symbolId,
    required this.createdAt,
    required this.updatedAt,
  });

  @override
  List<Object?> get props => [
        id,
        assetId,
        name,
        dataStart,
        dataEnd,
        price,
        iconId,
        symbolId,
        createdAt,
        updatedAt,
      ];
}
