import 'dart:io';

import 'package:path/path.dart';

import 'api/analyzer_report_invalid_format_exception.dart';
import 'api/file_with_issues.dart';
import 'api/issue.dart';

const _reportErrorComponentsCount = 4;
const _reportErrorPathComponentsCount = 3;

const _statusValueIndex = 0;
const _descriptionValueIndex = 1;
const _locationValueIndex = 2;
const _nameValueIndex = 3;

const _pathValueIndex = 0;
const _lineValueIndex = 1;
const _offsetValueIndex = 2;

Iterable<FileWithIssues> parseAnalyzerReport(File analyzerReport) {
  final files = <String, FileWithIssues>{};
  analyzerReport.readAsLinesSync().where((element) {
    final line = element.trim();
    return line.isNotEmpty && _isErrorLine(line);
  }).forEach((line) {
    final issue = _parseIssue(line);
    if (files.containsKey(issue.path)) {
      files[issue.path].issues.add(issue);
    } else {
      files[issue.path] = FileWithIssues(issue.path, [issue]);
    }
  });
  return files.values;
}

bool _isErrorLine(String line) => line.startsWith('error') || line.startsWith('info');

Issue _parseIssue(String inputLine) {
  var result = inputLine.split('-');
  if (result.isEmpty || result.length != _reportErrorComponentsCount) {
    result = inputLine.split('•');
  }
  if (result.isEmpty || result.length != _reportErrorComponentsCount) {
    _throwReportFormatException();
  }
  final status = result[_statusValueIndex].trim();
  final description = result[_descriptionValueIndex].trim();

  final location = result[_locationValueIndex].split(':');
  final path = location[_pathValueIndex];
  var line;
  var offset;
  if (location.length == _reportErrorPathComponentsCount) {
    line = int.parse(location[_lineValueIndex]);
    offset = int.parse(location[_offsetValueIndex]);
  }

  final name = result[_nameValueIndex].trim();
  return Issue(
    status,
    description,
    absolute(path),
    line,
    offset,
    name,
  );
}

void _throwReportFormatException() {
  throw AnalyzerReportInvalidFormatException(
    'Invalid report result. Make sure you generated report with \'dart analyze\' or \'flutter analyze\'',
  );
}
