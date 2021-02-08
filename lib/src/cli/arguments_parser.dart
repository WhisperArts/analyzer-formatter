import 'argument_parse_exception.dart';
import 'arguments.dart';

/// Parse arguments and return a map with argments and its values.
Map<String, String> parseArguments(List<String> arguments) {
  final parsedArgs = <String, String>{};
  arguments.forEach((argument) {
    if (argument.contains(parameterSeparator)) {
      final data = argument.split('=');
      if (data.isNotEmpty && data.length == 2) {
        final argument = data.first;
        switch (argument) {
          case argumentAnalyzerReportFile:
          case argumentReportSuffix:
            parsedArgs[argument] = data.last;
            break;
          default:
            _throwArgumentParseException(data.first);
            break;
        }
      }
    } else if (argument == argumentHelp) {
      parsedArgs[argumentHelp] = null;
    } else if (argument == testStyle) {
      parsedArgs[testStyle] = 'true';
    } else {
      _throwArgumentParseException(argument);
    }
  });
  return parsedArgs;
}

void _throwArgumentParseException(String invalidArgument) {
  throw ArgumentParseException(
      'Cannot apply $invalidArgument argument. See analyzer_formatter --help for more information');
}
