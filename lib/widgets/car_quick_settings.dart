import 'package:flutter/material.dart';
import 'package:inqcar/constants/design_constants.dart';
import 'package:ionicons/ionicons.dart';
import 'package:sliver_tools/sliver_tools.dart';
import 'dart:ui';

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
    final isWideScreen = MediaQuery.of(context).size.width > 600;
    return ClipRRect(
      borderRadius: BorderRadius.only(
        bottomLeft: Radius.circular(theme.borderRadiusMedium),
        bottomRight: Radius.circular(theme.borderRadiusMedium),
      ),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 2, sigmaY: 2),
        child: Container(
          decoration: BoxDecoration(
            color: theme.colorSurfaceLight.withOpacity(0.8),
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(theme.borderRadiusMedium),
              bottomRight: Radius.circular(theme.borderRadiusMedium),
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                blurRadius: 10,
                offset: const Offset(0, 5),
              ),
            ],
            border: Border.all(
              color: Colors.white.withOpacity(0.2),
              width: 1.5,
            ),
          ),
          child: CustomScrollView(
            slivers: [
              SliverPersistentHeader(
                pinned: true,
                delegate: _SliverAppBarDelegate(
                  minHeight: 60.0,
                  maxHeight: 60.0,
                  child: _buildHeader(theme),
                ),
              ),
              SliverPadding(
                padding: EdgeInsets.all(theme.paddingSmall),
                sliver: MultiSliver(
                  children: [
                    _buildVehicleData(theme, isWideScreen),
                    SizedBox(height: theme.paddingSmall),
                    _buildSectionHeader(theme, 'Media'),
                    _buildMediaControls(theme, isWideScreen),
                    SizedBox(height: theme.paddingSmall),
                    _buildSectionHeader(theme, 'System Monitor'),
                    _buildSystemMonitor(theme),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeader(AppTheme theme) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: theme.paddingSmall),
      decoration: BoxDecoration(
        color: theme.greyPalette[3].withOpacity(0.2),
        border: Border.all(
          color: Colors.white.withOpacity(0.2),
          width: 1.5,
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text('Vehicle Dashboard', style: theme.textTheme.titleSmall?.copyWith(fontWeight: FontWeight.bold)),
          IconButton(
            icon: Icon(Ionicons.close, color: theme.colorText),
            onPressed: widget.onClose,
          ),
        ],
      ),
    );
  }

  Widget _buildSectionHeader(AppTheme theme, String title) {
    return SliverToBoxAdapter(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: theme.textTheme.titleMedium),
          Divider(color: theme.colorText.withOpacity(0.2)),
        ],
      ),
    );
  }

  Widget _buildVehicleData(AppTheme theme, bool isWideScreen) {
    final List<Map<String, dynamic>> vehicleData = [
      {'icon': Ionicons.speedometer_outline, 'value': '60 mph', 'label': 'Speed'},
      {'icon': Ionicons.thermometer_outline, 'value': '190°F', 'label': 'Engine Temp'},
      {'icon': Ionicons.battery_half_outline, 'value': '80%', 'label': 'Battery'},
      {'icon': Ionicons.car_outline, 'value': '15 gal', 'label': 'Fuel'},
      {'icon': Ionicons.speedometer_outline, 'value': '3200 rpm', 'label': 'RPM'},
      {'icon': Ionicons.alarm_outline, 'value': '34 ms', 'label': 'Ping'},
      {'icon': Ionicons.water_outline, 'value': '78%', 'label': 'Humidity'},
      {'icon': Ionicons.flash_outline, 'value': '13.2V', 'label': 'Voltage'},
    ];

    return SliverToBoxAdapter(
      child: GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: isWideScreen ? 4 : 2,
          childAspectRatio: 1,
          crossAxisSpacing: theme.paddingXSmall,
          mainAxisSpacing: theme.paddingXSmall,
        ),
        itemCount: vehicleData.length,
        itemBuilder: (context, index) {
          return _buildDataItem(vehicleData[index]['icon'], vehicleData[index]['value'], vehicleData[index]['label'], theme);
        },
      ),
    );
  }

  Widget _buildDataItem(IconData icon, String value, String label, AppTheme theme) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(icon, size: 24, color: theme.colorText),
        SizedBox(height: theme.paddingXSmall),
        Text(value, style: theme.textTheme.bodySmall),
        Text(label, style: theme.textTheme.labelSmall),
      ],
    );
  }

  Widget _buildMediaControls(AppTheme theme, bool isWideScreen) {
    return SliverToBoxAdapter(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Now Playing: Song Title - Artist', style: theme.textTheme.bodySmall),
          SizedBox(height: theme.paddingXSmall),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(icon: const Icon(Ionicons.play_skip_back, size: 24), onPressed: () {}),
              IconButton(icon: const Icon(Ionicons.play, size: 24), onPressed: () {}),
              IconButton(icon: const Icon(Ionicons.play_skip_forward, size: 24), onPressed: () {}),
            ],
          ),
          if (isWideScreen) ...[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Ionicons.volume_low_outline, size: 24, color: theme.colorText),
                SizedBox(
                  width: 200,
                  child: Slider(
                    value: _volume,
                    onChanged: (value) {
                      setState(() => _volume = value);
                    },
                    activeColor: theme.colorAccent,
                    inactiveColor: theme.colorSurfaceDark,
                  ),
                ),
                Icon(Ionicons.volume_high_outline, size: 24, color: theme.colorText),
              ],
            )
          ] else ...[
            _buildVolumeSlider(theme)
          ]
        ],
      ),
    );
  }

  Widget _buildVolumeSlider(AppTheme theme) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(Ionicons.volume_low_outline, size: 20, color: theme.colorText),
        Expanded(
          child: Slider(
            value: _volume,
            onChanged: (value) {
              setState(() => _volume = value);
            },
            activeColor: theme.colorAccent,
            inactiveColor: theme.colorSurfaceDark,
          ),
        ),
        Icon(Ionicons.volume_high_outline, size: 20, color: theme.colorText),
      ],
    );
  }

  Widget _buildSystemMonitor(AppTheme theme) {
    // Mock data, replace with actual data fetching logic
    String storage = '64 GB';
    String ram = '8 GB';
    String wifi = 'Connected';
    String osName = 'Android';
    String osVersion = '11';
    String cpuTemp = '55°C';
    String gpuTemp = '50°C';

    return SliverToBoxAdapter(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildSystemMonitorItem('Storage', storage, theme),
          _buildSystemMonitorItem('RAM', ram, theme),
          _buildSystemMonitorItem('WiFi', wifi, theme),
          _buildSystemMonitorItem('OS Name', osName, theme),
          _buildSystemMonitorItem('OS Version', osVersion, theme),
          _buildSystemMonitorItem('CPU Temperature', cpuTemp, theme),
          _buildSystemMonitorItem('GPU Temperature', gpuTemp, theme),
        ],
      ),
    );
  }

  Widget _buildSystemMonitorItem(String label, String value, AppTheme theme) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: theme.paddingXSmall),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: theme.textTheme.bodySmall),
          Text(value, style: theme.textTheme.bodySmall),
        ],
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
