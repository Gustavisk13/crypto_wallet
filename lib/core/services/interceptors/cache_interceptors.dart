// Dart imports:
import 'dart:math';

// Package imports:
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CacheInterceptors extends InterceptorsWrapper {
  late final SharedPreferences preferences;

  CacheInterceptors() {
    SharedPreferences.getInstance().then((value) => preferences = value);
  }
  @override
  Future onResponse(
      Response response, ResponseInterceptorHandler handler) async {
    if (response.requestOptions.extra.containsKey('refresh') &&
        response.requestOptions.extra['refresh']) {
      String? cache =
          preferences.getString(response.requestOptions.uri.toString());

      if (cache == null) {
        preferences.setString(response.requestOptions.uri.toString(),
            response.data['auth_token']);
        log(response.data['auth_token']);
      }
    }

    return super.onResponse(response, handler);
  }
}
