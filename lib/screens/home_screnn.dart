import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:main_ui/bloc/checker_bloc.dart';
import 'package:main_ui/bloc/control_bloc.dart';
import 'package:main_ui/bloc/model_bloc.dart';
import 'package:main_ui/bloc/request_bloc.dart';
import 'package:main_ui/bloc/result_bloc.dart';
import 'package:main_ui/repository/check_result_repository.dart';
import 'package:main_ui/repository/model_info_repository.dart';
import 'package:main_ui/widgets/main_checker_info_widget.dart';
import 'package:main_ui/widgets/main_model_info_widget.dart';
import 'package:main_ui/widgets/main_okng_widget.dart';
import 'package:main_ui/widgets/main_result_widget.dart';
import 'package:main_ui/widgets/main_systemlog_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider<ResultRepository>(
          create: (context) => ResultRepositoryDummyImpl(),
        ),
        RepositoryProvider<ModelInfoRepository>(
          create: (context) => ModelInfoRepositoryDummyImpl(),
        ),
        RepositoryProvider<ModelNameRepository>(
          create: (context) => ModelNameRepositoryDummyImpl(),
        ),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider<ControlBloc>(
            create: (BuildContext context) => ControlBloc(),
          ),
          BlocProvider<RequestBloc>(
            create: (BuildContext context) => RequestBloc(
              repository: context.read<ResultRepository>(),
            ),
          ),
          BlocProvider<ResultBloc>(
            create: (BuildContext context) => ResultBloc(),
          ),
          BlocProvider<ModelBloc>(
            create: (BuildContext context) => ModelBloc(
              infoRepository: context.read<ModelInfoRepository>(),
              nameRepository: context.read<ModelNameRepository>(),
            ),
          ),
          BlocProvider<CheckerBloc>(
            create: (BuildContext context) => CheckerBloc(),
          )
        ],
        child: MultiBlocListener(
          listeners: [
            BlocListener<ControlBloc, ControlState>(listener: (context, state) {
              if (state is RunEvent) {
                context.read<RequestBloc>().add(RequestEvent());
              }
            }),
            BlocListener<RequestBloc, RequestState>(
              listener: (context, state) {
                if (state is RequestLoading) {
                  context.read<ControlBloc>().add(RunEvent());
                }
                // 요청 결과 값이 생기면
                if (state is RequestResponse) {
                  context.read<CheckerBloc>().add(TotalCountIncrease());
                  context.read<ResultBloc>().add(ResultResponse(
                      masterResult: state.masterResult,
                      slaveResult: state.slaveResult));
                  if (state.masterResult[state.masterResult.length - 1]
                              ['short'] ==
                          'OK' &&
                      state.slaveResult[state.slaveResult.length - 1]
                              ['short'] ==
                          'OK') {
                    context.read<ControlBloc>().add(OkEvent());
                    context.read<CheckerBloc>().add(CycleTime());
                  } else if (!(state.masterResult[state.masterResult.length - 1]
                              ['short'] ==
                          'OK' &&
                      state.slaveResult[state.slaveResult.length - 1]
                              ['short'] ==
                          'OK')) {
                    context.read<ControlBloc>().add(NgEvent());
                  }
                }
              },
            ),
            BlocListener<ResultBloc, CheckResultState>(
              listener: (context, state) {
                //결과 reset 값을 입력시 Ready 상태로 변경
                if (state is Init) {
                  context.read<ControlBloc>().add(ResetEvent());
                }
              },
            ),
            BlocListener<ControlBloc, ControlState>(
              listener: (context, state) {
                if (state is ControlStop) {
                  context.read<CheckerBloc>().add(Pause());
                } else if (state is ControlNg) {
                  context.read<CheckerBloc>().add(CycleTime());
                  context.read<CheckerBloc>().add(NgCountIncrease());
                }
              },
            ),
            BlocListener<CheckerBloc, CheckerState>(
              listener: (context, state) {
                print(state);
              },
            ),
          ],
          child: Scaffold(
            body: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const Flexible(flex: 1, child: OKNG()),
                ResultWidget(),
                const SizedBox(
                  height: 30,
                ),
                const Padding(
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
          ),
        ),
      ),
    );
  }
}
