import 'package:flutter/material.dart';
import 'package:main_ui/widgets/main_checker_info_widget.dart';
import 'package:main_ui/widgets/main_model_info_widget.dart';
import 'package:main_ui/widgets/main_okng_widget.dart';
import 'package:main_ui/widgets/main_result_widget.dart';
import 'package:main_ui/widgets/main_systemlog_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Flexible(flex: 1, child: OKNG()),
          ResultWidget(),
          SizedBox(
            height: 30,
          ),
          Padding(
            padding: EdgeInsets.all(30),
            child: Expanded(
              child: Row(
                children: [
                  Flexible(
                    child: Column(
                      children: [
                        MainModelInfo(),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Flexible(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          '검사기 정보',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        MainCheckerInfo(),
                        Text(
                          '시스템 로그',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        MainSystemLog(),
                      ],
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
