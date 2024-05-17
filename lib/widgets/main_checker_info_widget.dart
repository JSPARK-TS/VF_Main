import 'dart:async';

import 'package:flutter/material.dart';
import 'package:main_ui/bloc/checker_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MainCheckerInfo extends StatefulWidget {
  const MainCheckerInfo({super.key});

  @override
  State<MainCheckerInfo> createState() => _MainCheckerInfoState();
}

class _MainCheckerInfoState extends State<MainCheckerInfo> {
  String format(int seconds) {
    var duration = Duration(seconds: seconds);
    return duration.toString().substring(0, 7);
  }

  Timer? _totalTimer;
  Timer? _cycleTimer;

  bool _isTimerActive = false;
  bool _isCycleTimerActive = false;

  void incrementTotalCounter() {
    if (!_isTimerActive) {
      _totalTimer = Timer.periodic(
        const Duration(seconds: 1),
        (timer) {
          totalTime++;
        },
      );
      _isTimerActive = true;
    }
  }

  void incrementCycleCounter() {
    if (!_isCycleTimerActive) {
      _cycleTimer = Timer.periodic(
        const Duration(seconds: 1),
        (timer) {
          cycleTime++;
        },
      );
      _isTimerActive = true;
    }
  }

  void pauseTotalTimer() {
    if (_isTimerActive) {
      _totalTimer?.cancel();
      _isTimerActive = false;
    }
  }

  void pauseCycleTimer() {
    if (_isCycleTimerActive) {
      _cycleTimer?.cancel();
      _isCycleTimerActive = false;
    }
  }

  late int totalTime = 0;

  late int cycleTime = 0;

  late int totalCount = 0;

  late int ngCount = 0;

  @override
  Widget build(BuildContext context) {
    // NG 카운트 상태 관리를 위한 변수
    return BlocBuilder<CheckerBloc, CheckerState>(
      builder: (context, state) {
        if (state is CheckerTotalCount) {
          cycleTime = 0;
          totalCount++;
          incrementTotalCounter();
          incrementCycleCounter();
        }
        if (state is CheckerNgCount) {
          ngCount++;
        }
        if (state is CheckerCountReset) {
          totalCount = 0;
          ngCount = 0;
        }
        if (state is CheckerTimeReset) {
          totalTime = 0;
          cycleTime = 0;
        }
        if (state is CheckerCycleTime) {
          pauseCycleTimer();
        }
        if (state is CheckerPause) {
          pauseTotalTimer();
          pauseCycleTimer();
        }
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _cycleTime(
                totalTime: totalTime, checkTime: cycleTime, state: state),
            resetButton(() {
              BlocProvider.of<CheckerBloc>(context).add(TimeReset());
            }),
            _totalNgCount(total: totalCount, ng: ngCount, state: state),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                resetButton(() {
                  BlocProvider.of<CheckerBloc>(context).add(CountReset());
                }),
                const SizedBox(
                  height: 10,
                ),
                Text(
                    style: const TextStyle(
                        fontSize: 20, fontWeight: FontWeight.bold),
                    "${ngCount == 0 ? "0" : (ngCount / totalCount * 100).toStringAsFixed(2)}%"),
              ],
            ),
          ],
        );
      },
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
  Widget _cycleTime({required totalTime, required checkTime, required state}) {
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
                  format(totalTime),
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
                  format(checkTime),
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

  Widget _totalNgCount({required total, required ng, required state}) {
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
