class CheckResult {
  final int chNum;
  final double result;
  final bool okNG;

  CheckResult({
    required this.chNum,
    required this.result,
    required this.okNG,
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
