import 'package:flutter/material.dart';

class MainSystemLog extends StatelessWidget {
  const MainSystemLog({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      decoration: BoxDecoration(
        color: Colors.grey.shade300,
        border: Border.all(
          color: Colors.black,
          width: 2,
        ),
      ),
      // child: ListView.builder(
      //   itemBuilder: itemBuilder,
      // ),
    );
  }
}
