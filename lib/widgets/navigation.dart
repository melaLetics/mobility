import 'package:flutter/material.dart';
import 'package:mobility/widgets/countdown.dart';
import 'package:mobility/widgets/pause.dart';

typedef VoidCallback = void Function();

class Navigation extends StatelessWidget {
  final int seconds;
  final bool isEnd;
  final bool pause;
  final VoidCallback backwards;
  final VoidCallback forwards;
  final VoidCallback timerEnd;

  const Navigation(this.seconds, this.isEnd, this.pause, this.backwards,
      this.forwards, this.timerEnd,
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
              icon: const Icon(Icons.skip_previous, color: Colors.grey),
              iconSize: 60,
              onPressed: () {
                backwards();
              },
            ),
          ),
          Expanded(
              flex: 8,
              child: Center(
                  child:
                      pause ? Pause(timerEnd) : Countdown(seconds, timerEnd))),
          Expanded(
            flex: 5,
            child: IconButton(
              icon: isEnd
                  ? Icon(
                      Icons.check_circle,
                      color: Theme.of(context).colorScheme.primary,
                      size: 60,
                    )
                  : const Icon(
                      Icons.skip_next,
                      color: Colors.grey,
                    ),
              iconSize: 60,
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
