// Package imports:
import 'package:dio/dio.dart';
import 'package:dio/native_imp.dart';

// Project imports:
import 'package:crypto_wallet/global/interceptors/cache_interceptors.dart';
import 'package:crypto_wallet/global/interceptors/custom_interceptors.dart';

class CustomDio extends DioForNative {
  CustomDio([BaseOptions? options]) : super(options) {
    interceptors.add(CustomInterceptors());
    interceptors.add(CacheInterceptors());
  }
}
