import 'dart:io';

import 'package:analyzer_formatter/src/api/file_with_issues.dart';
import 'package:path/path.dart';

import 'api/issue.dart';

class AnalyzerResultParser {
  final File _analyzerReport;

  AnalyzerResultParser(this._analyzerReport);

  Iterable<FileWithIssues> problemFiles() {
    final files = <String, FileWithIssues>{};
    _analyzerReport
        .readAsLinesSync()
        .where((element) =>
            element.trim().startsWith('error') ||
            element.trim().startsWith('info'))
        .forEach((line) {
      final issue = _parseIssue(line);
      if (files.containsKey(issue.path)) {
        files[issue.path].issues.add(issue);
      } else {
        files[issue.path] = FileWithIssues(issue.path, [issue]);
      }
    });
    return files.values;
  }

  Issue _parseIssue(String inputLine) {
    final result = inputLine.split('-');
    final String status = result.first;
    final String description = result[1];

    final location = result[2].split(':');
    final String path = location.first;
    final int line = int.parse(location[1]);
    final int offset = int.parse(location.last);

    final String name = result.last;
    return Issue(
      status.trim(),
      description.trim(),
      absolute(path.trim()),
      line,
      offset,
      name.trim(),
    );
  }
}
