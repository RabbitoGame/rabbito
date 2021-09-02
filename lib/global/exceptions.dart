class InvalidUsernameException implements Exception{
  String cause;
  InvalidUsernameException(this.cause);
}
class InvalidPasswordException implements Exception{
  String cause;
  InvalidPasswordException(this.cause);
}
class InvalidEmailException implements Exception{
  String cause;
  InvalidEmailException(this.cause);
}
