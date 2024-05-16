interface class ModelNameRepository {
  Future<List<String>> resModelNames() {
    throw Error();
  }
}

interface class ModelInfoRepository {
  Future<List<Map<String, dynamic>>> resModelInfo(String modelName) {
    throw Error();
  }
}

class ModelNameRepositoryDummyImpl implements ModelNameRepository {
  @override
  Future<List<String>> resModelNames() async {
    await Future.delayed(const Duration(seconds: 1));
    //등록 되어 있는 모델 정보 가져오는 로직 필요
    return ["model1", "model2", "model3"];
  }
}

class ModelInfoRepositoryDummyImpl implements ModelInfoRepository {
  @override
  Future<List<Map<String, dynamic>>> resModelInfo(String modelName) async {
    await Future.delayed(const Duration(seconds: 1));
    // modelName에 따라 해당 model의 값 가져오는 로직 필요
    if (modelName == 'model1') {
      return [
        {
          'mMin': "123.7",
          'mTYP': "130.1",
          'mMax': "136.5",
          'mDVF': "1.7",
          'sMin': "123.7",
          'sTYP': "130.1",
          'sMax': "136.5",
          'sDVF': "1.7",
        }
      ];
    } else if (modelName == 'model2') {
      return [
        {
          'mMin': 130.2,
          'mTYP': 135.6,
          'mMax': 140.1,
          'mDVF': 2.0,
          'sMin': 130.2,
          'sTYP': 135.6,
          'sMax': 140.1,
          'sDVF': 2.0,
        }
      ];
    } else {
      return [
        {
          'mMin': 140.2,
          'mTYP': 145.6,
          'mMax': 150.1,
          'mDVF': 3.0,
          'sMin': 140.2,
          'sTYP': 145.6,
          'sMax': 150.1,
          'sDVF': 3.0,
        }
      ];
    }
  }
}
