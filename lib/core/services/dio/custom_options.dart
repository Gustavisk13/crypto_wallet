// Package imports:
import 'package:dio/dio.dart';

class CustomOptions {
  static var options = BaseOptions(
    baseUrl: 'https://apicryptowallet.herokuapp.com',
    connectTimeout: 5000,
    receiveTimeout: 3000,
    headers: {
      'Content-type': 'application/json',
      'Accept': 'application/json',
    },
  );

  static getOptions() {
    return options;
  }
}
