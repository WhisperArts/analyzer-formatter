import 'file_with_issues.dart';

/// Parent class for all reports. Use it to create custom reports.
// ignore: one_member_abstracts
abstract class Report {
  /// Handling problem files and returning prepared report in selected format in a `String`.
  String format(Iterable<FileWithIssues> problemFiles);
}
