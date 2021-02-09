/// Representation of issue from Dart Analyzer.
class Issue {
  /// Stores a level of an issue, can be `error` or `warning`.
  final String level;
  /// Stores a message of an issue, takes from Dart Analyzer report output.
  final String message;
  /// Stores a path to a file with issue.
  final String path;
  /// Stores a line in a file that contains an issue.
  final int line;
  /// Stores a column in a file that contains an issue.
  final int column;
  /// Stores an issue name, if you are using standard rules set - you can find more about issue by name in docs.
  final String name;

  // ignore: public_member_api_docs
  Issue(
    this.level,
    this.message,
    this.path,
    this.line,
    this.column,
    this.name,
  );
}
