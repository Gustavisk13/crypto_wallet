class ServerException implements Exception {
  final String message;
  final int statusCode;

  ServerException({
    required this.message,
    required this.statusCode,
  });
}

class CacheException implements Exception {}

class NetworkException implements Exception {
  final String message;

  NetworkException({
    required this.message,
  });
}

class DeviceOfflineException implements Exception {
  final String message;

  DeviceOfflineException({
    required this.message,
  });
}

class InvalidUsernameException implements Exception {
  final String message;

  InvalidUsernameException({
    required this.message,
  });
}
