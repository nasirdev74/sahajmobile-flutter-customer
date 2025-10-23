import 'package:intl/intl.dart';
import 'package:logger/logger.dart';
import 'package:flutter/foundation.dart';

final logger = Logger(printer: kDebugMode ? DebugLogger() : ProdLogger());

class DebugLogger extends LogPrinter {
  final Level minLevel;

  DebugLogger({this.minLevel = Level.debug});

  @override
  List<String> log(LogEvent event) {
    if (event.level.index < minLevel.index) return [];

    final timestamp = DateFormat('MM-dd-yyyy HH:mm:ss').format(DateTime.now());
    final level = event.level.name.toUpperCase();
    final color = _getColor(event.level);
    final formattedMessage = '$color[$timestamp][$level]: ${event.message}\x1B[0m';
    return [formattedMessage];
  }

  String _getColor(Level level) {
    switch (level) {
      case Level.debug:
        return '\x1B[36m'; // Cyan
      case Level.info:
        return '\x1B[32m'; // Green
      case Level.warning:
        return '\x1B[33m'; // Yellow
      case Level.error:
        return '\x1B[31m'; // Red
      case Level.wtf:
      case Level.fatal:
        return '\x1B[35m'; // Magenta
      default:
        return '\x1B[0m'; // Reset
    }
  }
}

class ProdLogger extends LogPrinter {
  final Level minLevel;

  ProdLogger({this.minLevel = Level.error});

  @override
  List<String> log(LogEvent event) {
    if (event.level.index < minLevel.index) return [];

    final timestamp = DateFormat('MM-dd-yyyy HH:mm:ss').format(DateTime.now());
    final level = event.level.name.toUpperCase();
    final formattedMessage = '[$timestamp][$level]: ${event.message}';
    return [formattedMessage];
  }
}
