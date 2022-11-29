import 'package:flutter/material.dart';
import 'package:timer_count_down/timer_controller.dart';
import 'package:timer_count_down/timer_count_down.dart';
import 'package:audioplayers/audioplayers.dart';

typedef VoidCallback = void Function();

class CountdownInterface extends StatefulWidget {
  final int seconds;
  final VoidCallback timerEnd;
  final Key key;
  const CountdownInterface(this.seconds, this.timerEnd, this.key)
      : super(key: key);

  @override
  State<StatefulWidget> createState() => _CountdownInterfaceState();
}

class _CountdownInterfaceState extends State<CountdownInterface> {
  final CountdownController _controller = CountdownController(autoStart: true);

  final player = AudioPlayer();
  bool stopped = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  void onTap() {
    if (stopped) {
      setState(() {
        stopped = false;
      });
      _controller.resume();
    } else {
      setState(() {
        stopped = true;
      });
      _controller.pause();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 16,
            ),
            child: InkWell(
              child: Countdown(
                controller: _controller,
                seconds: widget.seconds,
                build: (_, double time) => Text(
                  time.toStringAsFixed(0),
                  style: TextStyle(
                    fontSize: 50,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ),
                interval: Duration(seconds: 1),
                onFinished: () async {
                  if (widget.seconds > 5) {
                    await player.play(AssetSource('pip.mp3'));
                  }
                  widget.timerEnd();
                },
              ),
              onTap: () {
                onTap();
              },
            ),
          ),
        ],
      ),
    );
  }
}
