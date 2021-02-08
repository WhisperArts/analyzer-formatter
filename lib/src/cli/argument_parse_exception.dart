/// Exception when tool cannot parse arguments.
class ArgumentParseException implements Exception {
  final _message;

  /// You can use custom message for parsing errors.
  const ArgumentParseException(this._message);

  @override
  String toString() => 'ArgumentParseException: $_message';
}
