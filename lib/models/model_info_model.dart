class ModelNames {
  final List<String> modelName;

  ModelNames({
    required this.modelName,
  });
}

class ModelInfo {
  final double masterMin;
  final double slaveMin;
  final double masterTyp;
  final double slaveTyp;
  final double masterMax;
  final double slaveMax;
  final double masterDvf;
  final double slaveDvf;

  ModelInfo({
    required this.masterMin,
    required this.slaveMin,
    required this.masterTyp,
    required this.slaveTyp,
    required this.masterMax,
    required this.slaveMax,
    required this.masterDvf,
    required this.slaveDvf,
  });
}
