part of "main_bloc.dart";

abstract class CheckResultState {}

class Init extends CheckResultState {}

class Ok extends CheckResultState {
  final List<CheckResult> resultList;
  final double dvf;
  final bool short;
  Ok({
    required this.resultList,
    required this.dvf,
    required this.short,
  });
}

class Ng extends CheckResultState {
  final List<CheckResult> resultList;
  final double dvf;
  final bool short;
  Ng({
    required this.resultList,
    required this.dvf,
    required this.short,
  });
}
