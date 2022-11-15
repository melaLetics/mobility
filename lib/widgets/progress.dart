import 'package:flutter/material.dart';

import 'package:linear_progress_bar/linear_progress_bar.dart';

class Progress extends StatelessWidget {
  final int actual;
  final int total;

  const Progress(this.actual, this.total, {super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Center(
          child: SizedBox(
            width: MediaQuery.of(context).size.width * 0.9,
            child: LinearProgressBar(
              maxSteps: total,
              progressType: LinearProgressBar.progressTypeLinear,
              currentStep: actual,
              progressColor: Theme.of(context).colorScheme.secondary,
              backgroundColor: Colors.grey,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 12),
          child: Text(
            "$actual/$total",
            style: const TextStyle(
              color: Colors.white,
            ),
          ),
        ),
      ],
    );
  }
}
