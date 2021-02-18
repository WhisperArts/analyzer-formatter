import 'dart:io';

import 'package:path/path.dart';

import 'api/file_with_issues.dart';
import 'api/report_unit.dart';

// ignore: public_member_api_docs
void formatAnalyzerReport(
  Iterable<ReportUnit> reportUnits,
  Iterable<FileWithIssues> problemFiles,
  String suffix,
) {
  reportUnits.forEach((reportUnit) {
    final reportFilePath =
        '${Directory.current.path}$separator${reportUnit.prefix}-$suffix.${reportUnit.extension}';
    final report = File(reportFilePath);
    if (report.existsSync()) {
      report.deleteSync();
    }
    report.writeAsStringSync(reportUnit.report.format(problemFiles));
  });
}
