part of "model_bloc.dart";

abstract class ModelEvent {}

class LoadModelNames extends ModelEvent {}

class LoadModelInfo extends ModelEvent {
  final String modelName;

  LoadModelInfo(this.modelName);
}

class ModelChangeEvent extends ModelEvent {
  final String? modelName;

  ModelChangeEvent({required this.modelName});
}
