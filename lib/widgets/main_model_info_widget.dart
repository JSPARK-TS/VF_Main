import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
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
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            Expanded(
              child: _buildModelDropdown(),
            ),
          ],
        ),
        _buildModelInfo(),
        const Row(children: [MainControl(), MainConfigCon()])
      ],
    );
  }

  Widget _buildModelDropdown() {
// 드롭다운 리스트
    List<String> dropDownList = [
      'korean no ?',
      'korean no2 ?',
      'korean no3 ?',
      'korean no4 ?',
      'korean no5 ?',
      'korean no6 ?',
      'korean no7 ?',
      'korean no8 ?',
    ];

// 초기값 설정
    if (dropDownValue == "") {
      dropDownValue = dropDownList.first;
    }
    return DropdownButton(
      isExpanded: true,
// 드롭다운 버튼에 처음 보여질 값
      value: dropDownValue,
// 드롭다운의 리스트를 보여줄 값
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
// 드롭다운의 값을 선택했을 경우
      onChanged: (String? value) {
        setState(() {
          dropDownValue = value!;
        });
      },
    );
  }

  Widget _buildModelInfo() {
    final scrollController = ScrollController();
    List<String> masterInfo = [
      "mMIN",
      "mTYP",
      "mMAX",
      "mDVF",
    ];
    List<String> slaveInfo = [
      "sMIN",
      "sTYP",
      "sMAX",
      "sDVF",
    ];
    return Row(
      children: [
        DataTable(
          decoration: BoxDecoration(
            border: Border.all(
              color: Colors.black.withOpacity(0.8),
              width: 2,
            ),
          ),
          headingRowColor:
              MaterialStateColor.resolveWith((states) => Colors.grey.shade500),
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
                    rows: [
                      DataRow(
                        color: MaterialStateColor.resolveWith(
                            (states) => Colors.grey.shade100),
                        cells: masterInfo.map<DataCell>((String value) {
                          return DataCell(
                            Text(value),
                          );
                        }).toList(),
                      ),
                      DataRow(
                        color: MaterialStateColor.resolveWith(
                            (states) => Colors.grey.shade100),
                        cells: slaveInfo.map<DataCell>((String value) {
                          return DataCell(
                            Text(value),
                          );
                        }).toList(),
                      )
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
}
