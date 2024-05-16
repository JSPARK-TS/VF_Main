part of "result_bloc.dart";

abstract class CheckResultEvent {}

class ResultResponse extends CheckResultEvent {
  final List<Map<String, dynamic>> masterResult;
  final List<Map<String, dynamic>> slaveResult;

  ResultResponse({required this.masterResult, required this.slaveResult});
}

class ResultReset extends CheckResultEvent {}
