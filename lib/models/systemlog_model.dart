
import 'package:flutter/material.dart';

@immutable
class SystemLog {
  final String logTime;
  final String logType;
  final String logData;

  SystemLog({
    required this.logTime,
    required this.logType,
    required this.logData,
  });
}

class SystemLogList {
  final List<SystemLog> logList;

  SystemLogList({
    required this.logList,
  });
}
