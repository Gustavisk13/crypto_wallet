// Dart imports:

// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:dio/dio.dart';

// Project imports:
import 'package:crypto_wallet/global/models/autenticacao_model.dart';
import 'package:crypto_wallet/global/services/dio/custom_dio.dart';
import 'package:crypto_wallet/global/services/dio/custom_options.dart';

class AutenticacaoRepository {
  var options = CustomOptions.getOptions();

  Future<bool> login(AutenticacaoModel autenticacaoModel) async {
    var dio = CustomDio(options);
    try {
      var response = await dio.post('/authenticate',
          data: autenticacaoModel.toJson(),
          options: Options(extra: {"refresh": true}));
      if (response.statusCode == 200) {
        autenticacaoModel.tokenAcesso = response.data['token'];
        return true;
      } else {
        return false;
      }
    } catch (e) {
      debugPrint(e.toString());
      return false;
    }
  }
}
