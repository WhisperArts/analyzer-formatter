/// Relative path to Dart Analyzer report.
/// Use it if you override default filename of Dart Analyzer output (`analyzer_report.txt`).
const argumentAnalyzerReportFile = '--analyzerReportFile';

/// Customize report filename.
const argumentReportSuffix = '--outputSuffix';
// ignore: public_member_api_docs.
const argumentHelp = '--help';

/// Convert Dart Analyzer report to JUnit compatible format.
const testStyle = '--testStyle';

/// Separate all parameters which take a value with `=`.
/// For example: `analyzer_formatter --argumentAnalyzerReportFile=dart_analyzer_report`.
const parameterSeparator = '=';
