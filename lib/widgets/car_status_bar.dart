import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:ionicons/ionicons.dart';
import 'package:inqcar/constants/design_constants.dart';

class CarStatusBar extends StatelessWidget {
  const CarStatusBar({
    super.key,
    this.timeBuilder,
    this.dateBuilder,
    this.temperatureBuilder,
    this.batteryBuilder,
    this.networkBuilder,
  });

  final Widget Function(BuildContext, String)? timeBuilder;
  final Widget Function(BuildContext, String)? dateBuilder;
  final Widget Function(BuildContext, String)? temperatureBuilder;
  final Widget Function(BuildContext, String)? batteryBuilder;
  final Widget Function(BuildContext, String)? networkBuilder;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: kTitleBarHeight,
      color: kColorGrey300.withOpacity(0.5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _buildTime(context),
          _buildDate(context),
          _buildTemperature(context),
          _buildBattery(context),
          _buildNetwork(context),
        ],
      ),
    );
  }

  Widget _buildTime(BuildContext context) {
    final time = DateFormat.Hm().format(DateTime.now());
    return timeBuilder?.call(context, time) ?? _defaultBuilder(context, Ionicons.time_outline, time);
  }

  Widget _buildDate(BuildContext context) {
    final date = DateFormat.MMMd().format(DateTime.now());
    return dateBuilder?.call(context, date) ?? _defaultBuilder(context, Ionicons.calendar_outline, date);
  }

  Widget _buildTemperature(BuildContext context) {
    const temperature = "22°C"; // Replace with actual temperature logic
    return temperatureBuilder?.call(context, temperature) ?? _defaultBuilder(context, Ionicons.thermometer_outline, temperature);
  }

  Widget _buildBattery(BuildContext context) {
    const batteryLevel = "80%"; // Replace with actual battery level logic
    return batteryBuilder?.call(context, batteryLevel) ?? _defaultBuilder(context, Ionicons.battery_charging_outline, batteryLevel);
  }

  Widget _buildNetwork(BuildContext context) {
    const networkStatus = "4G"; // Replace with actual network status logic
    return networkBuilder?.call(context, networkStatus) ?? _defaultBuilder(context, Ionicons.wifi_outline, networkStatus);
  }

  Widget _defaultBuilder(BuildContext context, IconData icon, String text) {
    return IgnorePointer(
      ignoring: true,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: kPaddingSmall),
        child: Row(
          children: [
            Icon(icon, color: kColorGrey900, size: kAppStatusBarIconSize),
            const SizedBox(width: kPaddingXSmall),
            Text(
              text,
              style: kTextTheme.labelSmall?.copyWith(color: kColorGrey900),
            ),
          ],
        ),
      ),
    );
  }
}
