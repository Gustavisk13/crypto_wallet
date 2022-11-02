import 'package:crypto_wallet/global/models/autenticacao_model.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart' as getx;

class CustomInterceptors extends InterceptorsWrapper {
  @override
  Future onRequest(RequestOptions options, RequestInterceptorHandler handler) async {
    AutenticacaoModel autenticacao = getx.Get.put(AutenticacaoModel());
    if (autenticacao.tokenAcesso != null) {
      options.headers['Authorization'] = 'Bearer ${autenticacao.tokenAcesso}';
    }
    return super.onRequest(options, handler);
  }

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    if (err.response?.statusCode == 401) {
      getx.Get.offAllNamed('/login');
    }
    return super.onError(err, handler);
  }
}
