import 'package:flutter/material.dart';
import 'package:mobility/model/exercise.dart';

class RoutineScreen extends StatefulWidget {
  static const routeName = '/routine';
  final List<Exercise> exercises;

  const RoutineScreen(this.exercises, {super.key});

  @override
  State<RoutineScreen> createState() => _RoutineScreenState();
}

class _RoutineScreenState extends State<RoutineScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
        // ProgressBar
        // Exercise
        // Stimulus Chips
        // Countdown-Wrapper
        );
  }
}
