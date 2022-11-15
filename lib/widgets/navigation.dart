import 'package:flutter/material.dart';
import 'package:mobility/widgets/countdown.dart';

typedef VoidCallback = void Function();

class Navigation extends StatelessWidget {
  final int seconds;
  final VoidCallback backwards;
  final VoidCallback forwards;
  final VoidCallback setPause;

  const Navigation(this.seconds, this.backwards, this.forwards, this.setPause,
      {super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.9,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            flex: 5,
            child: IconButton(
              icon: const Icon(Icons.arrow_left_rounded, color: Colors.grey),
              iconSize: 80,
              onPressed: () {
                backwards();
              },
            ),
          ),
          Expanded(flex: 8, child: Countdown(seconds)),
          Expanded(
            flex: 5,
            child: IconButton(
              icon: const Icon(
                Icons.arrow_right_rounded,
                color: Colors.grey,
              ),
              iconSize: 80,
              onPressed: () {
                forwards();
              },
            ),
          ),
        ],
      ),
    );
  }
}
