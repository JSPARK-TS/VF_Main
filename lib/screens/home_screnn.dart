import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:main_ui/widgets/main_checker_info_widget.dart';
import 'package:main_ui/widgets/main_config_con_widget.dart';
import 'package:main_ui/widgets/main_control_widget.dart';
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
        children: [
          OKNG(),
          ResultWidget(),
          Padding(
            padding: EdgeInsets.all(30.0),
            child: Row(
              children: [
                SizedBox(
                  height: 30,
                ),
                Column(
                  children: [
                    Flexible(
                      flex: 1,
                      child: Row(
                        children: [
                          MainModelInfo(),
                          Column(
                            children: [
                              // MainControl(),
                              // MainConfigCon(),
                            ],
                          )
                        ],
                      ),
                    ),
                    Flexible(
                      flex: 1,
                      child: Row(
                        children: [
                          Column(
                            children: [
                              // MainCheckerInfo(),
                              // MainSystemLog(),
                            ],
                          )
                        ],
                      ),
                    )
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
