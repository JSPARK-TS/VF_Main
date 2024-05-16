part of "result_bloc.dart";

abstract class CheckResultState {
  final List<Map<String, dynamic>> masterResult;
  final List<Map<String, dynamic>> slaveResult;

  CheckResultState({
    required this.masterResult,
    required this.slaveResult,
  });
}

class Init extends CheckResultState {
  Init()
      : super(
          masterResult: ([
            {"chNum": 1, "value": 0.0, "result": true},
            {"chNum": 2, "value": 0.0, "result": true},
            {"chNum": 3, "value": 0.0, "result": true},
            {"chNum": 4, "value": 0.0, "result": true},
            {"chNum": 5, "value": 0.0, "result": true},
            {"chNum": 6, "value": 0.0, "result": true},
            {"chNum": 7, "value": 0.0, "result": true},
            {"chNum": 8, "value": 0.0, "result": true},
            {"chNum": 9, "value": 0.0, "result": true},
            {"chNum": 10, "value": 0.0, "result": true},
            {"chNum": 11, "value": 0.0, "result": true},
            {"chNum": 12, "value": 0.0, "result": true},
            {"DVF": 0.0},
            {"short": ''}
          ]),
          slaveResult: ([
            {"chNum": 13, "value": 0.0, "result": true},
            {"chNum": 14, "value": 0.0, "result": true},
            {"chNum": 15, "value": 0.0, "result": true},
            {"chNum": 16, "value": 0.0, "result": true},
            {"chNum": 17, "value": 0.0, "result": true},
            {"chNum": 18, "value": 0.0, "result": true},
            {"chNum": 19, "value": 0.0, "result": true},
            {"chNum": 20, "value": 0.0, "result": true},
            {"chNum": 21, "value": 0.0, "result": true},
            {"chNum": 22, "value": 0.0, "result": true},
            {"chNum": 23, "value": 0.0, "result": true},
            {"chNum": 24, "value": 0.0, "result": true},
            {"DVF": 0.0},
            {"short": ''}
          ]),
        );
}

class Loaded extends CheckResultState {
  Loaded({required super.masterResult, required super.slaveResult});
}
