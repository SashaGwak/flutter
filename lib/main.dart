import 'package:flutter/material.dart';
import 'package:toonflix/srceen/home_screen.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  // flutter는 위젯을 식별하기위해 key라는 id값을 가짐
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeScreen(),
    );
  }
}
