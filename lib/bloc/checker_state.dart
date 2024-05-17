part of 'checker_bloc.dart';

abstract class CheckerState {}

class CheckerInit extends CheckerState {}

class CheckerTotalCount extends CheckerState {}

class CheckerNgCount extends CheckerState {}

class CheckerTotlaTime extends CheckerState {}

class CheckerCycleTime extends CheckerState {}

class CheckerPause extends CheckerState {}

class CheckerTimeReset extends CheckerState{}

class CheckerCountReset extends CheckerState{}