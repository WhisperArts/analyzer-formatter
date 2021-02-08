import 'package:xml/xml.dart';

import '../../analyzer_formatter.dart';
import '../api/file_with_issues.dart';
import '../api/report.dart';
import '../api/report_unit.dart';

/// Instance of Checkstyle compatible report unit.
// ignore: non_constant_identifier_names
final CheckstyleXmlReportInstance = ReportUnit(
  ReportType.checkstyleXml,
  _CheckstyleXmlReport(),
  'checkstyle',
  'xml',
);

class _CheckstyleXmlReport extends Report {
  void _addErrorToBuilder(XmlBuilder builder, Issue issue) {
    builder.element(
      'error',
      nest: () {
        builder.attribute(
          'line',
          issue.line,
        );
        builder.attribute(
          'column',
          issue.column,
        );
        builder.attribute(
          'severity',
          issue.level,
        );
        builder.attribute(
          'message',
          issue.message,
        );
        builder.attribute(
          'source',
          issue.path,
        );
      },
    );
  }

  @override
  String format(Iterable<FileWithIssues> problemFiles) {
    final builder = XmlBuilder();
    builder.processing(
      'xml',
      'version="1.0"',
    );
    builder.element(
      'checkstyle',
      attributes: {
        'version': '8.38',
      },
      nest: () {
        problemFiles.forEach((fileWithIssues) {
          builder.element(
            'file',
            attributes: {
              'name': fileWithIssues.path,
            },
            nest: () {
              fileWithIssues.issues.forEach(
                (issue) => _addErrorToBuilder(builder, issue),
              );
            },
          );
        });
      },
    );
    return builder.buildDocument().toXmlString(pretty: true);
  }
}
