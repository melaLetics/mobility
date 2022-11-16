import 'package:flutter/material.dart';
import 'package:flutter_timer_countdown/flutter_timer_countdown.dart';

typedef VoidCallback = void Function();

class Pause extends StatefulWidget {
  final VoidCallback onTimerEnd;

  const Pause(this.onTimerEnd, {super.key});

  @override
  State<Pause> createState() => _PauseState();
}

class _PauseState extends State<Pause> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TimerCountdown(
        format: CountDownTimerFormat.secondsOnly,
        endTime: DateTime.now().add(
          const Duration(
            seconds: 6,
          ),
        ),
        enableDescriptions: false,
        timeTextStyle: TextStyle(
          fontSize: 50,
          color: Theme.of(context).colorScheme.primary,
        ),
        onEnd: () {
          widget.onTimerEnd();
        });
  }
}
