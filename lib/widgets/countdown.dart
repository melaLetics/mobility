import 'package:flutter/material.dart';

class Countdown extends StatefulWidget {
  final int seconds;
  const Countdown(this.seconds, {super.key});

  @override
  State<Countdown> createState() => _CountdownState();
}

class _CountdownState extends State<Countdown> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Center();
  }
}
