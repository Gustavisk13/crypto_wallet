import 'dart:convert';

import 'package:crypto_wallet/src/api/auth.dart';
import 'package:crypto_wallet/src/api/crypto_wallet_api.dart';
import 'package:crypto_wallet/src/api/status_code.dart';
import 'package:crypto_wallet/src/model/autenticacao_model.dart';
import 'package:http/http.dart';

class AutenticacaoRepository {
  String path = '/authenticate';
  late ApiService api;

  AutenticacaoRepository() {
    api = ApiService();
  }

  Future<bool> login(AutenticacaoModel autenticacao) async {
    Response response = await api.post(path, autenticacao.toJson());
    if (response.statusCode == 200) {
      //Seta token
      setToken(jsonDecode(response.body)['auth_token']);
      // authenticateUser = authenticate;

      return true;
    } else {
      var error = json.decode(response.body)['error'];
      print('Error: bungus');
      throw error;
    }
  }

  /*  Future<void> buscar() async {
    Response response = await api.get(path);

    if (response.statusCode == StatusCode.OK) {
      usuario = UsuarioModel.fromJson(jsonDecode(response.body));
    } else {
      var error = json.decode(response.body)['error'];

      throw error;
    }
  } */
}
