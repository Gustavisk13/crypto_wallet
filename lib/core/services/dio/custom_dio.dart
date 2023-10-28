// Package imports:
import 'package:dio/dio.dart';
import 'package:dio/native_imp.dart';

// Project imports:
import 'package:crypto_wallet/core/services/interceptors/cache_interceptors.dart';
import 'package:crypto_wallet/core/services/interceptors/custom_interceptors.dart';

class CustomDio extends DioForNative {
  CustomDio([BaseOptions? options]) : super(options) {
    interceptors.add(CustomInterceptors());
    interceptors.add(CacheInterceptors());
  }
}
