import 'package:flutter/material.dart';
import 'package:mobility/widgets/countdowninterface.dart';

typedef VoidCallback = void Function();

class Navigation extends StatelessWidget {
  final int seconds;
  final bool isEnd;
  final bool pause;
  final bool enableSkipPrevious;
  final bool enableSkipNext;
  final VoidCallback backwards;
  final VoidCallback forwards;
  final VoidCallback timerEnd;

  const Navigation(
      this.seconds,
      this.isEnd,
      this.pause,
      this.enableSkipPrevious,
      this.enableSkipNext,
      this.backwards,
      this.forwards,
      this.timerEnd,
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
              icon: Icon(
                Icons.skip_previous,
                color: enableSkipPrevious
                    ? Colors.grey
                    : const Color.fromARGB(205, 41, 40, 40),
              ),
              iconSize: 60,
              onPressed: enableSkipPrevious
                  ? () {
                      backwards();
                    }
                  : null,
            ),
          ),
          Expanded(
            flex: 8,
            child: Center(
              child: pause
                  ? CountdownInterface(5, timerEnd, UniqueKey())
                  : CountdownInterface(seconds, timerEnd, UniqueKey()),
            ),
          ),
          Expanded(
            flex: 5,
            child: IconButton(
              icon: isEnd
                  ? Icon(
                      Icons.check_circle,
                      color: Theme.of(context).colorScheme.primary,
                      size: 60,
                    )
                  : Icon(
                      Icons.skip_next,
                      color: enableSkipNext
                          ? Colors.grey
                          : const Color.fromARGB(205, 41, 40, 40),
                    ),
              iconSize: 60,
              onPressed: enableSkipNext || isEnd
                  ? () {
                      forwards();
                    }
                  : null,
            ),
          ),
        ],
      ),
    );
  }
}
