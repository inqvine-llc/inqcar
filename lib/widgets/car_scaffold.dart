import 'package:flutter/material.dart';
import 'package:inqcar/constants/design_constant.dart';
import 'package:inqcar/widgets/car_menu_divider.dart';
import 'package:inqcar/widgets/car_navigation_bar.dart';

class CarScaffold extends StatelessWidget {
  const CarScaffold({
    required this.child,
    super.key,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Material(
      type: MaterialType.transparency,
      child: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: const BoxDecoration(
          gradient: RadialGradient(
            colors: <Color>[
              kColorGrey300,
              kColorGrey500,
            ],
            center: Alignment.center,
            radius: 1.5,
          ),
        ),
        child: Stack(
          children: <Widget>[
            Positioned.fill(child: child),
            const Positioned(
              bottom: kPaddingSmall,
              left: kPaddingSmall,
              right: kPaddingSmall,
              child: CarNavigationBar(),
            ),
            const Positioned(
              top: kPaddingLarge,
              left: kPaddingNone,
              right: kPaddingNone,
              child: Align(
                alignment: Alignment.topCenter,
                child: CarMenuDivider(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
