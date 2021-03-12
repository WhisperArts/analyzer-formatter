import 'report.dart';

/// Representation of a report.
/// Using for create report files with prefix and extension.
class ReportUnit {
  // ignore: public_member_api_docs
  final ReportType reportType;
  // ignore: public_member_api_docs
  final Report report;
  // ignore: public_member_api_docs
  final String prefix;
  // ignore: public_member_api_docs
  final String extension;

  // ignore: public_member_api_docs
  ReportUnit(
    this.reportType,
    this.report,
    this.prefix,
    this.extension,
  );
}

/// All available report types in tool.
enum ReportType {
  // ignore: public_member_api_docs
  checkstyleXml,
  // ignore: public_member_api_docs
  testStyleXml,
}
