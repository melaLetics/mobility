import 'package:flutter/material.dart';

class Stimulus extends StatelessWidget {
  final List<String> stimulus;

  const Stimulus(this.stimulus, {super.key});

  Widget getChipWidgets(List<String> strings, BuildContext context) {
    return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: strings
            .map(
              (item) => Padding(
                padding: const EdgeInsets.all(5.0),
                child: Chip(
                  label: Text(item,
                      style: const TextStyle(
                        fontSize: 16,
                      )),
                  backgroundColor: Color.fromRGBO(1, 203, 203, .3),
                ),
              ),
            )
            .toList());
  }

  @override
  Widget build(BuildContext context) {
    return getChipWidgets(stimulus, context);
  }
}
