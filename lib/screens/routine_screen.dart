import 'package:flutter/material.dart';
import 'package:wakelock/wakelock.dart';
import 'package:mobility/model/exercise.dart';
import 'package:mobility/widgets/navigation.dart';
import 'package:mobility/widgets/progress.dart';
import 'package:mobility/widgets/show_exercise.dart';
import 'package:mobility/widgets/stimulus.dart';

class RoutineScreen extends StatefulWidget {
  static const routeName = '/routine';
  final List<Exercise> exercises;

  const RoutineScreen(this.exercises, {super.key});

  @override
  State<RoutineScreen> createState() => _RoutineScreenState();
}

class _RoutineScreenState extends State<RoutineScreen> {
  int actual = 0;
  int count = 1;
  int total = 0;
  String lastId = "";
  bool isPause = true;
  bool onEnd = false;
  bool isFirstPause = true;

  @override
  void initState() {
    total = getNumberOfExercises();
    lastId = widget.exercises[0].id;
    super.initState();
    Wakelock.enable();
  }

  @override
  void dispose() {
    Wakelock.disable();
    super.dispose();
  }

  int getNumberOfExercises() {
    var seen = <String>{};
    List<Exercise> unique =
        widget.exercises.where((elem) => seen.add(elem.id)).toList();
    return unique.length;
  }

  void stepForward() {
    setState(() {
      actual++;
    });
    if (actual == widget.exercises.length - 1) {
      setOnEnd();
    }
    if (widget.exercises[actual].id != lastId) {
      setState(() {
        lastId = widget.exercises[actual].id;
        count++;
      });
    }
  }

  void stepBack() {
    setState(() {
      actual--;
    });
    if (widget.exercises[actual].id != lastId) {
      setState(() {
        lastId = widget.exercises[actual].id;
        count--;
      });
    }
  }

  void togglePause() {
    setState(() {
      isPause = !isPause;
    });
  }

  void setOnEnd() {
    setState(() {
      onEnd = true;
    });
  }

  void onTimerEnd() {
    // pause mode after the first exercise, then the next exercise has to be shown
    if (!isPause && !isFirstPause) {
      stepForward();
    }
    if (actual == 0 && isFirstPause) {
      setState(() {
        isFirstPause = false;
      });
    }
    togglePause();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Daily Mobility',
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              )),
          centerTitle: true,
        ),
        body: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(height: 50),
            Progress(count, total),
            const SizedBox(height: 50),
            ShowExercise(widget.exercises[actual].description,
                widget.exercises[actual].instruction),
            const SizedBox(height: 20),
            Stimulus(widget.exercises[actual].stimulus),
            const SizedBox(height: 50),
            Navigation(
              widget.exercises[actual].duration[0],
              onEnd,
              isPause,
              actual > 0 && !isPause,
              !isPause,
              () {
                if (actual > 0) {
                  stepBack();
                }
              },
              () {
                if (!onEnd) {
                  stepForward();
                } else {
                  Navigator.pushReplacementNamed(context, '/setup');
                }
              },
              () {
                if (!onEnd) {
                  onTimerEnd();
                }
              },
            ),
          ],
        ));
  }
}
