abstract class AppException implements Exception {
  final String message;

  const AppException(this.message);

  @override
  String toString() => message;
}

// Network / API error
class ServerException extends AppException {
  const ServerException([String message = 'Server error occurred'])
    : super(message);
}

// Invalid credentials
class InvalidCredentialsException extends AppException {
  const InvalidCredentialsException([String message = 'Invalid credentials'])
    : super(message);
}

// No internet
class NetworkException extends AppException {
  const NetworkException([String message = 'No internet connection'])
    : super(message);
}

// Unknown error
class UnknownException extends AppException {
  const UnknownException([String message = 'Unknown error occurred'])
    : super(message);
}
