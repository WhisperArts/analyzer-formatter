/// Exception when tool cannot parse Dart Analyzer report.
class AnalyzerReportInvalidFormatException implements Exception {
  final _message;

  /// You can use custom message for parsing errors.
  const AnalyzerReportInvalidFormatException(this._message);

  @override
  String toString() => 'AnalyzerReportInvalidFormatException: $_message';
}
