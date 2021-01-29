import 'file_with_issues.dart';

// ignore: one_member_abstracts
abstract class Report {
  String format(Iterable<FileWithIssues> problemFiles);
}
