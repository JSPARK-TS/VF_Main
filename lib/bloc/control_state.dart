part of "control_bloc.dart";

abstract class ControlState {
  final dynamic color;
  final String text;

  ControlState({
    required this.color,
    required this.text,
  });
}

class ControlReady extends ControlState {
  ControlReady()
      : super(
          color: (const Color.fromARGB(255, 76, 175, 80)),
          text: "Ready",
        );
}

class ControlStop extends ControlState {
  ControlStop()
      : super(
          color: (const Color.fromARGB(255, 189, 189, 189)),
          text: "Stop",
        );
}

class ControlOk extends ControlState {
  ControlOk()
      : super(
          color: (const Color.fromARGB(255, 33, 150, 243)),
          text: "OK",
        );
}

class ControlNg extends ControlState {
  ControlNg()
      : super(
          color: (const Color.fromARGB(255, 229, 57, 53)),
          text: "NG",
        );
}

class ControlRun extends ControlState {
  ControlRun()
      : super(
          color: (const Color.fromARGB(255, 189, 189, 189)),
          text: "Run",
        );
}

class ControlReset extends ControlState {
  ControlReset()
      : super(
          color: (const Color.fromARGB(255, 189, 189, 189)),
          text: "Reset",
        );
}
