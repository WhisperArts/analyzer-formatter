# analyzer_formatter

[![GitHubActions](https://github.com/WhisperArts/analyzer-formatter/workflows/Build/badge.svg)](https://github.com/WhisperArts/analyzer-formatter/actions?query=workflow%3ABuild)
[![pub.dev](https://img.shields.io/pub/v/analyzer_formatter.svg)](https://pub.dartlang.org/packages/analyzer_formatter)

## About

Tool for converting Dart Analyzer output to Checkstlye and JUnit report formats.

## Installation

Install tool from [pub.dev](https://pub.dev):

```shell
flutter pub global activate analyzer_formatter
```

## How to use

1. Check your project with Dart Analyzer and write its output to a file:

```shell
flutter analyze > analyzer_report.txt
```

`analyzer_report.txt` is the name of Dart Analyzer report by default. You can change it and pass your own by `--analyzerReportFile` argument.

2. Run tool for project folder:

```shell
flutter pub global run analyzer_formatter
```

## Arguments

| Name | Description |
| --- | --- |
| `--analyzerReportFile` | Relative path to Analyzer report file |
| `--outputSuffix` | Suffix of a converted report file |
| `--help` | Print tool description |
| `--testStyle` | Convert a result to JUnit report |

## How to contribute

Make sure your build is green before you contribute your pull request. Then:

```shell
$ dart analyze
```

If you don't see any error messages, submit your pull request.

## Contributors

- [@fartem](https://github.com/fartem) as Artem Fomchenkov
- [@dynaevdv](https://github.com/dynaevdv) as Denis Dunaev
- [@qwertyway](https://github.com/qwertyway) as Artem Demyanov
- [@GeorgeOblomov](https://github.com/GeorgeOblomov) as Egor Grischenkov
