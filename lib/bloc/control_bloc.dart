import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part "control_event.dart";
part "control_state.dart";

class ControlBloc extends Bloc<ControlEvent, ControlState> {
  ControlBloc() : super(ControlStop()) {
    on<OkEvent>(onOk);
    on<NgEvent>(onNG);
    on<StopEvent>(onStopClick);
    on<RunEvent>(onRunClick);
  }

  void onOk(event, emit) {
    emit(ControlOk());
  }

  void onNG(event, emit) {
    emit(ControlNg());
  }

  void onStopClick(event, emit) {
    // log Bloc 으로 Stop 던지기
    emit(ControlStop());
  }

  void onRunClick(evnet, emit) {
    // Log Bloc 으로 ready 던지기
    //0.01s 마다 외부스위치 신호 받아와서
    //신호가 감지 되면
    //RequstBloc.add(RequestEvent()) 실행
    emit(ControlReady());
  }
}
