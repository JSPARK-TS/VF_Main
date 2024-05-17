part of 'checker_bloc.dart';

abstract class CheckerEvent {}

class TotalCountIncrease extends CheckerEvent {}

class NgCountIncrease extends CheckerEvent {}

class CountReset extends CheckerEvent {}

class TimeReset extends CheckerEvent {}

class TotalTime extends CheckerEvent {}

class Pause extends CheckerEvent {}

class CycleTime extends CheckerEvent {}
