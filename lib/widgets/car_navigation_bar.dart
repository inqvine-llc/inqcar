import 'package:flutter/material.dart';
import 'package:inqcar/constants/design_constant.dart';

class CarNavigationBar extends StatelessWidget {
  const CarNavigationBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 72.0,
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
    );
  }
}
