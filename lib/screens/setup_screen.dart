import 'dart:math';

import 'package:flutter/material.dart';
import 'package:mobility/screens/routine_screen.dart';

class SetupScreen extends StatefulWidget {
  const SetupScreen({super.key});
  static const routeName = '/setup';

  @override
  State<SetupScreen> createState() => SetupScreenState();
}

class SetupScreenState extends State<SetupScreen> {
  int duration = 10;
  bool equipped = true;

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
        title: const Text('Daily Mobility'),
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
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            )),
          ),
          const SizedBox(height: 30),
          Center(
            child: SizedBox(
              width: MediaQuery.of(context).size.width * 0.9,
              height: 80,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Theme.of(context).colorScheme.secondary,
                ),
                onPressed: () {
                  setState(() {
                    duration = 10;
                  });
                },
                child: const Text(
                  '10 Minuten',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 25),
          Center(
            child: SizedBox(
              width: MediaQuery.of(context).size.width * 0.9,
              height: 80,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Theme.of(context).colorScheme.secondary,
                ),
                onPressed: () {
                  setState(() {
                    duration = 20;
                  });
                },
                child: const Text(
                  '20 Minuten',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 25),
          Center(
            child: SizedBox(
              width: MediaQuery.of(context).size.width * 0.9,
              height: 80,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Theme.of(context).colorScheme.secondary,
                ),
                onPressed: () {
                  setState(() {
                    duration = 30;
                  });
                },
                child: const Text(
                  '30 Minuten',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
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
                    fontSize: 25,
                    color: Colors.white,
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
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const RoutineScreen(),
                    ),
                  );
                },
                child: const Text(
                  'Starte Session',
                  style: TextStyle(
                    color: Colors.white,
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
