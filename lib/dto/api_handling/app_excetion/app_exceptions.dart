class AppException implements Exception {
  final _message;
  final _prefix;

  AppException([this._message, this._prefix]);

  @override
  String toString() {
    return "$_prefix$_message";
  }
}

class UniversalException extends AppException {
  UniversalException([String? message])
      : super(message, "Error During Communication: ");
}

class FetchDataException extends AppException {
  FetchDataException([String? message]) : super(message, "Internet Error: ");
}

class BadRequestException extends AppException {
  BadRequestException([message]) : super(message, "Bad Request: ");
}

class UnauthorisedException extends AppException {
  UnauthorisedException([message]) : super(message, "Unauthorised: ");
}

class InvalidInputException extends AppException {
  InvalidInputException([String? message]) : super(message, "Invalid Input: ");
}

class BadGateway extends AppException {
  BadGateway([String? message])
      : super(message, "Error While Communicating With Server: ");
}
