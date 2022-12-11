import 'package:flutter/material.dart';
import 'package:mobility/screens/setup_screen.dart';

class App extends StatelessWidget {
  App({super.key});

  final Map<int, Color> color = {
    50: const Color.fromRGBO(1, 203, 203, .1),
    100: const Color.fromRGBO(1, 203, 203, .2),
    200: const Color.fromRGBO(1, 203, 203, .3),
    300: const Color.fromRGBO(1, 203, 203, .4),
    400: const Color.fromRGBO(1, 203, 203, .5),
    500: const Color.fromRGBO(1, 203, 203, .6),
    600: const Color.fromRGBO(1, 203, 203, .7),
    700: const Color.fromRGBO(1, 203, 203, .8),
    800: const Color.fromRGBO(1, 203, 203, .9),
    900: const Color.fromRGBO(1, 203, 203, 1),
  };

  @override
  Widget build(context) {
    MaterialColor colorCustom = MaterialColor(0x8001CBCB, color);

    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.black,
        primarySwatch: colorCustom,
        colorScheme: ColorScheme.fromSwatch().copyWith(
          primary: colorCustom,
          secondary:
              const Color.fromRGBO(1, 203, 203, 0.5), // Your accent color
        ),
        scaffoldBackgroundColor: const Color.fromARGB(255, 16, 20, 17),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
            foregroundColor: MaterialStateProperty.all(Colors.grey),
            backgroundColor: MaterialStateProperty.all(colorCustom),
          ),
        ),
      ),
      home: const SetupScreen(),
      routes: {
        SetupScreen.routeName: (ctx) => const SetupScreen(),
      },
    );
  }
}
