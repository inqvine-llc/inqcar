import 'package:flutter/material.dart';
import 'package:inqcar/constants/design_constants.dart';
import 'package:ionicons/ionicons.dart';

class CarQuickSettingsDrawer extends StatefulWidget {
  final VoidCallback onClose;

  const CarQuickSettingsDrawer({super.key, required this.onClose});

  @override
  _CarQuickSettingsDrawerState createState() => _CarQuickSettingsDrawerState();
}

class _CarQuickSettingsDrawerState extends State<CarQuickSettingsDrawer> {
  double _volume = 0.5;

  @override
  Widget build(BuildContext context) {
    final theme = AppTheme.current;
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            theme.colorSurfaceDark.withOpacity(0.95),
            theme.colorSurfaceDark.withOpacity(0.85),
          ],
        ),
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(theme.borderRadiusMedium),
          bottomRight: Radius.circular(theme.borderRadiusMedium),
        ),
      ),
      child: CustomScrollView(
        slivers: [
          SliverPersistentHeader(
            pinned: true,
            delegate: _SliverAppBarDelegate(
              minHeight: 50.0,
              maxHeight: 50.0,
              child: _buildHeader(theme),
            ),
          ),
          SliverPadding(
            padding: EdgeInsets.all(theme.paddingXSmall),
            sliver: SliverList(
              delegate: SliverChildListDelegate([
                _buildSectionHeader(theme, 'Vehicle Data'),
                _buildFlexibleGrid(theme, vehicleData),
                SizedBox(height: theme.paddingXSmall),
                _buildSectionHeader(theme, 'System Monitor'),
                _buildFlexibleGrid(theme, systemData),
                SizedBox(height: theme.paddingXSmall),
                _buildSectionHeader(theme, 'Media'),
                _buildMediaControls(theme),
              ]),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHeader(AppTheme theme) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: theme.paddingSmall),
      color: theme.greyPalette[2].withOpacity(0.9),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Quick Settings',
            style: theme.textTheme.titleSmall?.copyWith(
              fontWeight: FontWeight.bold,
              color: theme.greyPalette[8],
            ),
          ),
          IconButton(
            icon: Icon(Ionicons.close, color: theme.greyPalette[8]),
            onPressed: widget.onClose,
          ),
        ],
      ),
    );
  }

  Widget _buildSectionHeader(AppTheme theme, String title) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 12),
      child: Row(
        children: [
          Expanded(
            child: Divider(color: theme.greyPalette[6].withOpacity(0.5), thickness: 1),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 8),
            child: Text(
              title.toUpperCase(),
              style: theme.textTheme.labelMedium?.copyWith(
                fontWeight: FontWeight.bold,
                color: theme.greyPalette[7],
                letterSpacing: 1.2,
              ),
            ),
          ),
          Expanded(
            child: Divider(color: theme.greyPalette[6].withOpacity(0.5), thickness: 1),
          ),
        ],
      ),
    );
  }

  Widget _buildFlexibleGrid(AppTheme theme, List<Map<String, dynamic>> gridData) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final itemWidth = constraints.maxWidth / 6; // Aim for 6 items per row
        final itemHeight = itemWidth * 1.1; // Maintain aspect ratio
        final crossAxisCount = (constraints.maxWidth / itemWidth).floor();

        return Wrap(
          alignment: WrapAlignment.center,
          spacing: theme.paddingXSmall / 2,
          runSpacing: theme.paddingXSmall / 2,
          children: gridData
              .map((data) => SizedBox(
                    width: itemWidth,
                    height: itemHeight,
                    child: _buildGridItem(data['icon'], data['value'], data['label'], theme),
                  ))
              .toList(),
        );
      },
    );
  }

  Widget _buildGridItem(IconData icon, String value, String label, AppTheme theme) {
    return Container(
      decoration: BoxDecoration(
        color: theme.colorSurfaceLight.withOpacity(0.1),
        borderRadius: BorderRadius.circular(theme.borderRadiusSmall),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, size: 14, color: theme.greyPalette[6]),
          SizedBox(height: 2),
          Text(
            value,
            style: theme.textTheme.bodySmall?.copyWith(
              fontWeight: FontWeight.bold,
              fontSize: 9,
              color: theme.greyPalette[8],
            ),
          ),
          Text(
            label,
            style: theme.textTheme.labelSmall?.copyWith(
              fontSize: 7,
              color: theme.greyPalette[6],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMediaControls(AppTheme theme) {
    return Column(
      children: [
        Text(
          'Now Playing: Song Title - Artist',
          style: theme.textTheme.bodySmall?.copyWith(
            fontWeight: FontWeight.bold,
            color: theme.greyPalette[7],
          ),
          textAlign: TextAlign.center,
        ),
        SizedBox(height: 8),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
              icon: Icon(Ionicons.play_skip_back, size: 20, color: theme.greyPalette[7]),
              onPressed: () {},
            ),
            IconButton(
              icon: Icon(Ionicons.play, size: 20, color: theme.greyPalette[7]),
              onPressed: () {},
            ),
            IconButton(
              icon: Icon(Ionicons.play_skip_forward, size: 20, color: theme.greyPalette[7]),
              onPressed: () {},
            ),
          ],
        ),
        _buildVolumeSlider(theme),
      ],
    );
  }

  Widget _buildVolumeSlider(AppTheme theme) {
    return Center(
      child: Container(
        constraints: BoxConstraints(maxWidth: 300),
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Ionicons.volume_low_outline, size: 16, color: theme.greyPalette[6]),
            Expanded(
              child: Slider(
                value: _volume,
                onChanged: (value) {
                  setState(() => _volume = value);
                },
                activeColor: theme.colorAccent,
                inactiveColor: theme.colorSurfaceDark.withOpacity(0.3),
              ),
            ),
            Icon(Ionicons.volume_high_outline, size: 16, color: theme.greyPalette[6]),
          ],
        ),
      ),
    );
  }
}

