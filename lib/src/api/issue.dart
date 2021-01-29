class Issue {
  final String level;
  final String message;
  final String path;
  final int line;
  final int column;
  final String name;

  Issue(
    this.level,
    this.message,
    this.path,
    this.line,
    this.column,
    this.name,
  );
}
