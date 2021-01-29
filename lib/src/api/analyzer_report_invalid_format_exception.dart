class AnalyzerReportInvalidFormatException implements Exception {
  final _message;

  const AnalyzerReportInvalidFormatException(this._message);

  @override
  String toString() => 'AnalyzerReportInvalidFormatException: $_message';
}
