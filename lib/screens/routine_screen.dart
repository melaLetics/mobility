import 'package:flutter/material.dart';
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
  bool isPause = false;
  bool onEnd = false;

  @override
  void initState() {
    total = getNumberOfExercises();
    lastId = widget.exercises[0].id;
    super.initState();
  }

  int getNumberOfExercises() {
    var seen = Set<String>();
    List<Exercise> unique =
        widget.exercises.where((elem) => seen.add(elem.id)).toList();
    return unique.length;
  }

  void stepForward() {
    setState(() {
      actual++;
    });
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Daily Mobility',
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
                color: Colors.grey,
              )),
          centerTitle: true,
        ),
        body: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(height: 50),
            Progress(count, total),
            const SizedBox(height: 50),
            isPause
                ? const ShowExercise('Seite wechseln', [])
                : ShowExercise(widget.exercises[actual].description,
                    widget.exercises[actual].instruction),
            const SizedBox(height: 20),
            isPause
                ? const Center()
                : Stimulus(widget.exercises[actual].stimulus),
            const SizedBox(height: 50),
            Navigation(widget.exercises[actual].duration[0], () {
              if (actual > 0) {
                stepBack();
              }
            }, () {
              if (actual < widget.exercises.length - 1) {
                stepForward();
              }
            }, () {
              togglePause();
            }),
          ],
        ));
  }
}
