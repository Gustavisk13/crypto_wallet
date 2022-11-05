// Package imports:
import 'package:dio/dio.dart';
import 'package:get/get.dart' as getx;

// Project imports:
import 'package:crypto_wallet/global/models/autenticacao_model.dart';
import 'package:crypto_wallet/global/utils/snackbar_hancdler.dart';
import 'package:crypto_wallet/global/utils/status_code.dart';

class CustomInterceptors extends InterceptorsWrapper {
  @override
  Future onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    AutenticacaoModel autenticacao = getx.Get.put(AutenticacaoModel());
    if (autenticacao.tokenAcesso != null) {
      options.headers['Authorization'] = 'Bearer ${autenticacao.tokenAcesso}';
    }
    return super.onRequest(options, handler);
  }

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    if (err.type == DioErrorType.connectTimeout ||
        err.type == DioErrorType.receiveTimeout) {
      getx.Get.showSnackbar(
          SnackbarHandler.showSnackbarError('Erro de conexão com o servidor'));
    }

    if (err.response?.statusCode == StatusCode.badRequest) {
      getx.Get.showSnackbar(SnackbarHandler.showSnackbarError(
          err.response!.data['error']['user_authentication']));
    }

    if (err.response?.statusCode == StatusCode.unauthorized) {
      getx.Get.showSnackbar(SnackbarHandler.showSnackbarError(
          err.response!.data['error']['user_authentication']));
    }

    if (err.response?.statusCode == StatusCode.forbidden) {
      getx.Get.showSnackbar(SnackbarHandler.showSnackbarError(
          err.response!.data['error']['user_authentication']));
    }

    if (err.response?.statusCode == StatusCode.internalServerError) {
      getx.Get.showSnackbar(SnackbarHandler.showSnackbarError(
          err.response!.data['error']['user_authentication']));
    }
    return super.onError(err, handler);
  }
}
