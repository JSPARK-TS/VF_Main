import 'package:flutter/material.dart';

class MainConfigCon extends StatefulWidget {
  const MainConfigCon({super.key});

  @override
  State<MainConfigCon> createState() => _MainConfigConState();
}

class _MainConfigConState extends State<MainConfigCon> {
  @override
  Widget build(BuildContext context) {
    late bool ppsConfig = false;
    late bool smuConfig = true;

    return Flexible(
      child: Column(
        children: [
          const Text(
            "연결 상태",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          ),
          Row(
            //PPS config
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              const Text(
                'PPS',
                style: TextStyle(fontSize: 20),
              ),
              Container(
                decoration: BoxDecoration(
                    color:
                        ppsConfig ? Colors.green.shade300 : Colors.red.shade300,
                    borderRadius: const BorderRadius.all(Radius.circular(10))),
                margin: const EdgeInsets.only(left: 20),
                // color: Colors.red,
                constraints: const BoxConstraints(
                  minHeight: 20,
                  minWidth: 100,
                ),
              )
            ],
          ),
          Row(
            //SMU config
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              const Text(
                'SMU',
                style: TextStyle(fontSize: 20),
              ),
              Container(
                decoration: BoxDecoration(
                    color:
                        smuConfig ? Colors.green.shade300 : Colors.red.shade300,
                    borderRadius: const BorderRadius.all(Radius.circular(10))),
                margin: const EdgeInsets.only(left: 20),
                // color: Colors.red,
                constraints: const BoxConstraints(
                  minHeight: 20,
                  minWidth: 100,
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
