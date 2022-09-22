import 'dart:convert';

import 'package:universal_html/html.dart';

final storage = window.localStorage;

void setToken(String token) {
  storage['token'] = token;
}

String? getToken() {
  return storage['token'];
}

void logout() {
  storage.remove('auth_token');
  storage.remove('usuario');
  storage.remove('rotaAtual');
}

bool isAuthenticated() {
  print(storage['token']);
  return storage['token'] != null;
}

/* Future<void> setUsuario(UsuarioModel usuario) async {
  // FilialController filialController = FilialController();
  Map<String, dynamic> usuarioMap = usuario.toJson();
  storage['usuario'] = await jsonEncode(usuarioMap);
} */

/* UsuarioModel getUsuario() {
  Map<String, dynamic> json = jsonDecode(storage['usuario']!);
  print(json);
  UsuarioModel usuario = UsuarioModel.fromJson(json);

  return usuario;
} */

/* void setReUsuario(String reUsuario) {
  storage['reUsuario'] = reUsuario;
}

String? getReUsuario() {
  return storage['reUsuario'];
}

void setCheckSalvaLogin(bool salva) {
  storage['salvaLogin'] = salva.toString();
}

bool getCheckSalvaLogin() {
  if (storage['salvaLogin'] == 'true') {
    return true;
  } else {
    return false;
  }
}

setRotaAtual(String rotaAtual) {
  storage['rotaAtual'] = rotaAtual;
}

String getRotaAtual() {
  if (storage['rotaAtual'] != null) {
    return storage['rotaAtual']!;
  } else {
    return '/';
  }
} */
