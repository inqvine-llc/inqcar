import 'package:flutter/material.dart';
import 'package:inqcar/constants/design_constant.dart';
import 'package:ionicons/ionicons.dart';

class CarMenuDivider extends StatelessWidget {
  const CarMenuDivider({super.key});

  static const double kDividerHeight = 32.0;

  @override
  Widget build(BuildContext context) {
    return Icon(
      Ionicons.chevron_down,
      color: kColorGrey800.withOpacity(0.6),
      size: kDividerHeight,
    );
  }
}
