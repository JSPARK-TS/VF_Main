import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:main_ui/repository/model_info_repository.dart';

part 'model_event.dart';
part 'model_state.dart';

class ModelBloc extends Bloc<ModelEvent, ModelState> {
  final ModelInfoRepository infoRepository;
  final ModelNameRepository nameRepository;
  List<String> _modelNames = [
    "Don't have model, plz make models"
  ]; // 모델 이름 목록을 저장할 필드

  ModelBloc({
    required this.infoRepository,
    required this.nameRepository,
  }) : super(ModelLoading()) {
    on<LoadModelNames>(_onLoadModelNames);
    on<LoadModelInfo>(_onLoadModelInfo);

    add(LoadModelNames());
  }

  void _onLoadModelNames(LoadModelNames event, Emitter<ModelState> emit) async {
    emit(ModelLoading());
    try {
      _modelNames = await nameRepository.resModelNames();
      emit(ModelListAndInfoState(modelNames: _modelNames));
    } catch (e) {
      emit(ModelError(e.toString()));
    }
  }

  void _onLoadModelInfo(LoadModelInfo event, Emitter<ModelState> emit) async {
    emit(ModelLoading());
    try {
      final selectedModelInfo =
          await infoRepository.resModelInfo(event.modelName);
      // 모델 정보를 로드한 후, 모델 이름 목록과 함께 상태를 업데이트합니다.
      emit(ModelListAndInfoState(
          modelNames: _modelNames, selectedModelInfo: selectedModelInfo));
    } catch (e) {
      emit(ModelError(e.toString()));
    }
  }
}
