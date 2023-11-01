// Package imports:
import 'package:equatable/equatable.dart';

class History extends Equatable {
  final String timePeriodStart;
  final String timePeriodEnd;
  final String timeOpen;
  final String timeClose;
  final double priceOpen;
  final double priceHigh;
  final double priceLow;
  final double priceClose;
  final double volumeTraded;
  final int tradesCount;

  const History({
    required this.timePeriodStart,
    required this.timePeriodEnd,
    required this.timeOpen,
    required this.timeClose,
    required this.priceOpen,
    required this.priceHigh,
    required this.priceLow,
    required this.priceClose,
    required this.volumeTraded,
    required this.tradesCount,
  });

  @override
  List<Object?> get props => [
        timePeriodStart,
        timePeriodEnd,
        timeOpen,
        timeClose,
        priceOpen,
        priceHigh,
        priceLow,
        priceClose,
        volumeTraded,
        tradesCount,
      ];
}
