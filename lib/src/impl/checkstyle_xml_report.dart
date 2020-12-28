import 'package:analyzer_formatter/src/api/file_with_issues.dart';
import 'package:analyzer_formatter/src/api/report.dart';
import 'package:xml/xml.dart';

import '../analyzer_reports_creator.dart';

final XmlReportInstance = ReportUnit(
  ReportType.xml,
  _CheckstyleXmlReport(),
  'xml',
);

class _CheckstyleXmlReport extends Report {
  @override
  String format(Iterable<FileWithIssues> problemFiles) {
    final builder = XmlBuilder();
    builder.processing('xml', 'version="1.0"');
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
                (issue) {
                  builder.element(
                    '${issue.status == 'info' ? 'warning' : issue.status}',
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
                        issue.status,
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
                },
              );
            },
          );
        });
      },
    );
    return builder.buildDocument().toXmlString(pretty: true);
  }
}
