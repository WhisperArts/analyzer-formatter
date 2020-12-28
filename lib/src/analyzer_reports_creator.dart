import 'dart:io';

import 'package:analyzer_formatter/src/api/file_with_issues.dart';
import 'package:analyzer_formatter/src/api/report.dart';

class AnalyzerReportsCreator {
  final Iterable<ReportUnit> _reportUnits;
  final Iterable<FileWithIssues> _problemFiles;
  final String _filename;

  AnalyzerReportsCreator(
    this._reportUnits,
    this._problemFiles,
    this._filename,
  );

  void createReports() {
    _reportUnits.forEach((reportUnit) {
      final report = File('${Directory.current.path}/$_filename.${reportUnit.extension}');
      if (report.existsSync()) {
        report.deleteSync();
      }
      report.writeAsStringSync(reportUnit.report.format(_problemFiles));
      report.create();
    });
  }
}

class ReportUnit {
  final ReportType reportType;
  final Report report;
  final String extension;

  ReportUnit(
    this.reportType,
    this.report,
    this.extension,
  );
}

enum ReportType {
  xml,
}
