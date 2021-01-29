import 'report.dart';

class ReportUnit {
  final ReportType reportType;
  final Report report;
  final String prefix;
  final String extension;

  ReportUnit(
    this.reportType,
    this.report,
    this.prefix,
    this.extension,
  );
}

enum ReportType {
  checkstyleXml,
}
