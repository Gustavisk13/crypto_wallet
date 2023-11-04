// Package imports:
import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  final List properties;

  const Failure([
    this.properties = const <dynamic>[],
  ]);

  @override
  List<Object?> get props => [properties];
}

// General failures

class ServerFailure extends Failure {
  final String message;
  final int statusCode;

  ServerFailure({
    required this.message,
    required this.statusCode,
  }) : super([message, statusCode]);
}

class CacheFailure extends Failure {}

class InvalidNameFailure extends Failure {
  final String message;

  InvalidNameFailure({
    required this.message,
  }) : super([message]);
}
