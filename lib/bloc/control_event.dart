part of "control_bloc.dart";

abstract class ControlEvent {}

class StopEvent extends ControlEvent {}

class RunEvent extends ControlEvent {}

class StartEvent extends ControlEvent {}

class OkEvent extends ControlEvent {}

class NgEvent extends ControlEvent {}

class ResetEvent extends ControlEvent {}
