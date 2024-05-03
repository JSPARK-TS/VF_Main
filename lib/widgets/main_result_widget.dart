import 'package:flutter/material.dart';

class ResultWidget extends StatefulWidget {
  const ResultWidget({super.key});

  @override
  State<ResultWidget> createState() => _ResultWidgetState();
}

class _ResultWidgetState extends State<ResultWidget> {
  List test = [
    1,
    2,
    3,
    4,
    5,
    6,
    7,
    8,
    9,
    10,
    11,
    12,
    13,
    14,
    15,
    16,
    17,
    18,
    19
  ];

  final _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            '측정 결과',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Row(children: [
            SizedBox(
              child: DataTable(
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
                    )
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
                        ]),
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
                        ])
                  ]),
            ),
            Expanded(
              child: Scrollbar(
                controller: _scrollController,
                child: LayoutBuilder(
                  builder: (context, constrain) {
                    return SingleChildScrollView(
                      controller: _scrollController,
                      scrollDirection: Axis.horizontal,
                      child: ConstrainedBox(
                        constraints:
                            BoxConstraints(minWidth: constrain.maxWidth),
                        child: DataTable(
                          decoration: BoxDecoration(
                            border: Border.symmetric(
                              horizontal: BorderSide(
                                color: Colors.black.withOpacity(0.8),
                                width: 2,
                              ),
                            ),
                          ),
                          columnSpacing: 75,
                          headingRowColor: MaterialStateColor.resolveWith(
                              (states) => Colors.grey.shade500),
                          columns: List.generate(
                              test.length,
                              (index) => DataColumn(
                                      label: Text(
                                    'STN${index + 1}',
                                    style: const TextStyle(color: Colors.white),
                                  ))),
                          rows: [
                            DataRow(
                              color: MaterialStateColor.resolveWith(
                                  (states) => Colors.grey.shade100),
                              //Master
                              cells: List.generate(test.length, (index) {
                                return DataCell(
                                  Text('data 1 ${index + 1}'),
                                );
                              }),
                            ),
                            DataRow(
                              color: MaterialStateColor.resolveWith(
                                  (states) => Colors.grey.shade100),
                              //Slave
                              cells: List.generate(test.length, (index) {
                                return DataCell(
                                  Text('data 2 ${index + 1}'),
                                );
                              }),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
            SizedBox(
              child: DataTable(
                  border: TableBorder(
                    verticalInside: BorderSide(
                      color: Colors.black.withOpacity(0.8),
                      width: 2,
                    ),
                  ),
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
                        'VFP',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    DataColumn(
                        label: Text(
                      'Short',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ))
                  ],
                  rows: [
                    DataRow(
                        //Master
                        color: MaterialStateColor.resolveWith(
                            (states) => Colors.grey.shade300),
                        cells: const [
                          DataCell(
                            Text(
                              '평균치??',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                          DataCell(
                            Text(
                              '합격결과?',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                        ]),
                    DataRow(
                        //Slave
                        color: MaterialStateColor.resolveWith(
                            (states) => Colors.grey.shade300),
                        cells: const [
                          DataCell(
                            Text(
                              '평균치??',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                          DataCell(
                            Text(
                              '합격결과??',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                        ])
                  ]),
            )
          ]),
        ],
      ),
    );
  }
}
