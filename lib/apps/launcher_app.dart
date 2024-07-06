import 'package:flutter/material.dart';
import 'package:inqcar/constants/design_constants.dart';
import 'package:inqcar/models/car_application.dart';
import 'package:inqcar/widgets/car_tap_handler.dart';

class LauncherApp extends StatelessWidget {
  final Function(CarApplication) onAppLaunched;

  const LauncherApp({Key? key, required this.onAppLaunched}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: const EdgeInsets.all(kPaddingMedium),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 4,
        childAspectRatio: 1,
        crossAxisSpacing: kPaddingMedium,
        mainAxisSpacing: kPaddingMedium,
      ),
      itemCount: CarApplication.values.length - 1, // Exclude the 'apps' application
      itemBuilder: (context, index) {
        final app = CarApplication.values[index];
        if (app == CarApplication.apps) return const SizedBox.shrink();
        return CarTapHandler(
          onTap: () => onAppLaunched(app),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                app.icon,
                size: kAppBarIconSize * 1.5,
                color: kColorGrey800,
              ),
              const SizedBox(height: kPaddingSmall),
              Text(
                app.name,
                style: kTextTheme.bodySmall,
                textAlign: TextAlign.center,
              ),
            ],
          ),
        );
      },
    );
  }
}
