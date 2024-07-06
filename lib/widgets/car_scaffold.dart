import 'package:flutter/material.dart';
import 'package:inqcar/constants/design_constant.dart';
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
  bool _isNavigationBarExpanded = false;
  bool get isNavigationBarExpanded => _isNavigationBarExpanded;
  set isNavigationBarExpanded(bool value) {
    setState(() => _isNavigationBarExpanded = value);
  }

  @override
  Widget build(BuildContext context) {
    final bool canDisplayQuickActionsChevron = !isNavigationBarExpanded;

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
                isExpanded: _isNavigationBarExpanded,
                onMenuTap: () => isNavigationBarExpanded = !isNavigationBarExpanded,
              ),
            ),
            AnimatedPositioned(
              top: canDisplayQuickActionsChevron ? kPaddingSmall : -CarMenuDivider.kDividerHeight * 2,
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
