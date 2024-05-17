import 'package:flutter_bloc/flutter_bloc.dart';

part 'checker_event.dart';
part 'checker_state.dart';

class CheckerBloc extends Bloc<CheckerEvent, CheckerState> {
  CheckerBloc() : super(CheckerInit()) {
    on<TotalTime>(onTick);
    on<CycleTime>(onCycleTick);
    on<Pause>(onPause);
    on<TotalCountIncrease>(onCount);
    on<NgCountIncrease>(onNg);
    on<TimeReset>(onTimeReset);
    on<CountReset>(onCountReset);
  }

  onTick(event, emit) {
    emit(CheckerTotlaTime());
  }

  onCycleTick(event, emit) {
    emit(CheckerCycleTime());
  }

  onPause(event, emit) {
    emit(CheckerPause());
  }

  onCount(event, emit) {
    emit(CheckerTotalCount());
  }

  onNg(event, emit) {
    emit(CheckerNgCount());
  }

  onTimeReset(event, emit) {
    emit(CheckerTimeReset());
  }

  onCountReset(event, emit) {
    emit(CheckerCountReset());
  }
}
