interface class ResultRepository {
  Future<List<Map<String, dynamic>>> resResult() {
    throw Error();
  }

  Future<List<Map<String, dynamic>>> masterResult() {
    throw Error();
  }

  Future<List<Map<String, dynamic>>> slaveResult() {
    throw Error();
  }
}

class ResultRepositoryDummyImpl implements ResultRepository {
  @override
  Future<List<Map<String, dynamic>>> resResult() async {
    await Future.delayed(const Duration(seconds: 1));
    return [
      {
        'chNum': 1,
        'value': 100.2,
        'result': true,
      },
      {
        'chNum': 2,
        'value': 100.2,
        'result': true,
      },
      {
        'chNum': 3,
        'value': 100.2,
        'result': true,
      },
      {
        'chNum': 4,
        'value': 100.2,
        'result': true,
      },
      {
        'chNum': 5,
        'value': 100.2,
        'result': true,
      },
      {
        'chNum': 6,
        'value': 100.2,
        'result': true,
      },
      {
        'chNum': 7,
        'value': 100.2,
        'result': true,
      },
      {
        'chNum': 8,
        'value': 100.2,
        'result': true,
      },
      {
        'chNum': 9,
        'value': 100.2,
        'result': true,
      },
      {
        'chNum': 10,
        'value': 100.2,
        'result': true,
      },
      {
        'chNum': 11,
        'value': 100.2,
        'result': true,
      },
      {
        'chNum': 12,
        'value': 100.2,
        'result': true,
      },
      {
        'chNum': 13,
        'value': 100.2,
        'result': true,
      },
      {
        'chNum': 14,
        'value': 100.2,
        'result': true,
      },
      {
        'chNum': 15,
        'value': 100.2,
        'result': true,
      },
      {
        'chNum': 16,
        'value': 100.2,
        'result': true,
      },
      {
        'chNum': 17,
        'value': 100.2,
        'result': true,
      },
      {
        'chNum': 18,
        'value': 100.2,
        'result': true,
      },
      {
        'chNum': 19,
        'value': 100.2,
        'result': true,
      },
      {
        'chNum': 20,
        'value': 100.2,
        'result': true,
      },
      {
        'chNum': 21,
        'value': 100.2,
        'result': true,
      },
      {
        'chNum': 22,
        'value': 100.2,
        'result': true,
      },
      {
        'chNum': 23,
        'value': 100.2,
        'result': true,
      },
      {
        'chNum': 24,
        'value': 100.2,
        'result': false,
      },
    ];
  }

  @override
  Future<List<Map<String, dynamic>>> masterResult() async {
    var res = await resResult();

    int halfLength = res.length ~/ 2;

    var masterList = res.sublist(0, halfLength);

    dynamic masterMax = masterList
        .map((e) => e['value'])
        .toList()
        .reduce((value, next) => value > next ? value : next);
    dynamic masterMin = masterList
        .map((e) => e['value'])
        .toList()
        .reduce((value, next) => value < next ? value : next);

    bool shortValue = masterList.any((e) => e.containsValue(false));

    Map<String, bool> short = {"short": !shortValue};

    Map<String, int> masterDvf = {"DVF": masterMax - masterMin};

    masterList.addAll([masterDvf, short]);

    return masterList;
  }

  @override
  Future<List<Map<String, dynamic>>> slaveResult() async {
    var res = await resResult();

    int halfLength = res.length ~/ 2;

    var slaveList = res.sublist(0, halfLength);

    dynamic masterMax = slaveList
        .map((e) => e['value'])
        .toList()
        .reduce((value, next) => value > next ? value : next);
    dynamic masterMin = slaveList
        .map((e) => e['value'])
        .toList()
        .reduce((value, next) => value < next ? value : next);

    bool shortValue = slaveList.any((e) => e.containsValue(false));

    Map<String, bool> short = {"short": !shortValue};

    Map<String, int> masterDvf = {"DVF": masterMax - masterMin};

    slaveList.addAll([masterDvf, short]);

    return slaveList;
  }
}
