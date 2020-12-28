class Issue {
  final String status;
  final String message;
  final String path;
  final int line;
  final int column;
  final String name;

  Issue(
    this.status,
    this.message,
    this.path,
    this.line,
    this.column,
    this.name,
  );
}
