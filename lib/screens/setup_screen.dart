import 'package:flutter/material.dart';
import 'package:mobility/helper/parse_exercises.dart';

import 'package:mobility/model/exercise.dart';
import 'package:mobility/screens/routine_screen.dart';
import 'package:mobility/widgets/session_duration_button.dart';

class SetupScreen extends StatefulWidget {
  const SetupScreen({super.key});
  static const routeName = '/setup';

  @override
  State<SetupScreen> createState() => SetupScreenState();
}

class SetupScreenState extends State<SetupScreen> {
  int duration = 10;
  bool equipped = true;
  List<Exercise> exercises = [];
  List<Exercise> routine = [];

  _toggle(value) {
    setState(() {
      equipped = value;
    });
  }

  @override
  void initState() {
    super.initState();
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
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.9,
            child: const Center(
                child: Text(
              'Wähle die Länge deiner Session',
              style: TextStyle(
                fontFamily: 'LucidaConsole',
                color: Colors.grey,
                fontSize: 25,
              ),
            )),
          ),
          const SizedBox(height: 30),
          Center(
            child: SizedBox(
              width: MediaQuery.of(context).size.width * 0.9,
              height: 80,
              child: SessionDurationButton('10 Minuten', duration == 10, (_) {
                setState(() {
                  duration = 10;
                });
              }),
            ),
          ),
          const SizedBox(height: 25),
          Center(
            child: SizedBox(
              width: MediaQuery.of(context).size.width * 0.9,
              height: 80,
              child: SessionDurationButton('20 Minuten', duration == 20, (_) {
                setState(() {
                  duration = 20;
                });
              }),
            ),
          ),
          const SizedBox(height: 25),
          Center(
            child: SizedBox(
                width: MediaQuery.of(context).size.width * 0.9,
                height: 80,
                child: SessionDurationButton('30 Minuten', duration == 30, (_) {
                  setState(() {
                    duration = 30;
                  });
                })),
          ),
          const SizedBox(height: 50),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const Expanded(
                flex: 1,
                child: SizedBox(),
              ),
              const Expanded(
                flex: 12,
                child: Text(
                  'Freie Wand verfügbar',
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 25,
                  ),
                ),
              ),
              Expanded(
                flex: 3,
                child: Transform.scale(
                  scale: 1.7,
                  child: Checkbox(
                    value: equipped,
                    onChanged: (value) => _toggle(value),
                    hoverColor: Colors.white,
                    activeColor: Theme.of(context).colorScheme.secondary,
                    checkColor: Colors.black,
                  ),
                ),
              ),
              const Expanded(
                flex: 1,
                child: SizedBox(),
              ),
            ],
          ),
          const SizedBox(height: 70),
          Center(
            child: SizedBox(
              width: MediaQuery.of(context).size.width * 0.9,
              height: 80,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Theme.of(context).colorScheme.secondary,
                ),
                onPressed: () async {
                  List<Exercise> routine =
                      await ParseExercises().getRoutine(duration, equipped);
                  routine.sort((a, b) {
                    return a.order.compareTo(b.order);
                  });
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => RoutineScreen(routine),
                    ),
                  );
                },
                child: const Text(
                  'Starte Session',
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
