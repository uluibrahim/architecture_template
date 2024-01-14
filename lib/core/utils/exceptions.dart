class CustomException implements Exception {
  String? message;
  CustomException(this.message);
}

class AuthException implements Exception {}

class NetworkException implements Exception {}
