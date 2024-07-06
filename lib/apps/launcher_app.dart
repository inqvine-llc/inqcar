import 'package:flutter/material.dart';
import 'package:inqcar/constants/design_constants.dart';
import 'package:inqcar/models/car_application.dart';
import 'package:inqcar/widgets/car_tap_handler.dart';

class LauncherApp extends StatelessWidget {
  final Function(CarApplication) onAppLaunched;

  const LauncherApp({super.key, required this.onAppLaunched});

  @override
  Widget build(BuildContext context) {
    final List<CarApplication> valuesExcludeApps = CarApplication.values.where((app) => app != CarApplication.apps).toList();
    return GridView.builder(
      padding: EdgeInsets.all(AppTheme.current.paddingMedium),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 4,
        childAspectRatio: 1,
        crossAxisSpacing: AppTheme.current.paddingMedium,
        mainAxisSpacing: AppTheme.current.paddingMedium,
      ),
      itemCount: valuesExcludeApps.length - 1, // Exclude the 'apps' application
      itemBuilder: (context, index) {
        final app = valuesExcludeApps[index];
        if (app == CarApplication.apps) return const SizedBox.shrink();
        return CarTapHandler(
          onTap: () => onAppLaunched(app),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                app.icon,
                size: 24,
                color: AppTheme.current.greyPalette[8],
              ),
              SizedBox(height: AppTheme.current.paddingSmall),
              Text(
                app.name,
                style: AppTheme.current.textTheme.labelSmall?.copyWith(color: AppTheme.current.greyPalette[8]),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        );
      },
    );
  }
}
