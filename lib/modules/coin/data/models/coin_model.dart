// Project imports:
import 'package:crypto_wallet/modules/coin/domain/entities/coin.dart';

class CoinModel extends Coin {
  const CoinModel({
    required int id,
    required String assetId,
    required String name,
    required DateTime dataStart,
    required DateTime dataEnd,
    double? price,
    String? iconId,
    required String symbolId,
    required DateTime createdAt,
    required DateTime updatedAt,
  }) : super(
          id: id,
          assetId: assetId,
          name: name,
          dataStart: dataStart,
          dataEnd: dataEnd,
          price: price,
          iconId: iconId,
          symbolId: symbolId,
          createdAt: createdAt,
          updatedAt: updatedAt,
        );

  factory CoinModel.fromJson({required Map<String, dynamic> json}) {
    return CoinModel(
      id: json['id'],
      assetId: json['asset_id'],
      name: json['name'],
      dataStart: DateTime.parse(json['data_start']),
      dataEnd: DateTime.parse(json['data_end']),
      price:
          json['price'] != null ? (json['price'] as double).toDouble() : null,
      iconId: _formatIconId(iconId: json['icon_id']),
      symbolId: json['symbol_id'],
      createdAt: DateTime.parse(json['created_at']),
      updatedAt: DateTime.parse(json['updated_at']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "asset_id": assetId,
      "name": name,
      "data_start": dataStart.toIso8601String(),
      "data_end": dataEnd.toIso8601String(),
      "price": price,
      "icon_id": iconId,
      "symbol_id": symbolId,
      "created_at": createdAt.toIso8601String(),
      "updated_at": updatedAt.toIso8601String(),
    };
  }

  static String? _formatIconId({String? iconId}) {
    if (iconId != null) {
      iconId = iconId.replaceAll("-", "");
    }

    return iconId;
  }
}
