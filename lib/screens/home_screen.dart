import 'package:flutter/material.dart';
import 'package:inqcar/widgets/car_scaffold.dart';
import 'package:inqcar/widgets/car_welcome_banner.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CarScaffold(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CarWelcomeBanner(),
        ],
      ),
    );
  }
}
