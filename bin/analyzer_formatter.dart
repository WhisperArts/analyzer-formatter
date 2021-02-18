import 'dart:io';

import 'package:analyzer_formatter/analyzer_formatter.dart';
import 'package:analyzer_formatter/src/cli/argument_parse_exception.dart';
import 'package:analyzer_formatter/src/cli/arguments.dart';
import 'package:analyzer_formatter/src/cli/arguments_parser.dart';
import 'package:analyzer_formatter/src/impl/checkstyle_xml_report.dart';
import 'package:analyzer_formatter/src/analyzer_result_parser.dart';
import 'package:analyzer_formatter/src/impl/teststyle_xml_report.dart';
import 'package:path/path.dart';

const _defaultReportSuffix = 'report';

const _successExitCode = 0;
const _argumentParseExceptionExitCode = -1;
const _reportFileNotFoundExitCode = -2;
const _hasErrorsExitCode = -3;

Future<void> main(List<String> arguments) async {
  final parsedArgs = <String, String>{};
  try {
    parsedArgs.addAll(parseArguments(arguments));
    if (parsedArgs[argumentHelp] != null) {
      // TODO: add usage info
      exit(_successExitCode);
    }
  } on ArgumentParseException catch (e) {
    print(e);
    exit(_argumentParseExceptionExitCode);
  }
  final reportFileName =
      parsedArgs[argumentAnalyzerReportFile] ?? 'analyzer_report.txt';
  final reportFile = File(absolute(reportFileName));
  if (reportFile.existsSync()) {
    final problemFiles = parseAnalyzerReport(reportFile);
    final suffix = parsedArgs[argumentReportSuffix] ?? _defaultReportSuffix;
    final reporter = parsedArgs[testStyle] == 'true'
        ? TestStyleXmlReportInstance
        : CheckstyleXmlReportInstance;
    formatAnalyzerReport(
      [reporter],
      problemFiles,
      suffix,
    );
    if (problemFiles.isNotEmpty) {
      exit(_hasErrorsExitCode);
    } else {
      exit(_successExitCode);
    }
  } else {
    print(
        'Dart Analyzer report file not found. Searched for name: $reportFileName');
    exit(_reportFileNotFoundExitCode);
  }
}
