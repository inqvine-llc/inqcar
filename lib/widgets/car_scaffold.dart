import 'package:flutter/material.dart';
import 'package:inqcar/constants/design_constants.dart';
import 'package:inqcar/models/car_application.dart';
import 'package:inqcar/widgets/car_menu_divider.dart';
import 'package:inqcar/widgets/car_navigation_bar.dart';
import 'package:inqcar/widgets/car_tap_handler.dart';
import 'package:sprung/sprung.dart';

class CarScaffold extends StatefulWidget {
  const CarScaffold({
    required this.child,
    super.key,
  });

  final Widget child;

  @override
  State<CarScaffold> createState() => _CarScaffoldState();
}

class _CarScaffoldState extends State<CarScaffold> {
  CarApplication? _currentApplication;
  CarApplication? get currentApplication => _currentApplication;
  set currentApplication(CarApplication? value) {
    if (value != null) {
      _currentApplication = value;
      if (mounted) {
        setState(() {});
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final bool canDisplayQuickActionsChevron = currentApplication == null;

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
            Positioned.fill(child: widget.child),
            Positioned(
              bottom: kPaddingSmall,
              left: kPaddingSmall,
              right: kPaddingSmall,
              child: CarNavigationBar(
                currentApplication: currentApplication,
                onApplicationTapped: (CarApplication app) {
                  currentApplication = app;
                },
              ),
            ),
            AnimatedPositioned(
              top: canDisplayQuickActionsChevron ? kPaddingSmall : -kAppBarIconSize * 2,
              left: kPaddingNone,
              right: kPaddingNone,
              duration: const Duration(milliseconds: 1000),
              curve: Sprung.overDamped,
              child: Align(
                alignment: Alignment.center,
                child: Container(
                  color: Colors.transparent,
                  padding: const EdgeInsets.all(kPaddingMedium),
                  child: const CarMenuDivider(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
