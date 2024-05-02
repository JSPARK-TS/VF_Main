import 'package:flutter/material.dart';

class OKNG extends StatelessWidget {
  const OKNG({super.key});

  final bool checkd = true;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Container(
        color: checkd ? Colors.blue : Colors.red.shade600,
        height: 300,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              checkd ? 'OK ' : 'NG',
              style: const TextStyle(color: Colors.black, fontSize: 50),
              textAlign: TextAlign.center,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.grey)),
                  onPressed: () {},
                  child: const Padding(
                    padding: EdgeInsets.all(10),
                    child: Text(
                      '초기화',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 15,
                  height: 10,
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
