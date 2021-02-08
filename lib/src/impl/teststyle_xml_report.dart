import 'package:xml/xml.dart';

import '../../analyzer_formatter.dart';
import '../api/file_with_issues.dart';
import '../api/report.dart';
import '../api/report_unit.dart';

/// Instance of JUnit compatible report unit.
// ignore: non_constant_identifier_names
final TestStyleXmlReportInstance = ReportUnit(
  ReportType.testStyleXml, _TeststyleXmlReport(),
  'testsuite',
  'xml'
);

class _TeststyleXmlReport extends Report {
  void _addErrorToBuilder(XmlBuilder builder, Issue issue) {
    builder.element(
      'failure',
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
      'testsuite',
      attributes: {
        'tests': '${problemFiles.length}',
      },
      nest: () {
        problemFiles.forEach((fileWithIssues) {
          builder.element(
            'testcase',
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
