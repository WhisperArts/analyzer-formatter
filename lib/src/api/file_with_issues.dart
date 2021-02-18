import 'issue.dart';

/// Representation of file with issues.
class FileWithIssues {
  /// Path to a file with issues.
  final String path;

  /// Issues in a file.
  final List<Issue> issues;

  // ignore: public_member_api_docs
  FileWithIssues(
    this.path,
    this.issues,
  );
}
