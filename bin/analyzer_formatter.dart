import 'dart:io';

import 'package:analyzer_formatter/src/analyzer_result_parser.dart';
import 'package:analyzer_formatter/src/impl/checkstyle_xml_report.dart';
import 'package:analyzer_formatter/src/analyzer_reports_creator.dart';

Future<void> main(List<String> arguments) async {
  final outputFileName = '${Directory.current.path}/flutter_analyze_output.txt';
  final result = await Process.run(
    'flutter analyze > $outputFileName',
    [],
    runInShell: true,
  );
  if (result.exitCode != 0) {
    String reportFilename = 'checkstyle-report';
    final analyzerResultParser = AnalyzerResultParser(File(outputFileName));
    final problemFiles = analyzerResultParser.problemFiles();
    final reportsCreator = AnalyzerReportsCreator(
        [XmlReportInstance],
        problemFiles,
        reportFilename,
    );
    reportsCreator.createReports();
    exit(-1);
  } else {
    exit(0);
  }
}
