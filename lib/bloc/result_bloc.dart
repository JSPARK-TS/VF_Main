import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:main_ui/bloc/control_bloc.dart';

part "result_event.dart";
part "result_state.dart";

class ResultBloc extends Bloc<CheckResultEvent, CheckResultState> {
  final ControlBloc controlBloc;

  ResultBloc({required this.controlBloc}) : super(Init()) {
    on<ResultResponse>(_onResponse);
    on<ResultReset>(_onReset);
  }

  void _onResponse(ResultResponse event, emit) {
    emit(Loaded(
        masterResult: event.masterResult, slaveResult: event.slaveResult));
  }

  void _onReset(ResultReset event, emit) {
    emit(Init());
  }
}
