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
    return DataTable(
      columns: const [
        DataColumn(
          label: Text('구분'),
        ),
        DataColumn(label: Text('MIN')),
        DataColumn(label: Text('TYP')),
        DataColumn(label: Text('MAX')),
        DataColumn(label: Text('DVF')),
      ],
      rows: [
        DataRow(
          cells: [
            const DataCell(
              Text(
                'Master',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            ...masterInfo.map<DataCell>((String value) {
              return DataCell(
                Text(value),
              );
            })
          ],
        ),
        DataRow(
          cells: [
            const DataCell(
              Text(
                'Slave',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            ...slaveInfo.map<DataCell>((String value) {
              return DataCell(
                Text(value),
              );
            })
          ],
        )
      ],
    );
  }
}
