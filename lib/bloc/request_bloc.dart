import 'package:flutter_bloc/flutter_bloc.dart';
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

class RequestLoading extends RequestState {}

class RequestError extends RequestState {
  String erorr;
  RequestError(this.erorr);
}

class RequestBloc extends Bloc<RequestEvent, RequestState> {
  final ResultRepository repository;

  RequestBloc({
    required this.repository,
  }) : super(RequestState()) {
    on<RequestEvent>(onRequest);
  }

  void onRequest(RequestEvent event, emit) async {
    emit(RequestLoading());
    try {
      var masterResult = await repository.masterResult();
      var slaveResult = await repository.slaveResult();
      emit(RequestResponse(
          masterResult: masterResult, slaveResult: slaveResult));
    } catch (e) {
      emit(RequestError(e.toString()));
    }
  }
}
