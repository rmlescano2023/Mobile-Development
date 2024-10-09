import 'package:flutter/material.dart';

import 'home_screen.dart';
import 'second_screen.dart';
import 'third_screen.dart';
import 'fourth_screen.dart';
import 'fifth_screen.dart';

void main() {
  runApp(const NavigationApp());
}

class NavigationApp extends StatelessWidget {
  const NavigationApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Navigation Demo",
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomeScreen(),
      routes: <String, WidgetBuilder>{
        '/2': (BuildContext context) => const SecondScreen(),
        '/3': (BuildContext context) => const ThirdScreen(),
        '/4': (BuildContext context) => const FourthScreen(),
        '/5': (BuildContext context) => const FifthScreen(),
      },
    );
  }
}
