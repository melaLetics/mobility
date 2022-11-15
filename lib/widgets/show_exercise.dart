import 'package:flutter/material.dart';

class ShowExercise extends StatelessWidget {
  final String description;
  final List<String> instructions;

  const ShowExercise(this.description, this.instructions, {super.key});

  Widget getInstructions(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: instructions
              .map(
                (item) => Row(
                  children: [
                    const Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 5.0),
                      child: const Icon(Icons.check_circle_sharp),
                    ),
                    Text(
                      item,
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(
                      height: 40,
                    )
                  ],
                ),
              )
              .toList()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).colorScheme.primary,
      child: SizedBox(
        height: 300,
        width: MediaQuery.of(context).size.width * 0.9,
        child: Column(
          children: [
            const SizedBox(height: 25),
            Text(
              description,
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            getInstructions(context),
          ],
        ),
      ),
    );
  }
}
