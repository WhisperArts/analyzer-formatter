import 'issue.dart';

class FileWithIssues {
  final String path;
  final List<Issue> issues;

  FileWithIssues(
    this.path,
    this.issues,
  );
}
