import 'package:flutter/material.dart';
import 'package:mobility/model/exercise.dart';
import 'package:mobility/widgets/progress.dart';
import 'package:mobility/widgets/stimulus.dart';

class RoutineScreen extends StatefulWidget {
  static const routeName = '/routine';
  final List<Exercise> exercises;

  const RoutineScreen(this.exercises, {super.key});

  @override
  State<RoutineScreen> createState() => _RoutineScreenState();
}

class _RoutineScreenState extends State<RoutineScreen> {
  int actual = 1;
  int total = 0;
  String lastId = "";

  @override
  void initState() {
    total = getNumberOfExercises();
    super.initState();
  }

  int getNumberOfExercises() {
    var seen = Set<String>();
    List<Exercise> unique =
        widget.exercises.where((elem) => seen.add(elem.id)).toList();
    return unique.length;
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
            Progress(actual, total),
            // Exercise
            Stimulus(widget.exercises[0].stimulus),
            // Countdown-Wrapper
          ],
        ));
  }
}
