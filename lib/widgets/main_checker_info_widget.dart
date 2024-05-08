import 'package:flutter/material.dart';

class MainCheckerInfo extends StatefulWidget {
  const MainCheckerInfo({super.key});

  @override
  State<MainCheckerInfo> createState() => _MainCheckerInfoState();
}

class _MainCheckerInfoState extends State<MainCheckerInfo> {
  // 전체 시간 및 검사 시간 상태 관리를 위한 변수
  String totalTime = "20:00:00";
  String checkTime = "00:00:02";

  // NG 카운트 상태 관리를 위한 변수
  int totalCount = 1532;
  int ngCount = 5;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _cycleTime(totalTime: totalTime, checkTime: checkTime),
        resetButton(() {
          setState(() {
            totalTime = "00:00:00";
            checkTime = "00:00:00";
          });
        }),
        _totalNgCount(total: totalCount, ng: ngCount),
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            resetButton(() {
              setState(() {
                totalCount = 0;
                ngCount = 0;
              });
            }),
            const SizedBox(
              height: 10,
            ),
            Text(
                style:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                "${ngCount == 0 ? "0" : (ngCount / totalCount * 100).toStringAsFixed(2)}%"),
          ],
        ),
      ],
    );
  }

  OutlinedButton resetButton(VoidCallback onPressed) {
    return OutlinedButton(
      onPressed: onPressed,
      child: const Padding(
        padding: EdgeInsets.symmetric(vertical: 10),
        child: Text(
          '리셋',
          style: TextStyle(fontSize: 20),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }

  
//class로 수정

  Widget _cycleTime({required totalTime, required checkTime}) {
    return Column(
      children: [
        Row(
          children: [
            Container(
              width: 140,
              decoration: BoxDecoration(
                color: Colors.grey.shade300,
                border: Border.all(
                  color: Colors.black,
                  width: 2,
                ),
              ),
              child: const Padding(
                padding: EdgeInsets.all(10.0),
                child: Text(
                  "전체 시간",
                  style: TextStyle(fontSize: 20),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            Container(
              width: 100,
              decoration: BoxDecoration(
                color: Colors.grey.shade200,
                border: Border.all(
                  color: Colors.black,
                  width: 2,
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text(
                  totalTime,
                  style: const TextStyle(fontSize: 20),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ],
        ),
        Row(
          children: [
            Container(
              width: 140,
              decoration: BoxDecoration(
                color: Colors.grey.shade300,
                border: Border.all(
                  color: Colors.black,
                  width: 2,
                ),
              ),
              child: const Padding(
                padding: EdgeInsets.all(10.0),
                child: Text(
                  "검사 시간",
                  style: TextStyle(fontSize: 20),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            Container(
              width: 100,
              decoration: BoxDecoration(
                color: Colors.grey.shade200,
                border: Border.all(
                  color: Colors.black,
                  width: 2,
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text(
                  checkTime,
                  style: const TextStyle(fontSize: 20),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _totalNgCount({required total, required ng}) {
    return Column(
      children: [
        Row(
          children: [
            Container(
              width: 140,
              decoration: BoxDecoration(
                color: Colors.grey.shade300,
                border: Border.all(
                  color: Colors.black,
                  width: 2,
                ),
              ),
              child: const Padding(
                padding: EdgeInsets.all(10.0),
                child: Text(
                  "TotalCount",
                  style: TextStyle(fontSize: 20),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            Container(
              width: 100,
              decoration: BoxDecoration(
                color: Colors.grey.shade200,
                border: Border.all(
                  color: Colors.black,
                  width: 2,
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text(
                  total.toString(),
                  style: const TextStyle(fontSize: 20),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ],
        ),
        Row(
          children: [
            Container(
              width: 140,
              decoration: BoxDecoration(
                color: Colors.grey.shade300,
                border: Border.all(
                  color: Colors.black,
                  width: 2,
                ),
              ),
              child: const Padding(
                padding: EdgeInsets.all(10.0),
                child: Text(
                  "NG",
                  style: TextStyle(fontSize: 20),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            Container(
              width: 100,
              decoration: BoxDecoration(
                color: Colors.grey.shade200,
                border: Border.all(
                  color: Colors.black,
                  width: 2,
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text(
                  ng.toString(),
                  style: const TextStyle(fontSize: 20),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
