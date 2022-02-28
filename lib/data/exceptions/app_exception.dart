class AppException implements Exception {
  String? message;

  AppException({this.message});
}

class NoInternetException extends AppException {}
