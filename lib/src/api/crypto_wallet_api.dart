import 'dart:async';
import 'dart:convert';

import 'package:crypto_wallet/src/api/auth.dart';
import 'package:crypto_wallet/src/api/status_code.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'package:get/get.dart';

class ApiService {
  late String? baseUrl;
  late Map<String, String> headers;

  ApiService() {
    baseUrl = dotenv.env['API_URL'];
    headers = {
      'Content-type': 'application/json',
      'Accept': 'application/json',
    };
  }

  String? getBaseUrl() {
    return baseUrl;
  }

  Map<String, String> getHeader() {
    if (isAuthenticated()) {
      String? token = getToken();
      if (token != null) {
        headers['Authorization'] = 'Bearer ' + token;
      }
    } else {
      logout();
    }

    return headers;
  }

  Future<http.Response> get(String endpoint, {Map<String, String>? queryParameters}) async {
    try {
      var uri = Uri.parse(baseUrl! + endpoint).replace(queryParameters: queryParameters);

      http.Response response = await http.get(uri, headers: getHeader()).timeout(const Duration(seconds: 300));

      if (response.statusCode == StatusCode.UNAUTHORIZED) {
        logout();
        Get.offAllNamed('/login');
        throw 'Usuário não autenticado';
      }

      return response;
    } on TimeoutException {
      throw "Tempo de conexão excedido, tente novamente !";
    }
  }

  Future<dynamic> post(String path, body) async {
    try {
      var uri = Uri.parse(baseUrl! + path);
      var response = await http.post(uri, headers: getHeader(), body: jsonEncode(body)).timeout(const Duration(seconds: 300));

      if (response.statusCode == StatusCode.UNAUTHORIZED) {
        logout();
        Get.toNamed('/login');
      }

      return response;
    } on TimeoutException {
      throw "Tempo de conexão excedido, tente novamente !";
    }
  }

  Future<dynamic> postFile(String path, file) async {
    try {
      var uri = Uri.parse(baseUrl! + path);
      final request = http.MultipartRequest(
        "POST",
        uri,
      );

      request.headers.addAll(getHeader());

      //-----add selected file with request
      request.files.add(new http.MultipartFile("file", file.readStream, file.size, filename: file.name));

      //-------Send request
      var resp = await request.send();

      //------Read response
      String result = await resp.stream.bytesToString();

      return result;
    } on TimeoutException {
      throw "Tempo de conexão excedido, tente novamente !";
    }
  }

  Future<dynamic> put(String endpoint, body) async {
    try {
      var uri = Uri.parse(baseUrl! + endpoint);
      var response = await http.put(uri, headers: getHeader(), body: jsonEncode(body)).timeout(const Duration(seconds: 300));
      ;

      if (response.statusCode == StatusCode.UNAUTHORIZED) {
        logout();
        Get.toNamed('/login');
      }

      return response;
    } on TimeoutException {
      throw "Tempo de conexão excedido, tente novamente !";
    }
  }

  Future<dynamic> delete(String endpoint) async {
    try {
      var uri = Uri.parse(baseUrl! + endpoint);
      var response = await http.delete(uri, headers: getHeader()).timeout(const Duration(seconds: 300));
      ;

      if (response.statusCode == StatusCode.UNAUTHORIZED) {
        logout();
        Get.toNamed('/login');
      }

      return response;
    } on TimeoutException {
      throw "Tempo de conexão excedido, tente novamente !";
    }
  }
}
