import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:main_ui/bloc/control_bloc.dart';
import 'package:main_ui/repository/check_result_repository.dart';

class RequestEvent {}

class RequestState {}

class RequestResponse extends RequestState {
  final List<Map<String, dynamic>> masterResult;
  final List<Map<String, dynamic>> slaveResult;

  RequestResponse({
    required this.masterResult,
    required this.slaveResult,
  });
}

class RequestBloc extends Bloc<RequestEvent, RequestState> {
  final ResultRepository repository;

  final ControlBloc controlBloc;

  RequestBloc({
    required this.repository,
    required this.controlBloc,
  }) : super(RequestState()) {
    on<RequestEvent>(onRequest);
  }

  void onRequest(RequestEvent event, emit) async {
    var masterResult = await repository.masterResult();
    var slaveResult = await repository.slaveResult();
    emit(RequestResponse(masterResult: masterResult, slaveResult: slaveResult));
    
  }
}
