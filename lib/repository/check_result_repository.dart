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
        'value': 999.9,
        'result': false,
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
        'value': 120.2,
        'result': false,
      },
    ];
  }

  @override
  Future<List<Map<String, dynamic>>> masterResult() async {
    var res = await resResult();

    int halfLength = res.length ~/ 2;

    var masterList = res.sublist(0, halfLength);

    var values = masterList.map((e) => e['value']);

    double masterMax =
        values.reduce((value, next) => value > next ? value : next);
    double masterMin =
        values.reduce((value, next) => value < next ? value : next);

    String shortValue;
    if (masterList.every((e) => !e['result'] == true)) {
      shortValue = 'OK';
    } else {
      shortValue = 'NG';
    }

    Map<String, String> masterDvf = {
      "DVF": (masterMax - masterMin).toStringAsFixed(2)
    };

    Map<String, String> short = {"short": shortValue};

    masterList.addAll([masterDvf, short]);

    return masterList;
  }

  @override
  Future<List<Map<String, dynamic>>> slaveResult() async {
    var res = await resResult();

    int halfLength = res.length ~/ 2;

    var slaveList = res.sublist(halfLength, res.length);

    var values = slaveList.map((e) => e['value']);

    double slaveMax =
        values.reduce((value, next) => value > next ? value : next);
    double slaveMin =
        values.reduce((value, next) => value < next ? value : next);

    String shortValue;
    if (slaveList.every((e) => e['result'] == true)) {
      shortValue = 'OK';
    } else {
      shortValue = 'NG';
    }

    Map<String, String> short = {"short": shortValue};

    Map<String, String> slaveDvf = {
      "DVF": (slaveMax - slaveMin).toStringAsFixed(2)
    };

    slaveList.addAll([slaveDvf, short]);

    return slaveList;
  }

  Future<bool> okNgResult() async {
    var res = await resResult();

    bool value = res.every((e) => e['result'] == true);

    return value;
  }
}
