import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter_timer_countdown/flutter_timer_countdown.dart';

typedef VoidCallback = void Function();

class Countdown extends StatefulWidget {
  final int seconds;
  final VoidCallback timerEnd;
  const Countdown(this.seconds, this.timerEnd, {super.key});

  @override
  State<Countdown> createState() => _CountdownState();
}

class _CountdownState extends State<Countdown> {
  final player = AudioPlayer();

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
          Duration(
            seconds: widget.seconds,
          ),
        ),
        enableDescriptions: false,
        timeTextStyle: TextStyle(
          fontSize: 50,
          color: Theme.of(context).colorScheme.primary,
        ),
        onEnd: () async {
          await player.play(AssetSource('pip.mp3'));
          widget.timerEnd();
        });
  }
}
