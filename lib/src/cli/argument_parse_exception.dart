class ArgumentParseException implements Exception {
  final _message;

  const ArgumentParseException(this._message);

  @override
  String toString() => 'ArgumentParseException: $_message';
}
