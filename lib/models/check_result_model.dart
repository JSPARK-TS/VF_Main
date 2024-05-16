class CheckResult {
  final int chNum;
  final double value;
  final bool result;

  CheckResult({
    required this.chNum,
    required this.value,
    required this.result,
  });
}

class CheckResultList {
  final List<CheckResult> resultList;
  final double dvf;
  final String short;

  CheckResultList({
    required this.resultList,
    required this.dvf,
    required this.short,
  });
}
