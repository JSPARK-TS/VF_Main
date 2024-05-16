part of "model_bloc.dart";

abstract class ModelState {}

class ModelNameLoaded extends ModelState {
  final List<String> models;

  ModelNameLoaded({required this.models});
}

class ModelLoading extends ModelState {}

class ModelNameListLoaded extends ModelState {
  final List<String> modelNames;

  ModelNameListLoaded({required this.modelNames});
}

class ModelListAndInfoState extends ModelState {
  final List<String> modelNames;
  List<Map<String, dynamic>> selectedModelInfo;

  ModelListAndInfoState({
    required this.modelNames,
    List<Map<String, dynamic>>? selectedModelInfo,
  }) : selectedModelInfo = selectedModelInfo ??
            [
              {
                'mMin': "0",
                'mTYP': "0",
                'mMax': "0",
                'mDVF': "0",
                'sMin': "0",
                'sTYP': "0",
                'sMax': "0",
                'sDVF': "0",
              }
            ];
}

class ModelError extends ModelState {
  final String error;

  ModelError(this.error);
}
