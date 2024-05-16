import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:main_ui/bloc/result_bloc.dart';

class ResultWidget extends StatelessWidget {
  ResultWidget({super.key});

  final _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ResultBloc, CheckResultState>(
      builder: (context, state) {
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
                                  state.masterResult.length - 2,
                                  (index) => DataColumn(
                                          label: Text(
                                        'STN${index + 1}',
                                        style: const TextStyle(
                                            color: Colors.white),
                                      ))),
                              rows: [
                                DataRow(
                                  color: MaterialStateColor.resolveWith(
                                      (states) => Colors.grey.shade100),
                                  //Master
                                  cells: List.generate(
                                      state.masterResult.length - 2, (index) {
                                    return DataCell(
                                      Text(
                                          style: state.masterResult[index]
                                                  ["result"]
                                              ? null
                                              : const TextStyle(
                                                  color: Colors.red),
                                          '${state.masterResult[index]["value"].toString()}v'),
                                    );
                                  }),
                                ),
                                DataRow(
                                  color: MaterialStateColor.resolveWith(
                                      (states) => Colors.grey.shade100),
                                  //Slave
                                  cells: List.generate(
                                      state.masterResult.length - 2, (index) {
                                    return DataCell(
                                      Text(
                                          style: state.slaveResult[index]
                                                  ["result"]
                                              ? null
                                              : const TextStyle(
                                                  color: Colors.red),
                                          ('${state.slaveResult[index]["value"].toString()}v')),
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
                            'DVF',
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
                            cells: [
                              DataCell(
                                Text(
                                  "${state.masterResult[state.masterResult.length - 2]["DVF"].toString()}v",
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              DataCell(
                                Text(
                                  state.masterResult[
                                      state.masterResult.length - 1]["short"],
                                  style: state.masterResult[
                                                  state.masterResult.length - 1]
                                              ["short"] ==
                                          'OK'
                                      ? const TextStyle(
                                          fontWeight: FontWeight.bold)
                                      : const TextStyle(
                                          color: Colors.red,
                                          fontWeight: FontWeight.bold),
                                ),
                              ),
                            ]),
                        DataRow(
                            //Slave
                            color: MaterialStateColor.resolveWith(
                                (states) => Colors.grey.shade300),
                            cells: [
                              DataCell(
                                Text(
                                  "${state.slaveResult[state.masterResult.length - 2]["DVF"].toString()}v",
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              DataCell(
                                Text(
                                  state.slaveResult[
                                      state.masterResult.length - 1]["short"],
                                  style: state.slaveResult[
                                                  state.masterResult.length - 1]
                                              ["short"] ==
                                          'OK'
                                      ? const TextStyle(
                                          fontWeight: FontWeight.bold)
                                      : const TextStyle(
                                          color: Colors.red,
                                          fontWeight: FontWeight.bold),
                                ),
                              ),
                            ])
                      ]),
                )
              ]),
            ],
          ),
        );
      },
    );
  }
}
