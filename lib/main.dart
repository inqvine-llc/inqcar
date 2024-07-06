import 'package:flutter/material.dart';
import 'package:inqcar/constants/design_constants.dart';
import 'package:inqcar/screens/home_screen.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: AppTheme.current.toThemeData(),
      home: const HomeScreen(),
    );
  }
}
