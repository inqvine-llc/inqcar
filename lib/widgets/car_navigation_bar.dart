import 'dart:async';

import 'package:flutter/material.dart';
import 'package:inqcar/constants/design_constant.dart';
import 'package:inqcar/widgets/car_tap_handler.dart';
import 'package:ionicons/ionicons.dart';
import 'package:sprung/sprung.dart';

class CarNavigationBar extends StatelessWidget {
  const CarNavigationBar({
    super.key,
    required this.onMenuTap,
    this.isExpanded = false,
  });

  final bool isExpanded;

  final FutureOr<void> Function() onMenuTap;

  static const double kCollapsedHeight = 72.0;
  static const double kAppBarIconSize = 32.0;

  @override
  Widget build(BuildContext context) {
    final MediaQueryData mediaQuery = MediaQuery.of(context);
    final double screenHeight = mediaQuery.size.height;
    final expandedHeightExcludingPadding = screenHeight - kPaddingSmall * 2;

    return AnimatedContainer(
      duration: const Duration(milliseconds: 1000),
      curve: Sprung.overDamped,
      height: isExpanded ? expandedHeightExcludingPadding : kCollapsedHeight,
      width: double.infinity,
      decoration: BoxDecoration(
        color: kColorGrey350,
        borderRadius: BorderRadius.circular(kBorderRadiusSmall),
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: kColorGrey900.withOpacity(0.2),
            offset: const Offset(0.0, 4.0),
            blurRadius: 10.0,
          ),
        ],
      ),
      child: AnimatedSwitcher(
        duration: const Duration(milliseconds: 1000),
        child: !isExpanded
            ? buildNavigationRow()
            : Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: buildAppBarItems(),
              ),
      ),
    );
  }

  Widget buildNavigationRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: buildAppBarItems(),
    );
  }

  List<Widget> buildAppBarItems() {
    return <Widget>[
      buildAppBarItem(
        icon: Ionicons.globe_outline,
        tooltip: 'Browser',
        onTap: () {},
      ),
      buildAppBarItem(
        icon: Ionicons.grid_outline,
        tooltip: 'Home',
        onTap: onMenuTap,
      ),
      buildAppBarItem(
        icon: Ionicons.logo_youtube,
        tooltip: 'YouTube',
        onTap: () {},
      ),
    ];
  }

  Widget buildAppBarItem({
    required IconData icon,
    required String tooltip,
    required VoidCallback onTap,
  }) {
    return CarTapHandler(
      onTap: onTap,
      child: Tooltip(
        message: tooltip,
        child: Icon(
          icon,
          size: kAppBarIconSize,
          color: kColorGrey800,
        ),
      ),
    );
  }
}