class _SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  _SliverAppBarDelegate({
    required this.minHeight,
    required this.maxHeight,
    required this.child,
  });

  final double minHeight;
  final double maxHeight;
  final Widget child;

  @override
  double get minExtent => minHeight;
  @override
  double get maxExtent => maxHeight;

  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    return SizedBox.expand(child: child);
  }

  @override
  bool shouldRebuild(_SliverAppBarDelegate oldDelegate) {
    return maxHeight != oldDelegate.maxHeight || minHeight != oldDelegate.minHeight || child != oldDelegate.child;
  }
}

final List<Map<String, dynamic>> vehicleData = [
  {'icon': Ionicons.speedometer_outline, 'value': '60 mph', 'label': 'Speed'},
  {'icon': Ionicons.thermometer_outline, 'value': '190°F', 'label': 'Temp'},
  {'icon': Ionicons.battery_half_outline, 'value': '80%', 'label': 'Battery'},
  {'icon': Ionicons.car_outline, 'value': '15 gal', 'label': 'Fuel'},
  {'icon': Ionicons.speedometer_outline, 'value': '3200 rpm', 'label': 'RPM'},
  {'icon': Ionicons.pulse_outline, 'value': '13.2V', 'label': 'Voltage'},
  {'icon': Ionicons.navigate_outline, 'value': 'N 40°', 'label': 'Heading'},
  {'icon': Ionicons.thermometer_outline, 'value': '72°F', 'label': 'Cabin'},
  {'icon': Ionicons.cloudy_night_outline, 'value': '68°F', 'label': 'Outside'},
  {'icon': Ionicons.speedometer_outline, 'value': '35 psi', 'label': 'Tire'},
  {'icon': Ionicons.water_outline, 'value': '80%', 'label': 'Oil'},
  {'icon': Ionicons.flash_outline, 'value': 'Normal', 'label': 'Status'},
];

final List<Map<String, dynamic>> systemData = [
  {'icon': Ionicons.wifi_outline, 'value': 'Connected', 'label': 'WiFi'},
  {'icon': Ionicons.hardware_chip_outline, 'value': '55°C', 'label': 'CPU'},
  {'icon': Ionicons.tv_outline, 'value': '50°C', 'label': 'GPU'},
  {'icon': Ionicons.disc_outline, 'value': '64 GB', 'label': 'Storage'},
  {'icon': Ionicons.apps_outline, 'value': '8 GB', 'label': 'RAM'},
  {'icon': Ionicons.logo_android, 'value': 'Android 11', 'label': 'OS'},
  {'icon': Ionicons.git_network_outline, 'value': '192.168.1.5', 'label': 'IP'},
  {'icon': Ionicons.time_outline, 'value': '34 ms', 'label': 'Latency'},
  {'icon': Ionicons.bluetooth_outline, 'value': 'On', 'label': 'Bluetooth'},
  {'icon': Ionicons.cellular_outline, 'value': '4G', 'label': 'Network'},
  {'icon': Ionicons.earth_outline, 'value': '25 Mbps', 'label': 'Internet'},
  {'icon': Ionicons.shield_checkmark_outline, 'value': 'Secure', 'label': 'Security'},
];
