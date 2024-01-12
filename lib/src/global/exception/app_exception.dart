class AppException implements Exception {
  // ignore: prefer_typing_uninitialized_variables
  final _message;
  // ignore: prefer_typing_uninitialized_variables
  final _prefix;
  AppException([this._message, this._prefix]);

  @override
  String toString() {
    return '$_prefix$_message';
  }
}

class InternetException extends AppException {
  InternetException([String? message]) : super(message, "Error: ");
}

class RequestTimeOutException extends AppException {
  RequestTimeOutException([String? message]) : super(message, "Error: ");
}

class ServerException extends AppException {
  ServerException([String? message]) : super(message, "Error: ");
}

class InvalidUrlException extends AppException {
  InvalidUrlException([String? message]) : super(message, "Error: ");
}

class FetchDataException extends AppException {
  FetchDataException([String? message]) : super(message, "Error: ");
}

class MethodNotAllowedException extends AppException {
  MethodNotAllowedException([String? message]) : super(message, "Error: ");
}

class NotFoundException extends AppException {
  NotFoundException([String? message]) : super(message, "Error: ");
}

class BadRequestException extends AppException {
  BadRequestException([String? message]) : super(message, "Error: ");
}
