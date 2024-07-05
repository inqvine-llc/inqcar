import 'package:flutter/material.dart';
import 'package:inqcar/constants/design_constant.dart';

class CarMenuDivider extends StatelessWidget {
  const CarMenuDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 4.0,
      width: 150.0,
      decoration: BoxDecoration(
        color: kColorGrey900.withOpacity(0.6),
        borderRadius: BorderRadius.circular(kBorderRadiusSmall),
      ),
    );
  }
}
