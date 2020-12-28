import 'package:analyzer_formatter/src/api/file_with_issues.dart';

abstract class Report {
  String format(Iterable<FileWithIssues> problemFiles);
}
