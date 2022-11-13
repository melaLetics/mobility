import 'package:flutter/material.dart';

typedef void BooleanCallback(bool val);

class SessionDurationButton extends StatelessWidget {
  const SessionDurationButton(this.description, this.highlighted, this.callback,
      {super.key});

  final String description;
  final bool highlighted;
  final BooleanCallback callback;

  ButtonStyle highlightedButtonStyle(context) {
    return ElevatedButton.styleFrom(
        primary: Color.fromRGBO(1, 203, 203, .3),
        side: BorderSide(
          width: 5.0,
          color: Theme.of(context).colorScheme.secondary,
        ));
  }

  ButtonStyle unselectedButtonStyle(context) {
    return ElevatedButton.styleFrom(
      primary: Theme.of(context).colorScheme.secondary,
    );
  }

  TextStyle highlightedText() {
    return const TextStyle(
      fontSize: 25,
      fontWeight: FontWeight.bold,
      color: Colors.white,
    );
  }

  TextStyle unselectedText() {
    return const TextStyle(
      fontSize: 25,
      fontWeight: FontWeight.bold,
    );
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: highlighted
          ? highlightedButtonStyle(context)
          : unselectedButtonStyle(context),
      onPressed: () {
        callback(true);
      },
      child: Text(description,
          style: highlighted ? highlightedText() : unselectedText()),
    );
  }
}
