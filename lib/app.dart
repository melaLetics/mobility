import 'package:flutter/material.dart';

import 'package:mobility/screens/setup_screen.dart';
import 'package:mobility/screens/routine_screen.dart';

class App extends StatelessWidget {
  App({super.key});

  final Map<int, Color> color = {
    50: Color.fromRGBO(1, 203, 203, .1),
    100: Color.fromRGBO(1, 203, 203, .2),
    200: Color.fromRGBO(1, 203, 203, .3),
    300: Color.fromRGBO(1, 203, 203, .4),
    400: Color.fromRGBO(1, 203, 203, .5),
    500: Color.fromRGBO(1, 203, 203, .6),
    600: Color.fromRGBO(1, 203, 203, .7),
    700: Color.fromRGBO(1, 203, 203, .8),
    800: Color.fromRGBO(1, 203, 203, .9),
    900: Color.fromRGBO(1, 203, 203, 1),
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
          secondary: Color.fromRGBO(1, 203, 203, 0.5), // Your accent color
        ),
        scaffoldBackgroundColor: Color.fromARGB(255, 16, 20, 17),
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
