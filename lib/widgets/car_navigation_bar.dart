import 'dart:async';
import 'package:flutter/material.dart';
import 'package:inqcar/apps/launcher_app.dart';
import 'package:inqcar/constants/design_constants.dart';
import 'package:inqcar/models/car_application.dart';
import 'package:inqcar/widgets/car_tap_handler.dart';
import 'package:sprung/sprung.dart';

class CarNavigationBar extends StatefulWidget {
  const CarNavigationBar({
    super.key,
    required this.onApplicationTapped,
    this.currentApplication,
  });

  final FutureOr<void> Function(CarApplication app) onApplicationTapped;
  final CarApplication? currentApplication;

  @override
  State<CarNavigationBar> createState() => _CarNavigationBarState();
}

class _CarNavigationBarState extends State<CarNavigationBar> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;
  Map<CarApplication, bool> runningApps = {};
  bool _isMinimized = false;

  static const double kCollapsedHeight = 60;
  static const double kTitleBarHeight = 42;
  static const double kAppIconSize = 32;
  static const double kAppBarIconSize = 24;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    );
    _animation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    );
    for (var app in CarApplication.values) {
      runningApps[app] = false;
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final bool hasOpenApplication = widget.currentApplication != null;

    if (hasOpenApplication && !_isMinimized) {
      _controller.forward();
    } else {
      _controller.reverse();
    }

    return AnimatedContainer(
      duration: const Duration(milliseconds: 500),
      curve: Sprung.overDamped,
      height: hasOpenApplication && !_isMinimized ? MediaQuery.of(context).size.height - AppTheme.current.paddingLarge * 2 : kCollapsedHeight,
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppTheme.current.colorBackground,
        borderRadius: BorderRadius.circular(AppTheme.current.borderRadiusSmall),
        boxShadow: [AppTheme.current.defaultShadow],
      ),
      child: Column(
        children: [
          if (hasOpenApplication && !_isMinimized) buildTitleBar(),
          Expanded(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(AppTheme.current.paddingSmall),
              child: AnimatedSwitcher(
                duration: const Duration(milliseconds: 500),
                child: hasOpenApplication && !_isMinimized ? buildApplicationView() : buildNavigationRow(),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildTitleBar() {
    return Container(
      height: kTitleBarHeight,
      padding: EdgeInsets.symmetric(horizontal: AppTheme.current.paddingMedium),
      decoration: BoxDecoration(
        color: AppTheme.current.colorSurfaceLight,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(AppTheme.current.borderRadiusSmall),
          topRight: Radius.circular(AppTheme.current.borderRadiusSmall),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            widget.currentApplication!.name,
            style: AppTheme.current.textTheme.titleMedium,
          ),
          Row(
            children: [
              CarTapHandler(
                onTap: _minimizeApp,
                child: Icon(
                  Icons.minimize,
                  size: kAppBarIconSize,
                  color: AppTheme.current.greyPalette[8],
                ),
              ),
              SizedBox(width: AppTheme.current.paddingSmall),
              CarTapHandler(
                onTap: _closeApp,
                child: Icon(
                  Icons.close,
                  size: kAppBarIconSize,
                  color: AppTheme.current.greyPalette[8],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget buildApplicationView() {
    if (widget.currentApplication == CarApplication.apps) {
      return LauncherApp(
        onAppLaunched: _launchAppFromLauncher,
      );
    }

    return Stack(
      children: [
        widget.currentApplication?.widget ?? const Placeholder(),
        IgnorePointer(
          child: AnimatedBuilder(
            animation: _animation,
            builder: (context, child) {
              return Opacity(
                opacity: 1 - _animation.value,
                child: Container(
                  decoration: BoxDecoration(
                    color: AppTheme.current.colorBackground,
                    borderRadius: BorderRadius.circular(AppTheme.current.borderRadiusSmall),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  Widget buildNavigationRow() {
    final List<CarApplication> visibleApps = CarApplication.values.where((app) => app != CarApplication.apps).take(2).toList();
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        buildAppBarItem(visibleApps[0]),
        buildAppBarItem(CarApplication.apps),
        buildAppBarItem(visibleApps[1]),
      ],
    );
  }

  Widget buildAppBarItem(CarApplication app) {
    bool isRunning = runningApps[app] ?? false;
    return CarTapHandler(
      onTap: () => _openApp(app),
      child: Tooltip(
        message: app.name,
        child: SizedBox(
          width: kAppIconSize,
          height: kAppIconSize,
          child: Stack(
            alignment: Alignment.center,
            children: [
              Icon(
                app.icon,
                size: kAppBarIconSize,
                color: AppTheme.current.greyPalette[8],
              ),
              if (isRunning && app != CarApplication.apps)
                Positioned(
                  bottom: 2,
                  child: Container(
                    width: 4,
                    height: 4,
                    decoration: BoxDecoration(
                      color: AppTheme.current.colorAccent,
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }

  void _openApp(CarApplication app) {
    setState(() {
      if (app != CarApplication.apps) {
        runningApps[app] = true;
      }
      _isMinimized = false;
    });
    widget.onApplicationTapped(app);
  }

  void _launchAppFromLauncher(CarApplication app) {
    setState(() {
      runningApps[app] = true;
      runningApps[CarApplication.apps] = false;
      _isMinimized = false;
    });
    widget.onApplicationTapped(app);
  }

  void _minimizeApp() {
    setState(() {
      _isMinimized = true;
    });
  }

  void _closeApp() {
    if (widget.currentApplication != null) {
      setState(() {
        runningApps[widget.currentApplication!] = false;
        _isMinimized = true; // This line ensures the bar is minimized after closing
      });
      widget.onApplicationTapped(widget.currentApplication!);
    }
  }
}
