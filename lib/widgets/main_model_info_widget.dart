import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:main_ui/bloc/control_bloc.dart';
import 'package:main_ui/bloc/model_bloc.dart';
import 'package:main_ui/widgets/main_config_con_widget.dart';
import 'package:main_ui/widgets/main_control_widget.dart';

class MainModelInfo extends StatefulWidget {
  const MainModelInfo({super.key});

  @override
  State<MainModelInfo> createState() => _MainModelInfoState();
}

class _MainModelInfoState extends State<MainModelInfo> {
  String? dropDownValue = "";

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ControlBloc, ControlState>(
      builder: (context, controlState) {
        return BlocBuilder<ModelBloc, ModelState>(
          builder: (context, state) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  '모델 정보',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
                Row(
                  children: [
                    Container(
                      decoration: BoxDecoration(color: Colors.grey.shade500),
                      child: const Padding(
                        padding: EdgeInsets.all(5),
                        child: Text(
                          "Model",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    Expanded(
                      child: _buildModelDropdown(controlState, state),
                    ),
                  ],
                ),
                _buildModelInfo(state),
                const Row(children: [
                  MainControl(),
                  MainConfigCon(),
                ])
              ],
            );
          },
        );
      },
    );
  }

  Widget _buildModelDropdown(controlState, state) {
    // 드롭다운 리스트
    if (state is ModelListAndInfoState) {
      // 변경된 부분
      List<String> dropDownList = [];
      dropDownList = state.modelNames;
      if (dropDownValue == "") {
        dropDownValue = dropDownList.first;
      }
      return DropdownButton(
        isExpanded: true,
        value: dropDownValue,
        items: dropDownList.map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Center(
              child: Text(
                value,
                style: const TextStyle(fontSize: 20),
              ),
            ),
          );
        }).toList(),
        onChanged: (String? value) {
          // value가 null이 아닌 경우에만 실행합니다.
          if (value != null) {
            setState(() {
              dropDownValue = value; // 여기서는 value가 null이 아니라는 것이 보장됩니다.
            });
            context.read<ModelBloc>().add(
                  LoadModelInfo(value),
                );
          }
        },
      );
    }
    return const Text("Loading...");
  }

  Widget _buildModelInfo(state) {
    final scrollController = ScrollController();
    if (state is ModelListAndInfoState) {
      List<Map<String, dynamic>> masterInfo = state.selectedModelInfo;
      List<Map<String, dynamic>> slaveInfo = state.selectedModelInfo;
      return Row(
        children: [
          DataTable(
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.black.withOpacity(0.8),
                width: 2,
              ),
            ),
            headingRowColor: MaterialStateColor.resolveWith(
                (states) => Colors.grey.shade500),
            columns: const [
              DataColumn(
                label: Text(
                  '구분',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
            rows: [
              DataRow(
                color: MaterialStateColor.resolveWith(
                    (states) => Colors.grey.shade300),
                cells: const [
                  DataCell(
                    Text(
                      'Master',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
              DataRow(
                color: MaterialStateColor.resolveWith(
                    (states) => Colors.grey.shade300),
                cells: const [
                  DataCell(
                    Text(
                      'Slave',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            ],
          ),
          Expanded(
            child: Scrollbar(
              controller: scrollController,
              child: LayoutBuilder(
                builder: (context, constraints) => SingleChildScrollView(
                  controller: scrollController,
                  scrollDirection: Axis.horizontal,
                  child: ConstrainedBox(
                    constraints: BoxConstraints(minWidth: constraints.minWidth),
                    child: DataTable(
                      //데이터 들어가는 데이터 테이블
                      decoration: BoxDecoration(
                        border: Border(
                          top: BorderSide(
                            color: Colors.black.withOpacity(0.8),
                            width: 2,
                          ),
                          bottom: BorderSide(
                            color: Colors.black.withOpacity(0.8),
                            width: 2,
                          ),
                          right: BorderSide(
                            color: Colors.black.withOpacity(0.8),
                            width: 2,
                          ),
                        ),
                      ),
                      headingRowColor: MaterialStateColor.resolveWith(
                          (states) => Colors.grey.shade500),
                      columns: const [
                        DataColumn(
                            label: Text(
                          'MIN',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        )),
                        DataColumn(
                            label: Text(
                          'TYP',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        )),
                        DataColumn(
                            label: Text(
                          'MAX',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        )),
                        DataColumn(
                          label: Text(
                            'DVF',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                      rows: const [
                        // DataRow(
                        //   color: MaterialStateColor.resolveWith(
                        //       (states) => Colors.grey.shade100),
                        //   cells: masterInfo.expand<DataCell>((map) {
                        //     // map.values.toList()를 통해 맵의 모든 값을 리스트로 변환합니다.
                        //     // 그리고 이 값을 DataCell로 매핑합니다.
                        //     return map.values.map<DataCell>((value) {
                        //       return DataCell(Text(
                        //           value.toString())); // 모든 값을 문자열로 변환해야 합니다.
                        //     });
                        //   }).toList(), // expand 메서드는 Iterable을 반환하므로, toList()로 리스트로 변환합니다.
                        // ),
                        // DataRow(
                        //   color: MaterialStateColor.resolveWith(
                        //       (states) => Colors.grey.shade100),
                        //   cells: slaveInfo.expand<DataCell>((map) {
                        //     // map.values.toList()를 통해 맵의 모든 값을 리스트로 변환합니다.
                        //     // 그리고 이 값을 DataCell로 매핑합니다.
                        //     return map.values.map<DataCell>((value) {
                        //       return DataCell(Text(
                        //           value.toString())); // 모든 값을 문자열로 변환해야 합니다.
                        //     });
                        //   }).toList(), // expand 메서드는 Iterable을 반환하므로, toList()로 리스트로 변환합니다.
                        // ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      );
    }
    return const Text("loading");
  }
}
