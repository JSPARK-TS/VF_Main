class CheckResult {
  final int chNum;
  final double value;
  final bool result;

  CheckResult({
    required this.chNum,
    required this.value,
    required this.result,
  });

  factory CheckResult.fromJson(Map<String, dynamic> json) {
    return CheckResult(
      chNum: json['chNum'],
      value: json['value'],
      result: json['result'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'chNum': chNum,
      'value': value,
      'result': result,
    };
  }
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

  factory CheckResultList.fromJson(Map<String, dynamic> json) {
    var list = json['resultList'] as List;
    List<CheckResult> resultList =
        list.map((i) => CheckResult.fromJson(i)).toList();

    return CheckResultList(
      resultList: resultList,
      dvf: json['dvf'],
      short: json['short'],
    );
  }

  Map<String, dynamic> toJson() {
    List<Map> resultList = this.resultList.map((i) => i.toJson()).toList();

    return {
      'resultList': resultList,
      'dvf': dvf,
      'short': short,
    };
  }
}
